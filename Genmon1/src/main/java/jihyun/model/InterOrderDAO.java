package jihyun.model;

import java.sql.SQLException;

import common.model.CartVO;
import common.model.OrderVO;

public interface InterOrderDAO {

	// 회원 주문하기 insert (부모)
	int insertOrderMember(OrderVO ovo) throws SQLException;

	// 비회원 주문하기 insert (부모)
	int insertOrderGuest(OrderVO ovo) throws SQLException;

	// 방금 insert 한 주문번호 알아오기
	String findOrderid() throws SQLException;

	// 회원/비회원 주문하기 상세 insert (자식)
	int isertOrderDetail(CartVO cvo, String orderid) throws SQLException;

}
