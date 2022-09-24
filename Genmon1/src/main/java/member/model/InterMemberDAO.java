package member.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterMemberDAO {

	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴해주는 메소드(로그인 처리)
	MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException;

}
