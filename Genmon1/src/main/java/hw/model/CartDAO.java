package hw.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.model.CartVO;
import common.util.security.AES256;
import common.util.security.SecretMyKey;
import util.security.Sha256;

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
	
	

}
