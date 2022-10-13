package jihyun.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import common.model.PurchaseVO;

public interface InterPurchaseDAO {

	// 결제 테이블에 insert 하기(현금)
	int insertPurchase(PurchaseVO purvo) throws SQLException;
	
	// 결제 테이블에 insert 하기(카드)
	int insertCardPurchase(PurchaseVO purvo) throws SQLException;

	// 환불 정보 저장하기 위해서 결제 넘버 알아오기
	int findPurchaseNum(String orderid) throws SQLException;

	// 환불정보 저장(insert)하기
	int insertRefund(Map<String, String> paraMap) throws SQLException;

	// 주문 상품에 대해 결제 내역 조회해오기 (현금결제라면 환불내역까지 가져와야함)
	HashMap<String, Object> SelectOnePurch(String orderid) throws SQLException;

	// 입금확인된 주문 결제상태 변경해주기
	int updatePurStatus(String orderid) throws SQLException;

	

}
