package hw.model;

import java.sql.SQLException;
import java.util.Map;

import common.model.MemberVO;

public interface InterMemberDAO {
	
	
	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴해주는 메소드(로그인 처리)
	MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException;

	// id 찾기(성명, 이메일을 입력받아서 해당 사용자의 아이디를 알려준다.)
	String idFind(Map<String, String> paraMap) throws SQLException;

	// 비밀번호 찾기(아이디, 이메일을 입력받아서 해당 사용자의 존재여부를 알려준다.)
	boolean isUserExists(Map<String, String> paraMap) throws SQLException;

}
