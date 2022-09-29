package hw.model;

public class WishlistVO {
	
	private String fk_userid;         // 회원아이디 - tbl_member 의 userid 
	private String fk_pnum;           // 개별상품코드 - tbl_all_product 의 pnum

	/*
	  *********** 나중에 ProductVO 생기면 바꾸기***********
	private ProductVO prodvo;
	*/
	private String pname;
	private String price;
	private String pimage1;
	
	// ===================================================================================== //
	
	
	
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	
	
	public String getFk_pnum() {
		return fk_pnum;
	}
	public void setFk_pnum(String fk_pnum) {
		this.fk_pnum = fk_pnum;
	}
	
	
	
	// ------------------- 나중에 삭제 ------------------ //
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPimage1() {
		return pimage1;
	}
	public void setPimage1(String pimage1) {
		this.pimage1 = pimage1;
	}
	
	
	// ----------------------------------------------- //
	
	

}
