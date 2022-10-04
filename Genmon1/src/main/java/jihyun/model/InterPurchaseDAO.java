package jihyun.model;

import java.sql.SQLException;
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

	

}
