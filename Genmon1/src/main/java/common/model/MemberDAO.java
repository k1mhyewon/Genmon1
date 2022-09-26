package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

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
		    ds = (DataSource)envContext.lookup("jdbc/myoracle"); // "jdbc/myoracle" 은 web.xml 에서 지정해둔 이름, context.xml 을 참조하고 있음
		    
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
	
	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴해주는 메소드(로그인 처리)
	@Override
	public MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException {

MemberVO member = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "SELECT userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, "+
						"       birthyyyy, birthmm, birthdd, coin, point, registerday, pwdchangegap, "+
						"       nvl(lastlogingap, trunc( months_between(sysdate, registerday) ) ) AS lastlogingap "+
						"FROM "+
						"("+
						"    select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender "+
						"         , substr(birthday,1,4) AS birthyyyy, substr(birthday,6,2) AS birthmm, substr(birthday,9) AS birthdd "+
						"         , coin, point, to_char(registerday, 'yyyy-mm-dd') AS registerday "+
						"         , trunc( months_between(sysdate, lastpwdchangedate) ) AS pwdchangegap "+
						"    from tbl_member "+
						"    where status = 1 and userid = ? and pwd = ? "+ 
						") M "+
						"CROSS JOIN "+
						"("+
						"    select trunc( months_between(sysdate, max(logindate)) ) as lastlogingap "+
						"    from tbl_login_history "+
						"    where fk_userid = ? "+
						") H";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")) );
			pstmt.setString(3, paraMap.get("userid"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVO();
				
				member.setUserid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail( aes.decrypt(rs.getString(3)) );  // 복호화 
				member.setMobile( aes.decrypt(rs.getString(4)) ); // 복호화  
				member.setPostcode(rs.getString(5));
				member.setAddress(rs.getString(6));
				member.setDetailaddress(rs.getString(7));
				member.setExtraaddress(rs.getString(8));
				member.setGender(rs.getString(9));
				member.setBirthday(rs.getString(10) + rs.getString(11) + rs.getString(12));
				member.setCoin(rs.getInt(13));
				member.setPoint(rs.getInt(14));
				member.setRegisterday(rs.getString(15));
				
				if ( rs.getInt(16) >= 3 ) {
					// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
					// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false 
					
					member.setRequirePwdChange(true); // 로그인시 암호를 변경해라는 alert 를 띄우도록 할때 사용한다.
				}
				
				if ( rs.getInt(17) >= 12 ) {
					// 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정 
					member.setIdle(1);
					
					// === tbl_member 테이블의 idle 컬럼의 값을 1 로 변경하기 === //
					sql = " update tbl_member set idle = 1 "
						+ " where userid = ? "; 
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, paraMap.get("userid"));
					
					pstmt.executeUpdate();
				}
				
				// === tbl_login_history(로그인기록) 테이블에 insert 하기 === //
				if(member.getIdle() != 1) {
					sql = " insert into tbl_login_history(fk_userid, clientip) "
						+ " values(?, ?) ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, paraMap.get("userid"));
					pstmt.setString(2, paraMap.get("clientip"));
					
					pstmt.executeUpdate();
				}
				
			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return member;
	} // end of public MemberVO selectOneMember(Map<String, String> paraMap) ------------------


	
	
	
	// id 찾기(성명, 이메일을 입력받아서 해당 사용자의 아이디를 알려준다.) ==========================================
	@Override
	public String idFind(Map<String, String> paraMap) throws SQLException {
		

		String userid = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid "
					   + " from tbl_member "
					   + " where status = 1 and name = ? and email = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("name"));
			pstmt.setString(2, aes.encrypt( paraMap.get("email") ));
			
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				userid = rs.getString(1);
			}
					
		} catch(GeneralSecurityException | UnsupportedEncodingException e) { // 암호화 catch
			e.printStackTrace();
		} finally {
			close();
		}
		
		return userid;
		
	} // end of public String idFind(Map<String, String> paraMap) throws SQLException {} =========

}
