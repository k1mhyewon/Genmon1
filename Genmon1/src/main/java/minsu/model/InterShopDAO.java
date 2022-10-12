package minsu.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterShopDAO {

	// 매장정보를 보여주는 매소드
	Map<String, String> showShop(String city)throws SQLException;

}
