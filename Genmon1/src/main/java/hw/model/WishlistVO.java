package hw.model;

import common.model.ChildProductVO;
import common.model.ParentProductVO;

public class WishlistVO {
	
	private String fk_userid;         // 회원아이디 - tbl_member 의 userid 
	private String fk_pnum;           // 개별상품코드 - tbl_all_product 의 pnum

	
	//////////////////////////////////////
	
	private ParentProductVO ppvo;
	private ChildProductVO cpvo;
	
	
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
	
	
	
	//////////////////////////////////////
	
	public ParentProductVO getPpvo() {
		return ppvo;
	}
	public void setPpvo(ParentProductVO ppvo) {
		this.ppvo = ppvo;
	}
	public ChildProductVO getCpvo() {
		return cpvo;
	}
	public void setCpvo(ChildProductVO cpvo) {
		this.cpvo = cpvo;
	}
	
	
	

}
