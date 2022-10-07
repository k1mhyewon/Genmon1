package hw.model;

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

import common.model.MemberVO;
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
	
	
	
	// 리뷰보기 페이지에서 상품정보 알아오기 ----------------------------------------------------------------
	@Override
	public Map<String, String> getProdInfo(String pnum) throws SQLException {
		
		Map<String, String> prodMap = new HashMap<>();
		
		// System.out.println("dao pnum: "+ pnum);
		
		try {
			
			conn = ds.getConnection();
			
			// 상품정보 이름, 가격, 사진 알아오기
			String sql = "select P.pname|| ' ' || upper(substr(A.pcolor,1,2)) as pname, P.price, A.pimage1\n"+
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
			
			if(rs.next()) {
				
				prodMap.put("replyCnt", rs.getString(1));
				
			}
			
		} finally {
			close();
		}
		
		
		
		return prodMap;
	} // end of public Map<String, String> getProdInfo(String pnum) throws SQLException {} --------

	
	
	
	
	
	// 리뷰보기 페이지에서 리뷰목록 데이터 얻어오기 ------------------------------------------------------------
	@Override
	public List<ReviewVO> getReviews(String pnum) throws SQLException {
		
		List<ReviewVO> reviewList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select R.content, R.img, R.star,\n"+
						"       to_char(R.uploaddate, 'yyyy-mm-dd hh24:mi') as uploaddate, NVL(R.reply, '없음') as reply, \n"+
						"       substr(O.fk_userid, 1, LENGTH(O.fk_userid)-2) || LPAD('*', LENGTH(O.fk_userid)-2, '*') as fk_userid\n"+
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
			
			while(rs.next()) {
				
	            String content = rs.getString(1);
	            String img = rs.getString(1);
	            String star = rs.getString(3);
	            String uploaddate = rs.getString(4);
	            String reply = rs.getString(5);
	            String fk_userid = rs.getString(6);
	            
	            
	            ReviewVO rvo = new ReviewVO();
	            
	            rvo.setContent(content);
	            rvo.setImg(img);
	            rvo.setReply(reply);
	            rvo.setStar(star);
	            rvo.setUploaddate(uploaddate);
	            
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

	
	
}
