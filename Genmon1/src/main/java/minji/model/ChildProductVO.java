package minji.model;

public class ChildProductVO {

	private String pnum;				// 상품일련번호
	private int fk_pid; 				// 상품id
	private String pcolor;				// 상품색상
	private String pimage1; 			// 대표상품이미지
	private int salePcnt; 				// 할인율
	private int pqty; 					// 재고
	private String preleasedate;		// 출시일
	
	////////////////////////////
	
	public ChildProductVO() {}

	public ChildProductVO(String pnum, int fk_pid, String pcolor, String pimage1, int salePcnt, int pqty,
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

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public int getFk_pid() {
		return fk_pid;
	}

	public void setFk_pid(int fk_pid) {
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
	
	
}
