package hw.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterWishlistDAO {

	// 위시리스트를 select 해오는 메소드
	List<WishlistVO> selectWishlist(String userid) throws SQLException;

	// 위시리스트 상품 delete 
	int deleteWishlist(Map<String, String> paraMap) throws SQLException;

	// 위시리스트에서 장바구니로 insert (장바구니에 해당 상품이 없는 경우)
	int wishToCartInsert(Map<String, String> paraMap) throws SQLException;

	// 위시리스트에서 장바구니로 update (이미 장바구니에 해당 상품이 존재하는 경우)
	int wishToCartUpdate(Map<String, String> paraMap);

	// 상품상세에서 위시리스트로 insert
	int addToWish(String userid, String pnum) throws SQLException;

	// 이미 위시리스트에 있는 상품인지 확인
	int isWishExist(String userid, String pnum) throws SQLException;

	// 리뷰페이지에서 하트 개수 알아오기
	int wishCount(String pnum) throws SQLException;

}
