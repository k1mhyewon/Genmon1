package hw.model;

import java.io.UnsupportedEncodingException;
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
import common.model.CartVO;
import common.model.ParentProductVO;
import common.util.security.AES256;
import common.util.security.SecretMyKey;

public class CartDAO implements InterCartDAO {

	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
		
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
	public CartDAO() {
		
		try {
			Context initContext = new InitialContext(); // javax.naming import
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle"); // "jdbc/myoracle" 은 web.xml 에서 지정해둔 이름, context.xml 을 참조하고 있음
		    
		    aes = new AES256(SecretMyKey.KEY);
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
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




	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// (일단) 로그인된 회원의 장바구니 insert ------------------------------------------------------------------------
	@Override
	public int cartInsert(CartVO cart) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_basket_test(fk_userid, fk_pnum, qty) \n"+
						 "values (?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart.getFk_userid());
			pstmt.setInt(2, cart.getFk_pnum() );
			pstmt.setInt(3, cart.getQty() );
			
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		
		return result;
	} // end of public int cartInsert(CartVO cart) throws SQLException {} -------------------------------------


	
	
	
	
	
	
	
	// 로그인된 회원의 장바구니 insert 하기 전에 이미 장바구니에 존재하는 상품이 있는지 확인하고 개수 리턴(없다면 0) ---------------------------------------
	@Override
	public int isCartExist(String fk_userid, int fk_pnum) throws SQLException {
		
		int isCartExist = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select qty\n"+
					"from tbl_basket_test\n"+
					"where fk_userid = ? and fk_pnum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fk_userid);
			pstmt.setInt(2, fk_pnum);
			
			rs = pstmt.executeQuery(); // 돌려라!
			
			if(rs.next()) { // 있냐? 없냐? 행이 있으면(중복된 email) true,
				
				isCartExist = Integer.parseInt(rs.getString(1));
				
			}
			else {
				isCartExist = 0;
			}
			                      //          행이 없으면(사용가능한 email) false
					
		} finally {
			close();
		}
		
		
		return isCartExist;
	} // end of public boolean isCartExist(String fk_userid, int fk_pnum) throws SQLException {} ---------------


	
	
	
	
	
	// 로그인된 회원의 장바구니에 이미 장바구니에 존재하는 상품이 있다면 업데이트 --------------------------------------------------
	@Override
	public int cartUpdate(String fk_userid, int fk_pnum, int updateQty) throws SQLException {
		
		int result = 0;
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = "UPDATE tbl_basket_test SET qty = ? WHERE fk_userid = ? and fk_pnum = ?";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setInt(1, updateQty);
			 pstmt.setString(2, fk_userid ); 
			 pstmt.setInt(3, fk_pnum ); 
			  
			 result = pstmt.executeUpdate();
			 
		} finally {
			close();
		}
		
		return result;
	} // end of public int cartUpdate(String fk_userid, int fk_pnum, int updateQty) throws SQLException {} -----


	
	
	
	
	
	
	
	
	// 로그인된 회원의 장바구니 전체 조회 ---------------------------------------------------------------------------------
	@Override
	public List<CartVO> memberCartSelect(String fk_userid) throws SQLException {
		
		List<CartVO> cartList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select B.fk_userid, B.fk_pnum, P.pid, A.pimage1, P.pname, P.price, A.pcolor, qty\n"+
					"						 from tbl_basket_test B \n"+
					"						 JOIN tbl_all_product_test A \n"+
					"						 on B.fk_pnum = A.pnum\n"+
					"						 JOIN tbl_product_test P\n"+
					"						 on A.fk_pid = P.pid\n"+
					"						 where B.fk_userid = ? \n"+
					"						 order by updatedate desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fk_userid);
			
			rs = pstmt.executeQuery(); // 돌려라!
			
			while( rs.next() ) {
				
				CartVO cart = new CartVO();
				ChildProductVO apvo = new ChildProductVO();
				ParentProductVO pvo = new ParentProductVO();
				
				cart.setFk_userid(rs.getString(1));
				cart.setFk_pnum(rs.getInt(2));

				apvo.setFk_pid(rs.getString(3));
				apvo.setPimage1(rs.getString(4));
				
				pvo.setPname(rs.getString(5) + " " + rs.getString(7).substring(0, 2).toUpperCase());
				pvo.setPrice(rs.getInt(6));

				apvo.setParentProvo(pvo);
				cart.setAllProdvo(apvo);
				
				cart.setQty(rs.getInt(8));
				
				cartList.add(cart);
			}
					
		} finally {
			close();
		}

		
		return cartList;
	} // end of public int memberCartSelect(String fk_userid) {} ------------------------------------------------


	
	// 로그인 된 회원의 장바구니에서 상품 1나 삭제하기
	@Override
	public int cartDeleteOne(Map<String, String> paraMap) throws SQLException {
		
		int result = 0;
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = "delete from tbl_basket_test \n"+
						"where FK_USERID = ? and  FK_PNUM = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, paraMap.get("loginUserid"));
			 pstmt.setString(2, paraMap.get("pnum"));
			 
			 result = pstmt.executeUpdate();
			 
		} finally {
			close();
		}
		
		return result;
	} // end of  로그인 된 회원의 장바구니에서 상품 1나 삭제하기


	
	// 반복문을 사용하여 주문 상품의 모든 정보 끌어오기 
	@Override
	public CartVO selectOneOrder(String pnum, String qty) throws SQLException {
		CartVO cvo = null;
		try {
			 conn = ds.getConnection();
			 
			 String sql = "select pnum, pcolor ,pimage1,salePcnt,pname,price \n"+
					 "from tbl_product_test\n"+
					 "JOIN tbl_all_product_test \n"+
					 "ON pid = fk_pid\n"+
					 "where pnum = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, pnum);
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 cvo = new CartVO();
				 cvo.setFk_pnum(rs.getInt(1));
				 cvo.setQty(Integer.parseInt(qty));
				 
				 ChildProductVO cpvo = new ChildProductVO();
				 cpvo.setPcolor(rs.getString(2));
				 cpvo.setPimage1(rs.getString(3));
				 cpvo.setSalePcnt(rs.getInt(4));
				 
				 ParentProductVO ppvo = new ParentProductVO();
				 ppvo.setPname(rs.getString(5));
				 ppvo.setPrice(rs.getInt(6));
				 cpvo.setParentProvo(ppvo);
				 
				 cvo.setAllProdvo(cpvo);
			 }
			 
		} finally {
			close();
		}
		return cvo;
	} // 반복문을 사용하여 주문 상품의 모든 정보 끌어오기 


	
	
	// 주문 완료 후 회원 장바구니 비워주깅
	@Override
	public int deleteOrderedList(List<CartVO> ordertList, String fk_userid) throws SQLException {
		int result = 0;
		
		try {
			 
			 for( CartVO cvo: ordertList) {
				 conn = ds.getConnection();
				 
				 String sql = "delete from tbl_basket_test\n"+
						 "where FK_USERID = ? and  FK_PNUM = ?";
				 
				 pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1, fk_userid);
				 pstmt.setInt(2, cvo.getFk_pnum());
				 
				 result  += pstmt.executeUpdate();
			 }
			 
		} finally {
			close();
		}
		
		return result;
	} // end of 주문 완료 후 회원 장바구니 비워주깅


	
	
	
	
	
	// 카트 개수 구하기 ----------------------------------------------------------------------------------
	@Override
	public int countCart(String userid) throws SQLException {
		
		int cnt = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(fk_pnum) from tbl_basket_test where fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery(); // 돌려라!
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			// System.out.println("cnt : "+cnt);
			
		} finally {
			close();
		}
		
		return cnt;
	} // end of public int countCart(String userid) throws SQLException {} ---------------------------
	
	

}
