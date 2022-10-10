package jieun.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ChildProductVO {

	private int pnum;				// 상품일련번호
	private String fk_pid; 				// 상품id
	private String pcolor;				// 상품색상
	private String pimage1; 			// 대표상품이미지
	private int salePcnt; 				// 할인율
	private int pqty; 					// 재고
	private String preleasedate;		// 출시일
	private int panmaestate;			// 판매상태 
	////////////////////////////////
	// private int colAmount;	            // 같은 컬러 갯수 구하기 
	
	
	////////////////////////////
	
	private ParentProductVO parentProvo ;
	
	////////////////////////////
	private int psales; 					// 판매량
	

	
	
	public int getPanmaestate() { // 0:판매중단 1:판매중 2:판매예정
		// panmaestate=0 , pqty=0 => 판매중단   
		// panmaestate=1 , pqty>0, releasedate 오늘날짜보다 후 => 판매중 
		// panmaestate=1 , releasedate 오늘날짜보다 전 => 출시예정
		
		// 날짜생성 
		// 오늘날짜 yyyy-MM-dd로 생성
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		
		//yyyy-MM-dd 포맷 설정
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 
		//비교할 date와 today를데이터 포맷으로 변경
		try {
			Date date = new Date(dateFormat.parse(preleasedate).getTime());
			Date today = new Date(dateFormat.parse(todayfm).getTime());
			//compareTo메서드를 통한 날짜비교
			int compare = date.compareTo(today); 
			
//			if( pqty==0 ) { // 수량이 없으면 
//				panmaestate=0;
//			}
			if( pqty>0 && compare>0 ) { // 재고량이 있으면서 출시일이 오늘날짜보다 이전날짜이면 
				panmaestate=2;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		 
		
		return panmaestate;
	}

	public void setPanmaestate(int panmaestate) {
		this.panmaestate = panmaestate;
	}

	
	
	
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
