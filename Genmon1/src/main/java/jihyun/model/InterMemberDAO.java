package jihyun.model;

import java.sql.SQLException;

public interface InterMemberDAO {

	// 회원정보 중 포인트와 코인 업데이트 하기
	void updateCoin(String userid, int point, int coin) throws SQLException;

}
