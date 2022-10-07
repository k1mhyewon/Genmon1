package jieun.model;

import java.util.List;

public class ChildProductVO {

	private int pnum;				// 상품일련번호
	private String fk_pid; 				// 상품id
	private String pcolor;				// 상품색상
	private String pimage1; 			// 대표상품이미지
	private int salePcnt; 				// 할인율
	private int pqty; 					// 재고
	private String preleasedate;		// 출시일
	////////////////////////////////
	// private int colAmount;	            // 같은 컬러 갯수 구하기 
	
	
	////////////////////////////
	
	private ParentProductVO parentProvo ;
	
	////////////////////////////
	private int psales; 					// 판매량ㄴ
	

	public ChildProductVO() {}

	public ChildProductVO(int pnum, String fk_pid, String pcolor, String pimage1, int salePcnt, int pqty,
			String preleasedate) {
		super();
		this.pnum = pnum;
		this.fk_pid = fk_pid;
		this.pcolor = pcolor;
		this.pimage1 = pimage1;
		this.salePcnt = salePcnt;
		this.pqty = pqty;
		this.preleasedate = preleasedate;
	}

	public int getPsales() {
		return psales;
	}

	public void setPsales(int psales) {
		this.psales = psales;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getFk_pid() {
		return fk_pid;
	}

	public void setFk_pid(String fk_pid) {
		this.fk_pid = fk_pid;
	}

	public String getPcolor() {
		return pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}

	public String getPimage1() {
		return pimage1;
	}

	public void setPimage1(String pimage1) {
		this.pimage1 = pimage1;
	}

	public int getSalePcnt() {
		return salePcnt;
	}

	public void setSalePcnt(int salePcnt) {
		this.salePcnt = salePcnt;
	}

	public int getPqty() {
		return pqty;
	}

	public void setPqty(int pqty) {
		this.pqty = pqty;
	}

	public String getPreleasedate() {
		return preleasedate;
	}

	public void setPreleasedate(String preleasedate) {
		this.preleasedate = preleasedate;
	}
	
	
	////////////////////////////////////////////
	
	

	public ParentProductVO getParentProvo() {
		return parentProvo;
	}

	public void setParentProvo(ParentProductVO parentProvo) {
		this.parentProvo = parentProvo;
	}
	
	// 컬러 앞에 두글자만 따오는 메소드
	public String getColorName() {
		return pcolor.substring(0, 2).toUpperCase();
		
	}

	
	
	
}
