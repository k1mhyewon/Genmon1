package common.model;

public class OrderVO {
	
	private int pk_orderid;
	private String fk_userid;
	private String email;
	private String name;
	private String postcode;
	private String address;
	private String detailaddress ;
	private String extraaddress;
	private String mobile;
	private String orderDate;
	
	
	// 생성자 
	
	public OrderVO() {}
	
	// 회원 주문
	public OrderVO(String fk_userid, String email, String name, String postcode, String address,
			String detailaddress, String extraaddress, String mobile) {
		
		this.fk_userid = fk_userid;
		this.email = email;
		this.name = name;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
		this.mobile = mobile;
	}
	
	// 비회원 주문
	public OrderVO(String email, String name, String postcode, String address,
			String detailaddress, String extraaddress, String mobile) {
		
		this.email = email;
		this.name = name;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
		this.mobile = mobile;
	}
	
	public int getPk_orderid() {
		return pk_orderid;
	}
	public void setPk_orderid(int pk_orderid) {
		this.pk_orderid = pk_orderid;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	
	
	
}
