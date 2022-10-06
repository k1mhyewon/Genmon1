package minsu.model;

import java.sql.SQLException;
import java.util.Map;

import common.model.MemberVO;

public interface InterPersonDAO {

	// 회원가입을 해주는 매소드(tbl_member 테이블 insert)
	int registerMember(MemberVO member)throws SQLException;

	// 아이디가 중복되었는지 알아오는 메소드
	boolean idDuplicateCheck(String userid)throws SQLException;

	// DB에 주소 추가 및 변경하는 메소드 // 
	int addAdreess(Map<String, String> paraMap)throws SQLException;
	
	//  회원의 코인 및 포인트 변경하기
	int coinUpdate(Map<String, String> paraMap)throws SQLException;

	// === 주소를 삭제하는 메소드 생성하기 === //
	/* int adrDelete(Map<String, String> paraMap)throws SQLException; */

	// 비밀번호가 맞는지 확인하는 메소드
	boolean ispwdCheck(Map<String, String> paraMap)throws SQLException;

	// 주소를 삭제하는 메소드 생성하기 //
	int adrDelete(Map<String, String> paraMap)throws SQLException;

	


	
	
	

}
