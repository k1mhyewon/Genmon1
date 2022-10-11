package jihyun.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.model.CartVO;
import common.model.OrderDetailVO;
import common.model.OrderVO;

public interface InterOrderDAO {

	// 회원 주문하기 insert (부모)
	int insertOrderMember(OrderVO ovo) throws SQLException;

	// 비회원 주문하기 insert (부모)
	int insertOrderGuest(OrderVO ovo) throws SQLException;

	// 방금 insert 한 주문번호 알아오기
	String findOrderid() throws SQLException;

	// 카드 회원/비회원 주문하기 상세 insert (자식)
	int isertOrderDetail(CartVO cvo, String orderid) throws SQLException;
	
	// 현금 회원/비회원 주문하기 상세 insert (자식)
	int isertCashOrderDetail(CartVO cvo, String orderid) throws SQLException;
	
	
	// 회원 아이디 가지고 주문내역 리스트로 보여주기
	List<HashMap<String,String>> selectOrderList(String userid) throws SQLException;

	// 넘어온 주문번호로 주문 조회하기 (회원용)
	OrderVO selectOneOrder(long orderid) throws SQLException;
	
	// 넘어온 주문번호로 !!! 주문 상세 조회하기 !!!  (회원용)
	List<OrderDetailVO> selectOneOrderDetail(long orderid) throws SQLException;

	// 상품 재고 줄어들게 하기
	int decreaseProdQty(Map<String, Object> map1) throws SQLException;

	// 관리자에게 전제 주문내역을 보여주는 것
	List<HashMap<String,String>> adminSelectOnlyOrder() throws SQLException;

	// 주문번호랑 이메일을 가지고 비회원 주문을 조회하는 메소드
	OrderVO findGuestOrder(String input_orderid, String input_email) throws SQLException;

	// 주문상세에서 주문 취소 했을때
	void myinfoCancelOrder(String orderid) throws SQLException;

	// 주문 상세에서 환불 신청 했을때
	int myinfoRefundOrder(String rev_content, String arrjoin, String orderid) throws SQLException;

	// 관리자 페이지에서 배송지등록이 필요한 목록을 띄워주는 것
	List<HashMap<String, String>> selectAllNeedShipOrder() throws SQLException;

	// 관리자 페이지에서 배송지일괄등록 하기
	void insertManyTrack(Map<String, String> paraMap) throws SQLException;

	// 주문상세에서 배송정보 알아오기
	HashMap<String, String> selectOneDeliInfo(String total_status, String orderid) throws SQLException;


	

	

	

}
