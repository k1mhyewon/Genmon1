package hw.model;

import java.sql.SQLException;
import java.util.List;

import common.model.CartVO;

public interface InterCartDAO {

	// 로그인된 회원의 장바구니 insert
	int cartInsert(CartVO cart) throws SQLException;

	// 로그인된 회원의 장바구니 insert 하기 전에 이미 장바구니에 존재하는 상품이 있는지 확인하고 개수 리턴(없다면 0)
	int isCartExist(String fk_userid, int fk_pnum) throws SQLException;

	// 로그인된 회원의 장바구니에 이미 장바구니에 존재하는 상품이 있다면 업데이트
	int cartUpdate(String fk_userid, int fk_pnum, int updateQty) throws SQLException;

	// 로그인된 회원의 장바구니 전체 조회
	List<CartVO> memberCartSelect(String fk_userid) throws SQLException ;
	
	

}
