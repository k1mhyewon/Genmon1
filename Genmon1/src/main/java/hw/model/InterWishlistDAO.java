package hw.model;

import java.sql.SQLException;
import java.util.List;

public interface InterWishlistDAO {

	// 위시리스트를 select 해오는 메소드
	List<WishlistVO> selectWishlist(String userid) throws SQLException;

}
