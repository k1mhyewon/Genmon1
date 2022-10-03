package jieun.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
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

import common.model.AddImgVO;
import common.model.ChildProductVO;
import common.model.ContactVO;
import common.model.ParentProductVO;
import util.security.AES256;
import util.security.SecretMyKey;

public class ContactDAO implements InterContactDAO {

	//field
	private DataSource ds; // DataSource ds :  ds는데이타 소스 // 아파치 톰캣이 제공하는 DBCP(DB Connection Pool)이다. 풀장에 conn을 띄우기
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	// 생성자
	public ContactDAO() {
		
		try {
		  Context initContext = new InitialContext();
		  Context envContext  = (Context)initContext.lookup("java:/comp/env");
		  ds = (DataSource)envContext.lookup("jdbc/semi_oracle");

		  aes = new AES256(SecretMyKey.KEY);
			// SecretMyKey.KEY 은 우리가 만든 비밀키이다.
		}catch (NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) { // 암호화키 길이가 16글자 보다 적을경우 예외처리
			e.printStackTrace();
		}
		
	}
		
	// 사용한 자원 반납하는 close() 메소드 생성하기
	private void close() {
		//거꾸로 반납
		
		try {
			if(rs != null) { rs.close(); rs=null;}
			if(pstmt != null) { pstmt.close(); pstmt=null;}
			if(conn != null) { conn.close(); conn=null;} // connection풀링 기법 사용 : 웹은 싱클톤패턴기법 사용하면 메모리 부족해진다.
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	
	
	// 문의 유형에 따른 문의글 가져오기 
	@Override
	public List<ContactVO> selectContactList(Map<String, String> paraMap) throws SQLException {
		
		List<ContactVO> contactList = new ArrayList<>();
		String ctype = paraMap.get("ctype");
		String sql1 ="";
		try {
			conn = ds.getConnection();
			
//			if(!"전체".equalsIgnoreCase(ctype)) {// 전체가 아니면 
//				sql1 =  " where ctype = ? ";
//			}

//			String sql = "with v as "
//					+ " ( "
//					+ " select contactid, ctype, contents, cregisterday, email "
//					+ " from tbl_member_contact_test c left join tbl_member_test m "
//					+ " on c.fk_userid = m.userid "
//					+ sql1
//					+ " UNION ALL "
//					+ " select contactid, ctype, contents, cregisterday, email "
//					+ " from tbl_guest_contact_test "
//					+ sql1
//					+ " ) "
//					+ " select contactid, (select fk_userid from tbl_member_contact_test)as fk_userid, email, ctype, contents, to_char(cregisterday,'yyyy-mm-dd hh24:mi:ss') as cregisterday "
//					+ " from v "
//					+ " order by cregisterday desc ";
			
			String sql = "with v as "
					+ " ( "
					+ " select contactid, ctype, contents, cregisterday, email "
					+ " from tbl_member_contact_test c left join tbl_member_test m "
					+ " on c.fk_userid = m.userid ";
			if(!"전체".equalsIgnoreCase(ctype)) {// 전체가 아니면
				sql +=  " where ctype = ? ";
			}
			sql += " UNION ALL "
					+ " select contactid, ctype, contents, cregisterday, email "
					+ " from tbl_guest_contact_test ";
			if(!"전체".equalsIgnoreCase(ctype)) {// 전체가 아니면
				sql +=  " where ctype = ? ";
			}
			sql += "  ) "
				+ "select contactid, (select fk_userid from tbl_member_contact_test)as fk_userid, email, ctype, contents, to_char(cregisterday,'yyyy-mm-dd hh24:mi:ss') as cregisterday " 
				+ " from v "	
				+ " order by cregisterday desc ";
			
			pstmt = conn.prepareStatement(sql);
			
			if(!"전체".equalsIgnoreCase(ctype)) {// 전체가 아니면
				pstmt.setString(1, ctype);
				pstmt.setString(2, ctype);
			}
			
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ContactVO cvo = new ContactVO();
				cvo.setContactid(rs.getString(1));
				cvo.setFk_userid(rs.getString(2));
				cvo.setEmail(aes.decrypt(rs.getString(3)));
				cvo.setCtype(rs.getString(4));
				cvo.setContents(rs.getString(5));
				cvo.setCregisterday(rs.getString(6));
				
				contactList.add(cvo);
			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return contactList;
	}

	
	
	
	
	
	
	
	
	
}
