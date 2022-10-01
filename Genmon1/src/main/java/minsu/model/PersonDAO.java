package minsu.model;

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

import common.model.MemberVO;
import common.util.security.AES256;
import common.util.security.SecretMyKey;
import util.security.Sha256;

public class PersonDAO implements InterPersonDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
		
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
	public PersonDAO() {
		
		try {
			Context initContext = new InitialContext(); // javax.naming import
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle"); // "jdbc/myoracle" 은 web.xml 에서 지정해둔 이름, context.xml 을 참조하고 있음
		    
		    aes = new AES256(SecretMyKey.KEY);// 우리가 만든 비밀키
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	// 사용한 자원을 반납하는 close매소드 생성하기=== //
		private void close() {
			
			try {
				
			if(rs != null)    {rs.close();     rs=null;}
			if(pstmt != null) {pstmt.close();  pstmt=null;}
			if(conn != null)  {conn.close();   conn=null;} // 이전까지는 conn을 싱글톤패턴기법으로 자원반납(close)을 하지 않았다
														   // 웹에서 싱글톤패턴기법을 사용하면 안된다 왜냐하면 이방법을 사용하면 용량아 딸리기때문이다.
			
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		////////////////////////////////////////////////////////////

		
		// 회원가입을 해주는 매소드(tbl_member 테이블 insert)
		@Override
		public int registerMember(MemberVO member) throws SQLException {
			
			int result = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = " insert into tbl_member(userid, pwd, name, email, mobile, gender, birthday, nation) "+
						 " values(?, ?, ?, ?, ?, ?, ?, ?) ";
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, member.getUserid() );
				pstmt.setString(2, Sha256.encrypt(member.getPwd()) );  // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.(단방향 암호화은 한번 암호화하면 해독불가. 복호화불가. )
				pstmt.setString(3, member.getName());
				pstmt.setString(4, aes.encrypt(member.getEmail()) );  // 이메일을 AES256 알고리즘으로 양방향 암호화 시킨다.(양방향 암호화은 한번 암호화하면 해독불가. 복호화가능)
				pstmt.setString(5, aes.encrypt(member.getMobile()) ); // 휴대폰번호를 AES256 알고리즘으로 양방향 암호화 시킨다.(양방향 암호화은 한번 암호화하면 해독불가. 복호화가능)
				pstmt.setString(6, member.getGender());
				pstmt.setString(7, member.getBirthday());
				
				result = pstmt.executeUpdate();
					
			} catch(GeneralSecurityException | UnsupportedEncodingException e) { // |는 OR(또는)
				e.printStackTrace();
			} finally {
				close();
			}
			
			return result;
		}
		

		// === 아이디가 중복되었는지 알아오는 메소드 === 
		@Override
		public boolean idDuplicateCheck(String userid)  throws SQLException {
			
			boolean isExists = false;
			
			try {
			 	conn = ds.getConnection();
				
				String sql = " select userid "
							+" from tbl_member"
							+" where userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				
				rs = pstmt.executeQuery();
				
				isExists = rs.next(); // 결과물. 행이 있으면(중복된 userid) true, 행이 없으면 false(사용가능한 userid)가 나온다.
				
			} finally {
				close();
			}
			
			return isExists;
		}

		
		
		
		
		
		
		
		
		
		
		
	
	

}
