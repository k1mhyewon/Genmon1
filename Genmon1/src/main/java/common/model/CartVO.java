package common.model;

public class CartVO {
	
	private int fk_pnum;
	private String fk_userid;
	private int qty;
	private String updateDate;
	
	private ChildProductVO allProdvo;
	private ParentProductVO prodvo;
	
	
	// ===================================================================================== //
	





		// 장바구니 insert 때 필요
		public CartVO(String fk_userid, int fk_pnum, int qty) {
			this.fk_userid = fk_userid;
			this.fk_pnum = fk_pnum;
			this.qty = qty;
		}
	
	
	public CartVO() {
			
		}

	// 로그인 안된 장바구니
	public CartVO(int fk_pnum, int qty) {
		this.fk_pnum = fk_pnum;
		this.qty = qty;
	}


	public int getFk_pnum() {
		return fk_pnum;
	}
	public void setFk_pnum(int fk_pnum) {
		this.fk_pnum = fk_pnum;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	
	
	
	

	public ChildProductVO getAllProdvo() {
		return allProdvo;
	}


	public void setAllProdvo(ChildProductVO allProdvo) {
		this.allProdvo = allProdvo;
	}
	
	
	
	public ParentProductVO getProdvo() {
	return prodvo;
	}
	
	
	public void setProdvo(ParentProductVO prodvo) {
		this.prodvo = prodvo;
	}

}
