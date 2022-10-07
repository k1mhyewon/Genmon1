package common.model;

public class ReviewVO {
	
	private String reviewid;
	private String fk_pk_order_detail_id;
	private String content;
	private String img;
	private String uploaddate;
	private String star;
	private String reply;
	
	
	private MemberVO mvo;
	
	
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
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	
	
}
