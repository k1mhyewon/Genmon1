package jieun.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
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
					+ " select contactid, ctype, contents, cregisterday, email, nvl2(answerid,1,0) as status "
					+ " from tbl_member_contact c left join tbl_member_test m "
					+ " on c.fk_userid = m.userid "
					+ " left join tbl_member_contact_answer a "
					+ " on a.fk_contactid = c.contactid ";
			if(!"전체".equalsIgnoreCase(ctype)) {// 전체가 아니면
				sql +=  " where ctype = ? ";
			}
			sql += " UNION ALL "
					+ " select contactid, ctype, contents, cregisterday, email, nvl2(answerid,1,0) as status "
					+ " from tbl_guest_contact c "
					+ " left join tbl_guest_contact_answer a "
					+ " on a.fk_contactid = c.contactid ";
			if(!"전체".equalsIgnoreCase(ctype)) {// 전체가 아니면
				sql +=  " where ctype = ? ";
			}
			sql += "  ) "
				+ " select contactid, email, ctype, contents, to_char(cregisterday,'yyyy-mm-dd hh24:mi:ss') as cregisterday, status " 
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
				cvo.setStatus(rs.getInt(6));
				
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
				sql=" select contactfile_systemFileName , contactfile_orginFileName, nvl(fk_orderid,0), "
					+ " acontents, contactid, ctype, contents, to_char(cregisterday,'yyyy-mm-dd hh24:mi:ss') as cregisterday , email, fk_userid, name "
					+ " from tbl_member_contact c left join tbl_member_test m "
					+ " on c.fk_userid = m.userid "
					+ " left join tbl_member_contact_answer a "
					+ " on a.fk_contactid = c.contactid "
					+ " where contactid = ? ";
			}
			else { // 비회원글이라면  
				sql=" select contactfile_systemFileName , contactfile_orginFileName, nvl(fk_orderid,0), "
					+ " acontents, contactid, ctype, contents, to_char(cregisterday,'yyyy-mm-dd hh24:mi:ss') as cregisterday , email "
					+ " from tbl_guest_contact c"
					+ " left join tbl_guest_contact_answer a "
					+ " on a.fk_contactid = c.contactid "
					+ " where contactid = ? ";
			} 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contactid);
			rs = pstmt.executeQuery();
			
			rs.next();
			    
			cvo.setContactfile_systemFileName(rs.getString(1));
			cvo.setContactfile_orginFileName(rs.getString(2));
			cvo.setFk_orderid(rs.getString(3));
			cvo.setAcontents(rs.getString(4));
			cvo.setContactid(rs.getString(5));
			cvo.setCtype(rs.getString(6));
			cvo.setContents(rs.getString(7));
			cvo.setCregisterday(rs.getString(8));
// 첨부파일 
			cvo.setEmail(aes.decrypt(rs.getString(9)));
			
			if(!mgflag) {// 회원글이라면
				cvo.setFk_userid(rs.getString(10));
				
				MemberVO mvo = new MemberVO();
				mvo.setName(rs.getString(11));
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
			
			String sql = "insert into tbl_member_contact(contactid, fk_userid, ctype, contents, pwd, contactfile_systemFileName, contactfile_orginFileName,fk_orderid)  "
						+ "values ('M'||to_char(sysdate,'yyyymmdd')||seq_tbl_member_contact_ctid.nextval, ?, ?, ?, ?,?,?,?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cvo.getFk_userid());
			pstmt.setString(2, cvo.getCtype());
			pstmt.setString(3, cvo.getContents());
			pstmt.setString(4, Sha256.encrypt(cvo.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화를 시킨다.
			pstmt.setString(5, cvo.getContactfile_systemFileName()); 
			pstmt.setString(6, cvo.getContactfile_orginFileName()); 
			pstmt.setString(7, cvo.getFk_orderid()); // 암호를 SHA256 알고리즘으로 단방향 암호화를 시킨다.

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
			
			String sql = "insert into tbl_guest_contact(contactid, email, ctype, contents, pwd) "
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

	
	// 회원문의리스트 목록
	@Override
	public List<ContactVO> selectAllMyContact(Map<String, String> paraMap) throws SQLException {
		
		List<ContactVO> contactList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql = " select contactid, fk_userid, ctype, contents, cregisterday, exist, acontents  "
						+ " from  "
						+ " ( "
						+ " select row_number() over(order by cregisterday desc) AS RNO, contactid, fk_userid, ctype, contents, to_char(cregisterday,'yyyy-mm-dd') as cregisterday, nvl2(answerid, 1,0) as exist, acontents "
						+ " from tbl_member_contact a left join tbl_member_contact_answer b "
						+ " on a.contactid = b.fk_contactid  "
						+ " where fk_userid = ? "
						+ " ) "
						+ " where RNO between ? and ?  "
						+ " order by cregisterday desc" ;
			
			// === 페이징처리의 공식 ===
			// where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수); 

			 int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			 int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			 String userid = paraMap.get("userid");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
			pstmt.setInt(3, (currentShowPageNo*sizePerPage) ); // 공식
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ContactVO cvo = new ContactVO();
				cvo.setContactid(rs.getString(1));
				cvo.setFk_userid(rs.getString(2));
				cvo.setCtype(rs.getString(3));
				cvo.setContents(rs.getString(4));
				cvo.setCregisterday(rs.getString(5));
				cvo.setReplyExist(String.valueOf(rs.getInt(6)));
				cvo.setAcontents(rs.getString(7));
				
				contactList.add(cvo);
			}
			
		} finally {
			close();
		}
		return contactList;
	}

	// 문의목록에서 클릭한 문의 관리자 답변 나오기 
	@Override
	public Map<String, String> selectContactDetail(String contactid) throws SQLException {
		Map<String,String> paraMap = new HashMap<>();
		try {
			conn = ds.getConnection();
			
			String sql = " select fk_contactid, acontents, to_char(registerday,'yyyy-mm-dd') "
						+ " from tbl_member_contact_answer "
						+ " where fk_contactid = ? " ;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, contactid);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			paraMap.put("contactid", rs.getString(1));
			paraMap.put("acontents", rs.getString(2));
			paraMap.put("registerday", rs.getString(3));
			
		} finally {
			close();
		}
		return paraMap;
	}

	// 한 멤버의 총 문의내역 (한페이지에 나오는 문의갯수에 따른 총 상품페이지 갯수 
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		int totalPage = 0; 
		try {
			
			conn = ds.getConnection();
			String sql = " select ceil(count(*)/?) from tbl_member_contact where fk_userid = ? ";
			
			// 서치단어 , 필터 넣기 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")) ); // 한 페이지에 나오는 상품갯수 
			pstmt.setString(2, paraMap.get("userid")); // 한 페이지에 나오는 상품갯수 
			
			rs = pstmt.executeQuery();
			
			rs.next(); // 무조건 결과나온다. => if 할필요 없음 
			
			totalPage = rs.getInt(1);
			
		} finally {
			close();
		}
		
		
		return totalPage;
	}

	
	
	
	
	// 문의글 업로드한 사진 파일명 알아오기
	@Override
	public Map<String, String> getContactFileName(String contactid) throws SQLException {
		Map<String, String> map = new HashMap<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select contactfile_systemFileName, contactfile_orginFileName "
						+ " from tbl_member_contact "
						+ " where contactid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contactid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String contactfile_systemFileName = rs.getString(1); // 파일서버에 업로드되어지는 실제 제품설명서 파일명
				String contactfile_orginFileName = rs.getString(2); // 웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 제품설명서 파일명
				
				map.put("contactfile_systemFileName", contactfile_systemFileName);
				map.put("contactfile_orginFileName", contactfile_orginFileName);
			}
		} finally {
			close();
		}
		return map;
	}

	
	
	// 관리자 멤버테이블에 답변입력 
	@Override
	public int insertMemberAnswer(Map<String, String> paraMap) throws SQLException {
		int result = 0 ;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_member_contact_answer(answerid, fk_contactid, acontents) "
						+ "values (seq_tbl_admin_memberContact_reply_rpid.nextval, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("contactid"));	
			pstmt.setString(2, paraMap.get("contents"));

			result  = pstmt.executeUpdate();
		
		} finally {
			close();
		}
		
		return result;
	}

	
	// 관리자 비회원테이블에 답변입력
	@Override
	public int insertGuestAnswer(Map<String, String> paraMap) throws SQLException {
		int result = 0 ;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into tbl_guest_contact_answer(answerid, fk_contactid, acontents) "
					   + " values (seq_tbl_admin_nomemberContact_reply_rpid.nextval, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("contactid"));	
			pstmt.setString(2, paraMap.get("contents"));

			result  = pstmt.executeUpdate();
		
		} finally {
			close();
		}
		
		return result;
	}

	
	
	
	// 관리자 문의페이지에서 전체 한 페이지에 나오는 상품갯수에 따른 총 상품페이지 갯수 
		@Override
		public int getContactTotalPage(Map<String, String> paraMap) throws SQLException {
			int totalPage = 0; 
			
			try {
				
				conn = ds.getConnection();
				String sql = " select ceil(count(*)/?) from tbl_all_product_test ";
				
				// 서치단어 , 필터 넣기 
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")) ); // 한 페이지에 나오는 상품갯수 
				
				rs = pstmt.executeQuery();
				
				rs.next(); // 무조건 결과나온다. => if 할필요 없음 
				
				totalPage = rs.getInt(1);
				
			} finally {
				close();
			}
			
			
			return totalPage;
		}// public int getTotalPage(Map<String, String> paraMap) throws SQLException {}----------

		
		// 관리자 문의 답변 업데이트	
		@Override
		public int updateContactAnswer(String contactid, String contents) throws SQLException {
			int result = 0;
			String mg = contactid.substring(0,1);
			boolean mgflag = "M".equalsIgnoreCase(mg)?  false : true; //  멤버문의글일경우 false 인 깃발   
			String sql="";
			try {
				conn = ds.getConnection();
				
				if(!mgflag) { // 회원일경우 
					sql = "update tbl_member_contact_answer set acontents = ? "
						+ "where fk_contactid = ? ";
				}
				else {// 비회원일경우 
					sql = "update tbl_guest_contact_answer set acontents = ? "
						+ "where fk_contactid = ? ";
				}
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, contents);
				pstmt.setString(2, contactid);

				result = pstmt.executeUpdate();
 			
			} finally {
				close();
			}
			return result;
		}// end of public int updateContactAnswer(String contactid, String contents) throws SQLException {}----------

		
		// 관리자 문의 삭제 
		@Override
		public int deleteContact(String contactid) throws SQLException {
			int result = 0;
			String mg = contactid.substring(0,1);
			System.out.println(mg);
			boolean mgflag = "M".equalsIgnoreCase(mg)?  false : true; //  멤버문의글일경우 false 인 깃발   
			String sql="";
			try {
				conn = ds.getConnection();
				
				if(!mgflag) { // 회원일경우 
					sql = " delete from tbl_member_contact "
						+ " where contactid = ? ";
				}
				else {// 비회원일경우 
					sql = " delete from tbl_guest_contact "
						+ " where contactid = ? ";
				}
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, contactid);

				result = pstmt.executeUpdate();
			
			} finally {
				close();
			}
			return result;
		}// end of public int deleteContact(String contactid) throws SQLException {}-------------

			
	
	
	
	
	
}
