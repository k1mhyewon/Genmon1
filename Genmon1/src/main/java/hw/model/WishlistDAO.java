package hw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.model.ChildProductVO;
import common.model.ParentProductVO;



public class WishlistDAO implements InterWishlistDAO {
	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
		public WishlistDAO() {
			
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

	
		
		
		
		
		
		
		
		
		
		
	// 위시리스트를 select 해오는 메소드 ------------------------------------------------------------------------
	@Override
	public List<WishlistVO> selectWishlist(String userid) throws SQLException {
		
		List<WishlistVO> wishList = new ArrayList<>();
		
		try {
			conn = ds.getConnection(); // 풀장에 둥둥 떠있던 conn 하나를 가져옴
			
			String sql = " select W.fk_userid, W.fk_pnum, A.pimage1, P.pname, P.price, A.pcolor, A.salepcnt "+
						 " from tbl_wishlist_test W "+
						 " JOIN tbl_all_product_test A "+
						 " on W.fk_pnum = A.pnum "+
						 " JOIN tbl_product_test P "+
						 " on A.fk_pid = P.pid "+
						 " where W.fk_userid = ? "+
						 " order by add_date";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				
				WishlistVO wishvo = new WishlistVO();
				ChildProductVO cpvo = new ChildProductVO();
				ParentProductVO ppvo = new ParentProductVO();
				
				wishvo.setFk_userid(rs.getString(1));
				wishvo.setFk_pnum(rs.getString(2));
				
				cpvo.setPimage1(rs.getString(3));
				
				ppvo.setPname(rs.getString(4)+"("+rs.getString(6).substring(0, 2).toUpperCase()+")");
				ppvo.setPrice(rs.getInt(5));
				
				cpvo.setSalePcnt(rs.getInt(7));
				
				cpvo.setParentProvo(ppvo);
				wishvo.setCpvo(cpvo);
				
				wishList.add(wishvo);
			}
			
		} finally {
			close();
		}
		
		return wishList;
	} // end of public List<WishlistVO> selectWishlist(String userid) throws SQLException {} -----------

	
	
	
	
	
	
	
	
	
	// 위시리스트 중 개별 상품에서 삭제 버튼을 눌렀을 때 그 상품만 delete 해오는 메소드 ------------------------------------------------
	@Override
	public int deleteWishlist(Map<String, String> paraMap) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection(); // 풀장에 둥둥 떠있던 conn 하나를 가져옴
			
			String sql = "delete from TBL_WISHLIST_TEST where fk_userid = ? and fk_pnum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("pnum"));
			
			result = pstmt.executeUpdate();
			
			
		} finally {
			close();
		}
		
		return result;
	} // end of public int deleteWishlist(Map<String, String> paraMap) throws SQLException {} -----------------------

	
	
	
	// 위시리스트에서 장바구니로 insert -------------------------------------------------------------------------------------
	@Override
	public int wishToCartInsert(Map<String, String> paraMap) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_basket_test(fk_userid, fk_pnum, qty) \n"+
						 "values (?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("pnum"));
			pstmt.setString(3, "1" );
			
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		
		return result;
	} // end of public int wishToCart(Map<String, String> paraMap) throws SQLException {} ----------------------------

	
	
	
	
	
	// 위시리스트에서 장바구니로 update (이미 장바구니에 해당 상품이 존재하는 경우) ----------------------------------------------------
	@Override
	public int wishToCartUpdate(Map<String, String> paraMap) {
		
		int result = 0;
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = "UPDATE tbl_basket_test SET qty = ? WHERE fk_userid = ? and fk_pnum = ?";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, paraMap.get("qty"));
			 pstmt.setString(2, paraMap.get("userid")); 
			 pstmt.setString(3, paraMap.get("pnum"));
			  
			 result = pstmt.executeUpdate();
			 
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return result;
		
	} // end of public int wishToCartUpdate(Map<String, String> paraMap) {} ------------------------------------------

	
	
	
	
	
	
	// 상품상세에서 위시리스트로 insert --------------------------------------------------------------------------------------
	@Override
	public int addToWish(String userid, String pnum) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_wishlist_test(fk_userid, fk_pnum) \n"+
						 "values (?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, pnum);
			
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		
		return result;
	} // end of public int addToWish(String userid, String pnum) throws SQLException {} -------------------------------

	
	
	
	
	// 이미 위시리스트에 있는 상품인지 확인 --------------------------------------------------------------------------------------
	@Override
	public int isWishExist(String userid, String pnum) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection(); // 풀장에 둥둥 떠있던 conn 하나를 가져옴
			
			String sql = " select * from tbl_wishlist_test where fk_userid = ? and fk_pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, pnum);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				n = 1;
			}
			
		} finally {
			close();
		}
		
		return n;
	} // end of public int isWishExist(String userid, String pnum) throws SQLException {} ------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	// 리뷰페이지에서 하트 개수 알아오기 -------------------------------
	@Override
	public int wishCount(String pnum) throws SQLException {

		int cnt = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select count(fk_pnum)\n"+
					"from tbl_wishlist_test\n"+
					"where fk_pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery(); // 돌려라!
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			// System.out.println("cnt : "+cnt);
			
		} finally {
			close();
		}
		
		return cnt;
	}
}
