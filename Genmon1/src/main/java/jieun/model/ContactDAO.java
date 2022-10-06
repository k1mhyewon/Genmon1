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

import common.model.ContactVO;
import common.model.MemberVO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

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

		try {
			conn = ds.getConnection();
			
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
				+ " select contactid, email, ctype, contents, to_char(cregisterday,'yyyy-mm-dd hh24:mi:ss') as cregisterday " 
				+ " from v "	
				+ " order by cregisterday desc ";
			
			pstmt = conn.prepareStatement(sql);
			
			if(!"전체".equalsIgnoreCase(ctype)) {// 전체가 아니면
				pstmt.setString(1, ctype);
				pstmt.setString(2, ctype);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ContactVO cvo = new ContactVO();
				cvo.setContactid(rs.getString(1));
//				cvo.setFk_userid(rs.getString(2));
				cvo.setEmail(aes.decrypt(rs.getString(2)));
				cvo.setCtype(rs.getString(3));
				cvo.setContents(rs.getString(4));
				cvo.setCregisterday(rs.getString(5));
				
				contactList.add(cvo);
			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return contactList;
	}

	
	// 클릭한 한 문의글 정보 가져오기   
	@Override
	public ContactVO contactOneDetail(String contactid) throws SQLException {
		ContactVO cvo = new ContactVO();
		String mg = contactid.substring(0,1);
		boolean mgflag = "M".equalsIgnoreCase(mg)?  false : true; //  멤버문의글일경우 false 인 깃발   
		String sql="";
		try {
			conn = ds.getConnection();
			
			if(!mgflag) {// 회원글이라면 
				sql=" select  contactid, ctype, contents, to_char(cregisterday,'yyyy-mm-dd hh24:mi:ss') as cregisterday , email, fk_userid, name "
					+ " from tbl_member_contact_test c left join tbl_member_test m "
					+ " on c.fk_userid = m.userid "
					+ " where contactid = ? ";
			}
			else { // 비회원글이라면  
				sql=" select contactid, ctype, contents, to_char(cregisterday,'yyyy-mm-dd hh24:mi:ss') as cregisterday , email "
					+ " from tbl_guest_contact_test "
					+ " where contactid = ? ";
			} 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contactid);
			rs = pstmt.executeQuery();
			rs.next();
			
			cvo.setContactid(rs.getString(1));
			cvo.setCtype(rs.getString(2));
			cvo.setContents(rs.getString(3));
			cvo.setCregisterday(rs.getString(4));
// 첨부파일 
			cvo.setEmail(aes.decrypt(rs.getString(5)));
			
			if(!mgflag) {// 회원글이라면
				cvo.setFk_userid(rs.getString(6));
				
				MemberVO mvo = new MemberVO();
				mvo.setName(rs.getString(7));
				cvo.setMvo(mvo);
			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cvo;
	}

	
	
	// 멤버문의글 insert
	@Override
	public void insertMemberContact(ContactVO cvo) throws SQLException {
		
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_member_contact_test(contactid, fk_userid, ctype, contents, pwd)  "
						+ "values ('M'||to_char(sysdate,'yyyymmdd')||seq_tbl_member_contact_ctid.nextval, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cvo.getFk_userid());
			pstmt.setString(2, cvo.getCtype());
			pstmt.setString(3, cvo.getContents());
			pstmt.setString(4, Sha256.encrypt(cvo.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화를 시킨다.

			pstmt.executeUpdate();
		
		} finally {
			close();
		}
		
	}// end of public void insertMemberContact(ContactVO cvo) throws SQLException {}--------

	
	// 비회원문의글 insert
	@Override
	public void insertGuestContact(ContactVO cvo) throws SQLException {

		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_guest_contact_test(contactid, email, ctype, contents, pwd) "
						+ "values ('G'||to_char(sysdate,'yyyymmdd')||seq_tbl_guest_contact_ctid.nextval, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, aes.encrypt(cvo.getEmail()));	
			pstmt.setString(2, cvo.getCtype());
			pstmt.setString(3, cvo.getContents());
			pstmt.setString(4, Sha256.encrypt(cvo.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화를 시킨다.

			pstmt.executeUpdate();
		
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}// end of public void insertGuestContact(ContactVO cvo) throws SQLException {}--------------------

	
	
	
	
	
	
	
	
	
}
