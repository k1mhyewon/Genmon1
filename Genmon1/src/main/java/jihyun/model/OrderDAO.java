package jihyun.model;

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
import common.model.OrderVO;
import common.util.security.AES256;
import common.util.security.SecretMyKey;

public class OrderDAO implements InterOrderDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
		
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
	public OrderDAO() {
		
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


	// 회원 주문하기 insert (부모)
	@Override
	public int insertOrderMember(OrderVO ovo) throws SQLException {
		int result =0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into TBL_ORDER_TEST (pk_orderid, fk_userid, email, name, postcode, address, detailaddress, extraaddress, mobile)\n"+
					"values (TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_order.nextval, 4, 0),?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ovo.getFk_userid());
			pstmt.setString(2, aes.encrypt(ovo.getEmail()));
			pstmt.setString(3, ovo.getName());
			pstmt.setString(4, ovo.getPostcode());
			pstmt.setString(5, ovo.getAddress());
			pstmt.setString(6, ovo.getDetailaddress());
			pstmt.setString(7, ovo.getExtraaddress());
			pstmt.setString(8, aes.encrypt(ovo.getMobile()));
			
			result = pstmt.executeUpdate();
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) { // |는 OR(또는)
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return result;
	} // end of 회원 주문하기 insert (부모)


	
	// 비회원 주문하기 insert (부모)
	@Override
	public int insertOrderGuest(OrderVO ovo) throws SQLException {
int result =0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into TBL_ORDER_TEST (pk_orderid,  email, name, postcode, address, detailaddress, extraaddress, mobile)\n"+
					"values (TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_order.nextval, 4, 0),?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aes.encrypt(ovo.getEmail()));
			pstmt.setString(2, ovo.getName());
			pstmt.setString(3, ovo.getPostcode());
			pstmt.setString(4, ovo.getAddress());
			pstmt.setString(5, ovo.getDetailaddress());
			pstmt.setString(6, ovo.getExtraaddress());
			pstmt.setString(7, aes.encrypt(ovo.getMobile()));
			
			result = pstmt.executeUpdate();
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) { // |는 OR(또는)
			e.printStackTrace();
		}  finally {
			close();
		}
		
		
		return result;
	} // end of 비회원 주문하기 insert (부모)


	
	// 방금 insert 한 주문번호 알아오기
	@Override
	public String findOrderid() throws SQLException {
		String orderid = "";
		
		try {
			conn = ds.getConnection();
			
			String sql = "select TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_order.currval, 4, 0)\n"+
					"from dual";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			orderid = rs.getString(1);
			
		} finally {
			close();
		}
		
		return orderid;
	}// end of 방금 insert 한 주문번호 알아오기

	

	// 회원/비회원 주문하기 상세 insert (자식)
	@Override
	public int isertOrderDetail(CartVO cvo, String orderid)  throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_order_detail_test (pk_order_detail_id, fk_orderid, fk_pnum, order_price)\n"+
					"values (?||seq_tbl_order_detail.nextval, ?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderid);
			pstmt.setString(2, orderid);
			pstmt.setInt(3, cvo.getFk_pnum());
			
			// 세일이 있다면 세일가로
			if(cvo.getAllProdvo().getSalePcnt()!=0) {
				int price = cvo.getAllProdvo().getParentProvo().getPrice() * (100 - cvo.getAllProdvo().getSalePcnt() )/ 100;
				pstmt.setInt(4, price);
			} else { // 없다면 원가로
				pstmt.setInt(4, cvo.getAllProdvo().getParentProvo().getPrice());
			}
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		
		return result;
	}// end of 회원/비회원 주문하기 상세 insert (자식)
	
	
	
}
