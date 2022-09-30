package hw.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterWishlistDAO {

	// 위시리스트를 select 해오는 메소드
	List<WishlistVO> selectWishlist(String userid) throws SQLException;

	// 위시리스트 중 개별 상품에서 삭제 버튼을 눌렀을 때 그 상품만 delete 해오는 메소드
	int deleteWishlist(Map<String, String> paraMap) throws SQLException;

}
