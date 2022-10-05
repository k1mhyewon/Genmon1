package common.model;

public class PurchaseVO {
	private int pk_purchaseid;
	private String fk_orderid;
	private int status; // 결제 전 0/ 결제 완료 1
	private int paymentAmount; //적립금, 포인트 제외하고 총가격
	private int method; //null  -- 카드 1, 무통장 2
	private int usedCoin ;
	private int usedPoint;
	
	
	public int getPk_purchaseid() {
		return pk_purchaseid;
	}
	public void setPk_purchaseid(int pk_purchaseid) {
		this.pk_purchaseid = pk_purchaseid;
	}
	public String getFk_orderid() {
		return fk_orderid;
	}
	public void setFk_orderid(String fk_orderid) {
		this.fk_orderid = fk_orderid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public int getMethod() {
		return method;
	}
	public void setMethod(int method) {
		this.method = method;
	}
	public int getUsedCoin() {
		return usedCoin;
	}
	public void setUsedCoin(int usedCoin) {
		this.usedCoin = usedCoin;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
}
