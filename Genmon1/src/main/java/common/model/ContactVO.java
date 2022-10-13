package common.model;


public class ContactVO {
	
	// 회원 member
	private String contactid; // 회원문의글일련번호(Primary Key)   "M"||to_char(cregisterday,'yyyymmdd')||seq   "G"||to_char(cregisterday,'yyyymmdd')||seq
	private String fk_userid; // 회원id(Foreign Key)
	private int fk_orderid; // 주문번호에 대한 문의
	private String ctype; //문의 분류
	private String contents; //문의 내용
//	private String filename; // 첨부파일 
	private String contactfile_systemFileName; //파일서버에 업로드되어지는 실제 제품설명서 파일명 (파일명이 중복되는 것을 피하기 위해서 중복된 파일명이 있으면 파일명뒤에 숫자가 자동적으로 붙어 생성됨)
	private String contactfile_orginFileName; //웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 제품설명서 파일명 
	
	private String cregisterday; // 문의글등록일(sysdate)
	
	private int status; // 문의 답변상태 
	private String acontents; // 문의글 답변내용 


	
	private String pwd; // 문의글비밀번호
	

	///////
	private String replyExist;  // 답변유무 
	

	// 비회원 guest
	private String email; // 이메일 (AES-256 암호화/복호화 대상)
	
	//////////멤버테이블 join
	private MemberVO mvo;
	
	
	
	
	
	

	public String getReplyExist() {
		// 1 답변 완료 0 미완료
		replyExist = "1".equals(replyExist) ? "완료" : "미완료";  
		return replyExist;
	}

	public void setReplyExist(String replyExist) {
		this.replyExist = replyExist;
	}
	
	
	public int getFk_orderid() {
		return fk_orderid;
	}

	public void setFk_orderid(int fk_orderid) {
		this.fk_orderid = fk_orderid;
	}

	public String getContactfile_systemFileName() {
		return contactfile_systemFileName;
	}

	public void setContactfile_systemFileName(String contactfile_systemFileName) {
		this.contactfile_systemFileName = contactfile_systemFileName;
	}

	public String getContactfile_orginFileName() {
		return contactfile_orginFileName;
	}

	public void setContactfile_orginFileName(String contactfile_orginFileName) {
		this.contactfile_orginFileName = contactfile_orginFileName;
	}

	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public MemberVO getMvo() {
		return mvo;
	}

	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}

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
		
		switch (ctype) {
		case "delivery":
			ctype = "배송";
			break;
		case "refund":
			ctype = "교환/환불";
			break;
		case "product":
			ctype = "상품";
			break;
		default:
			ctype = "기타";
			break;
		}
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

//	public String getFilename() {
//		return filename;
//	}
//
//	public void setFilename(String filename) {
//		this.filename = filename;
//	}

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


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}



	public String getAcontents() {
		return acontents;
	}

	public void setAcontents(String acontents) {
		this.acontents = acontents;
	}

	
}
