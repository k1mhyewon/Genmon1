package common.model;

public class OrderDetailVO {
	
	private String pk_order_detail_id;
	private String fk_orderid;
	private int fk_pnum;
	private int order_status;       //주문 상태 1주문 2취소(반품) 3교환
	private int order_price;
	
	////////////////////////////
	private OrderVO ovo;
	////////////////////////////
	
	public String getPk_order_detail_id() {
		return pk_order_detail_id;
	}

	public void setPk_order_detail_id(String pk_order_detail_id) {
		this.pk_order_detail_id = pk_order_detail_id;
	}

	public String getFk_orderid() {
		return fk_orderid;
	}

	public void setFk_orderid(String fk_orderid) {
		this.fk_orderid = fk_orderid;
	}

	public int getFk_pnum() {
		return fk_pnum;
	}

	public void setFk_pnum(int fk_pnum) {
		this.fk_pnum = fk_pnum;
	}

	public int getOrder_status() {
		return order_status;
	}

	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public OrderVO getOvo() {
		return ovo;
	}

	public void setOvo(OrderVO ovo) {
		this.ovo = ovo;
	} 
	
}
