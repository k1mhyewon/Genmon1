package common.model;

public class ReviewVO {
	
	private String reviewid;
	private String fk_pk_order_detail_id;
	private String content;
	private String img_systemFileName;
	private String img_orginFileName;
	private String uploaddate;
	private String star;
	private String reply;
	
	
	private String star_text;
	
	private OrderDetailVO odvo;
	
	
	private MemberVO mvo;
	
	private ChildProductVO cpvo;
	
	
	///////////////////////////////////////////////////////////////////////////////
	
	
	
	
	public String getReviewid() {
		return reviewid;
	}
	public void setReviewid(String reviewid) {
		this.reviewid = reviewid;
	}
	
	
	public String getFk_pk_order_detail_id() {
		return fk_pk_order_detail_id;
	}
	public void setFk_pk_order_detail_id(String fk_pk_order_detail_id) {
		this.fk_pk_order_detail_id = fk_pk_order_detail_id;
	}
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String getImg_systemFileName() {
		return img_systemFileName;
	}
	public void setImg_systemFileName(String img_systemFileName) {
		this.img_systemFileName = img_systemFileName;
	}
	
	
	public String getImg_orginFileName() {
		return img_orginFileName;
	}
	public void setImg_orginFileName(String img_orginFileName) {
		this.img_orginFileName = img_orginFileName;
	}
	
	
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	
	
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	
	
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	
	////////////////////////////////////////
	
	// 별모양
	public String getStar_text() {
		return star_text;
	}
	public void setStar_text(String star_text) {
		
		switch (star) {
		case "1":
			this.star_text = "★☆☆☆☆";
			break;
		case "2":
			this.star_text = "★★☆☆☆";
			break;
		case "3":
			this.star_text = "★★★☆☆";
			break;
		case "4":
			this.star_text = "★★★★☆";
			break;
		case "5":
			this.star_text = "★★★★★";
			break;
		}
	}
	
	
	////////////////////////////////////////
	
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	
	
	public OrderDetailVO getOdvo() {
		return odvo;
	}
	public void setOdvo(OrderDetailVO odvo) {
		this.odvo = odvo;
	}
	
	
	/////////////////////////////////////////
	
	public ChildProductVO getCpvo() {
		return cpvo;
	}
	public void setCpvo(ChildProductVO cpvo) {
		this.cpvo = cpvo;
	}
	
}
