package jihyun.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.util.security.AES256;
import common.util.security.SecretMyKey;

public class MemberDAO implements InterMemberDAO {
	
	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
		
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
	public MemberDAO() {
		
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
	
	// 회원정보 중 포인트와 코인 업데이트 하기
	@Override
	public void updateCoin(String userid, int point, int coin) throws SQLException {

		try {
			conn = ds.getConnection();
			
			String sql = "update tbl_member_test set point = ? , coin =?\n"+
					"where userid = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, point);
			pstmt.setInt(2, coin);
			pstmt.setString(3, userid);
			
			pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
	}// end of  회원정보 중 포인트와 코인 업데이트 하기

}
