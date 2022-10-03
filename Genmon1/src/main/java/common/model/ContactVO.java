package common.model;


public class ContactVO {
	
	// 회원 member
	private String contactid; // 회원문의글일련번호(Primary Key)   "M"||to_char(cregisterday,'yyyymmdd')||seq   "G"||to_char(cregisterday,'yyyymmdd')||seq
	private String fk_userid; // 회원id(Foreign Key)
	private String ctype; //문의 분류
	private String contents; //문의 내용
	private String filename; // 첨부파일 
	private String cregisterday; // 문의글등록일(sysdate)


	// 비회원 guest
	private String email; // 이메일 (AES-256 암호화/복호화 대상)
	
	
	public String getContactid() {
		return contactid;
	}

	public void setContactid(String contactid) {
		this.contactid = contactid;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getCregisterday() {
		return cregisterday;
	}

	public void setCregisterday(String cregisterday) {
		this.cregisterday = cregisterday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	////////////////////////////////

	
	
	
	
	////////////////////////////
	

	public ContactVO() {}

	
	
	
}
