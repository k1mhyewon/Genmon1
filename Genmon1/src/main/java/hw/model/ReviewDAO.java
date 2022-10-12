package hw.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.model.ChildProductVO;
import common.model.ContactVO;
import common.model.MemberVO;
import common.model.OrderDetailVO;
import common.model.OrderVO;
import common.model.ParentProductVO;
import common.model.ReviewVO;

public class ReviewDAO implements InterReviewDAO {


	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
	public ReviewDAO() {
		
		try {
		
		Context initContext = new InitialContext(); // javax.naming import
	    Context envContext  = (Context)initContext.lookup("java:/comp/env");
	    ds = (DataSource)envContext.lookup("jdbc/semi_oracle"); // "jdbc/myoracle" 은 web.xml 에서 지정해둔 이름, context.xml 을 참조하고 있음
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		
		try {
			if( rs != null )    { rs.close();    rs=null; }
			if( pstmt != null ) { pstmt.close(); pstmt=null; }
			if( conn != null )  { conn.close();  conn=null; }
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public String star_shape(String star) {
		switch (star) {
		case "1":
			star = "★☆☆☆☆";
			break;
		case "2":
			star = "★★☆☆☆";
			break;
		case "3":
			star = "★★★☆☆";
			break;
		case "4":
			star = "★★★★☆";
			break;
		case "5":
			star = "★★★★★";
			break;
		}
		
		return star;
	}
	
	
	// 리뷰보기 페이지에서 상품정보 알아오기 ----------------------------------------------------------------
	@Override
	public Map<String, String> getProdInfo(String pnum) throws SQLException {
		
		Map<String, String> prodMap = new HashMap<>();
		
		// System.out.println("dao pnum: "+ pnum);
		
		try {
			
			conn = ds.getConnection();
			
			// 상품정보 이름, 가격, 사진 알아오기
			String sql = "select P.pname|| ' ' || upper(substr(A.pcolor,1,2)) as pname, P.price, A.pimage1, A.pnum\n"+
						 "from tbl_all_product_test A\n"+
						 "JOIN tbl_product_test P\n"+
						 "ON A.fk_pid = P.pid\n"+
						 "where A.pnum = ?";
			
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				prodMap.put("pname", rs.getString(1));
				prodMap.put("price", rs.getString(2));
				prodMap.put("pimage1", rs.getString(3));
				prodMap.put("pnum", rs.getString(4));
				
			}
			
			// 리뷰 개수 알아오기
			sql = "select count(R.reviewid)\n"+
					"from tbl_review_test R\n"+
					"JOIN tbl_order_detail_test D\n"+
					"ON R.fk_pk_order_detail_id = D.pk_order_detail_id\n"+
					"where d.fk_pnum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery();
			
			
			if( rs.next() ) { // rs.next()
				prodMap.put("replyCnt", rs.getString(1));
				
				
				// 리뷰 평균 별점 알아오기
				sql = "select trunc(avg(R.star),1) as avg_star\n"+
						"from tbl_review_test R\n"+
						"JOIN tbl_order_detail_test D\n"+
						"ON R.fk_pk_order_detail_id = D.pk_order_detail_id\n"+
						"JOIN tbl_order_test O\n"+
						"ON D.fk_orderid  = O.pk_orderid\n"+
						"JOIN tbl_all_product_test A\n"+
						"ON D.fk_pnum = A.pnum\n"+
						"where A.pnum = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pnum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next() && rs.getString(1) != null) {
					prodMap.put("avg_star", rs.getString(1));
					if(rs.getString(1).length() == 1) {
						prodMap.put("avg_star_shape", star_shape(rs.getString(1)));
										
					}
					else if(rs.getString(1).length() > 1) {
						String avg_star_cut = rs.getString(1).substring(0, 1);
						prodMap.put("avg_star_shape", star_shape(avg_star_cut));
					}
					
				}
			}
			
			
			
			
		} finally {
			close();
		}
		
		
		
		return prodMap;
	} // end of public Map<String, String> getProdInfo(String pnum) throws SQLException {} --------

	
	
	
	
	
	// 리뷰보기 페이지에서 리뷰목록 데이터 얻어오기 ------------------------------------------------------------
	@Override
	public List<ReviewVO> getReviews(String pnum, String currentShowPageNo, String searchType) throws SQLException {
		
		List<ReviewVO> reviewList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select content, NVL(img_orginfilename, '없음') as img_orginfilename , star, uploaddate, reply, fk_userid, reviewid, pnum\n"+
					"from\n"+
					"(\n"+
					"    select rownum as rno, content, img_orginfilename, star, uploaddate, reply, fk_userid, reviewid, pnum\n"+
					"    from\n"+
					"    (\n"+
					"        select R.content, r.img_orginfilename, R.star, "+
					"               to_char(R.uploaddate, 'yyyy-mm-dd hh24:mi') as uploaddate, NVL(R.reply, '없음') as reply, O.fk_userid, R.reviewid, A.pnum \n"+
					"        from tbl_review_test R\n"+
					"        JOIN tbl_order_detail_test D\n"+
					"        ON R.fk_pk_order_detail_id = D.pk_order_detail_id\n"+
					"        JOIN tbl_order_test O\n"+
					"        ON D.fk_orderid  = O.pk_orderid\n"+
					"        JOIN tbl_all_product_test A\n"+
					"        ON D.fk_pnum = A.pnum\n"+
					"        JOIN tbl_product_test P\n"+
					"        ON A.fk_pid = P.pid\n"+
					"        where A.pnum = ? ";
			
				
			
			if(searchType != null && "uploaddate".equalsIgnoreCase(searchType)) {
				sql += "order by uploaddate desc";
			}
			else if(searchType != null && "starhigh".equalsIgnoreCase(searchType)) {
				sql += "order by star desc";
			}
			else if(searchType != null && "starlow".equalsIgnoreCase(searchType)) {
				sql += "order by star asc";
			}
			else { 
				sql += "order by uploaddate desc";
			}
			
			
			
			sql +="    ) V\n"+
					") T\n"+
					"where rno between ? and ?";
			
			int int_currentShowPageNo = Integer.parseInt(currentShowPageNo);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pnum);	
			pstmt.setInt(2, (int_currentShowPageNo*5) - (5 - 1) );
			pstmt.setInt(3, (int_currentShowPageNo*5) );
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
	            String content = rs.getString(1);
	            String img = rs.getString(2);
	            String star = rs.getString(3);
	            String uploaddate = rs.getString(4);
	            String reply = rs.getString(5);
	            String fk_userid = rs.getString(6);
	            String reviewid = rs.getString(7);
	            
	            ReviewVO rvo = new ReviewVO();
	            
	            ChildProductVO cpvo = new ChildProductVO();
	            
	            rvo.setContent(content);
	            rvo.setImg_orginFileName(img);
	            rvo.setReply(reply);
	            rvo.setStar(star_shape(star));
	            rvo.setUploaddate(uploaddate);
	            rvo.setReviewid(reviewid);
	            
	            
	            MemberVO mvo = new MemberVO();
	            
	            mvo.setUserid(fk_userid);
	            
	            rvo.setMvo(mvo);
	            
	            reviewList.add(rvo);
	            
			}
			
		} finally {
			close();
		}
		
		
		return reviewList;
	} // end of public List<ReviewVO> getReviews(String pnum) {} -----------------------------------

	
	
	
	
	
	// 로그인된 회원의 작성가능 리뷰 상품 목록 얻어오기 ---------------------------------------------------------
	@Override
	public List<OrderDetailVO> getUnwrittenReviews(String userid) throws SQLException {
		
		// System.out.println("dao 옴");
		
		List<OrderDetailVO> canReviewProdList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select D.fk_pnum, A.pimage1, P.pname|| ' ' || upper(substr(A.pcolor,1,2)) as pname, pk_order_detail_id\n"+
						 "from tbl_order_detail_test D\n"+
						 "JOIN tbl_order_test O\n"+
						 "ON O.pk_orderid = D.fk_orderid\n"+
						 "JOIN tbl_all_product_test A\n"+
						 "ON D.fk_pnum = A.pnum\n"+
						 "JOIN tbl_product_test P\n"+
						 "ON A.fk_pid = P.pid\n"+
						 "where O.fk_userid = ? and D.order_status = '5' or O.fk_userid = ? and D.order_status = '4'";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userid);
			
			rs = pstmt.executeQuery();
			
			// System.out.println("sql 돌림");
			
			while(rs.next()) {
	            String fk_pnum = rs.getString(1);
	            String pimage1 = rs.getString(2);
	            String pname = rs.getString(3);
	            String order_detail_id = rs.getString(4);
	            
	            ChildProductVO cpvo = new ChildProductVO();
	            
	            cpvo.setPimage1(pimage1);
	            cpvo.setPnum(Integer.parseInt(fk_pnum));
	            
	            ParentProductVO ppvo = new ParentProductVO();
	            OrderDetailVO odvo = new OrderDetailVO();
	            
	            odvo.setPk_order_detail_id(order_detail_id);
	            
	            ppvo.setPname(pname);
	            cpvo.setParentProvo(ppvo);
	            odvo.setCpvo(cpvo);
	            
	            canReviewProdList.add(odvo);
	            
			}
			
		} finally {
			close();
		}
		
		return canReviewProdList;
	} // end of public List<ChildProductVO> getUnwrittenReviews(String userid) {} ------------------

	
	
	
	
	
	
	
	
	
	// 리뷰 테이블에 insert -----------------------------------------------------------------------------
	@Override
	public int reviewInsert(ReviewVO rvo) throws SQLException {
		
		int result = 0;
		
		try {
	         conn = ds.getConnection();
	         
	         String sql = " insert into tbl_review_test(reviewid, fk_pk_order_detail_id, content, img_systemFileName, img_orginFileName, star) " +  
	                    " values(seq_tbl_review_reviewid.nextval,?,?,?,?,?)";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, rvo.getFk_pk_order_detail_id());
	         pstmt.setString(2, rvo.getContent());
	         pstmt.setString(3, rvo.getImg_systemFileName());
	         pstmt.setString(4, rvo.getImg_orginFileName());
	         pstmt.setString(5, rvo.getStar());
	            
	         result = pstmt.executeUpdate();
	         
	         if(result == 1) {
	        	 
	        	 sql = "update tbl_order_detail_test set order_status = '6'\n"+
	        			 "where pk_order_detail_id = ?";
	        	 
	        	 pstmt = conn.prepareStatement(sql);
				 
				 pstmt.setString(1, rvo.getFk_pk_order_detail_id());
				  
				 result = pstmt.executeUpdate();
	         }
	         
	      } finally {
	         close();
	      }
		
		return result;
	} // end of public int reviewInsert(ReviewVO rvo) throws SQLException {} ------------------------

	
	
	
	
	
	
	// 리뷰 삭제하기 ------------------------------------------------------------------------------------
	@Override
	public int deleteReview(String reviewid) throws SQLException {
		
		int result = 0;
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = "delete from tbl_review_test \n"+
						  "where reviewid = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, reviewid);
			 
			 result = pstmt.executeUpdate();
			 
		} finally {
			close();
		}
		
		return result;
		
	} // end of public int deleteReview(String reviewid) throws SQLException {} ----------------------

	
	
	
	
	
	
	// 리뷰 댓글 삭제하기 ----------------------------------------------------------------------------------
	@Override
	public int deleteReviewReply(String reviewid) throws SQLException {
		
		int result = 0;
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " update tbl_review_test set reply = null where reviewid = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, reviewid);
			 
			 result = pstmt.executeUpdate();
			 
		} finally {
			close();
		}
		
		return result;
		
	} // end of public int deleteReviewReply(String reviewid) throws SQLException {} ------------------

	
	
	
	
	
	
	// 리뷰 댓글 달기 ------------------------------------------------------------------------------------
	@Override
	public int insertReply(String reviewid, String reply_content) throws SQLException {
		
		int result = 0;
		
		try {
	         conn = ds.getConnection();
	         
	         String sql = " update tbl_review_test set reply = ? where reviewid = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, reply_content);
	         pstmt.setString(2, reviewid);
	         
	         result = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
		
		return result;
	} // end of public int insertReply(String reviewid) throws SQLException {} -----------------------

	
	
	
	// 관리자용 리뷰 리스트 select 해오기
	@Override
	public List<ReviewVO> selectReviewListforAdmin(Map<String, String> paraMap) throws SQLException {
		
		List<ReviewVO> reviewList = new ArrayList<>();
		
		String type = paraMap.get("type");
		
		// System.out.println("dao 확인용 type: "+ type);
		
		try {
			conn = ds.getConnection();
			
			String sql = "select O.fk_userid, R.fk_pk_order_detail_id, R.content, to_char(R.uploaddate,'yyyy-mm-dd hh24:mi') as uploaddate , R.img_orginfilename, R.star, R.reply \n"+
					"from tbl_review_test R\n"+
					"JOIN tbl_order_detail_test D\n"+
					"ON D.pk_order_detail_id = R.fk_pk_order_detail_id\n"+
					"JOIN tbl_order_test O\n"+
					"ON D.fk_orderid = O.pk_orderid ";
			
			if("미답변".equalsIgnoreCase(type)) {// 미답변 목록이라면
				sql +=  " where R.reply is null ";
			}
			else if("답변".equalsIgnoreCase(type)) {// 답변 목록이라면
				sql +=  " where R.reply is not null ";
			}
			sql += " order by uploaddate desc ";
						
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewVO rvo = new ReviewVO();
				
				rvo.setFk_pk_order_detail_id(rs.getString(2));
				rvo.setContent(rs.getString(3));
				rvo.setUploaddate(rs.getString(4));
				rvo.setImg_orginFileName(rs.getString(5));
				rvo.setStar(rs.getString(6));
				rvo.setReply(rs.getString(7));
				
				OrderDetailVO odvo = new OrderDetailVO();
				OrderVO ovo = new OrderVO();
				
				ovo.setFk_userid(rs.getString(1));
				odvo.setOvo(ovo);
				rvo.setOdvo(odvo);
				
				reviewList.add(rvo);
				
			}
			
		} finally {
			close();
		}
		
		return reviewList;
	}

	
	
	
	
	
	// 관리자용 팝업창 단일 리뷰 select 해오기
	@Override
	public ReviewVO getOneReview(String orderDetailId) throws SQLException {
		
		ReviewVO rvo = new ReviewVO();
		
		try {
			conn = ds.getConnection();
			
			
			String sql = "select O.fk_userid, R.fk_pk_order_detail_id, R.content, to_char(R.uploaddate,'yyyy-mm-dd hh24:mi') as uploaddate , R.img_orginfilename, R.star, R.reply, R.reviewid \n"+
					"from tbl_review_test R\n"+
					"JOIN tbl_order_detail_test D\n"+
					"ON D.pk_order_detail_id = R.fk_pk_order_detail_id\n"+
					"JOIN tbl_order_test O\n"+
					"ON D.fk_orderid = O.pk_orderid\n"+
					"where R.fk_pk_order_detail_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderDetailId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				rvo.setFk_pk_order_detail_id(rs.getString(2));
				rvo.setContent(rs.getString(3));
				rvo.setUploaddate(rs.getString(4));
				rvo.setImg_orginFileName(rs.getString(5));
				
				String star_shape = star_shape(rs.getString(6));
				
				rvo.setStar(star_shape);
				rvo.setReply(rs.getString(7));
				rvo.setReviewid(rs.getString(8));
				
				OrderDetailVO odvo = new OrderDetailVO();
				OrderVO ovo = new OrderVO();
				ovo.setFk_userid(rs.getString(1));
				odvo.setOvo(ovo);
				rvo.setOdvo(odvo);
				
			}
			
			
		} finally {
			close();
		}
		
		return rvo;
	}

	
	
	
	
	
	
	// 리뷰 페이지수 알아오기 ------------------------------------------------------------------------
	@Override
	public int getTotalPage(String pnum) throws SQLException {
		
		int totalPage = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select ceil(count(reviewid)/5)\n"+
					"from tbl_review_test R\n"+
					"JOIN tbl_order_detail_test D\n"+
					"on R.fk_pk_order_detail_id = D.pk_order_detail_id\n"+
					"where fk_pnum = ? ";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			
			totalPage = rs.getInt(1);
			
			// System.out.println("리뷰 dao 645 totalPage: "+totalPage);
			
			
		} finally {
			close();
		}
		
		return totalPage;
	} // end of public int getTotalPage(String pnum) throws SQLException {} --------------------

	
	
	
	
	
	
	
	
	
	
	
	// 상품상세페이지에서 리뷰 개수 알아오기 --------------------------------------------------------------
	@Override
	public int getReviewCnt(String pnum) throws SQLException {
		
		int cnt = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select count(R.reviewid)\n"+
					"from tbl_review_test R\n"+
					"JOIN tbl_order_detail_test D\n"+
					"ON R.fk_pk_order_detail_id = D.pk_order_detail_id\n"+
					"where d.fk_pnum = ?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			cnt = rs.getInt(1);
			
			
		} finally {
			close();
		}
		
		return cnt;
	} // end of public int getReviewCnt(String pnum) throws SQLException {} ---------------------

	
	
	
	
	
}
