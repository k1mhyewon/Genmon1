package minsu.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import common.model.MemberVO;

public interface InterPersonDAO {

	// 회원가입을 해주는 매소드(tbl_member 테이블 insert)
	int registerMember(MemberVO member)throws SQLException;

	// 아이디가 중복되었는지 알아오는 메소드
	boolean idDuplicateCheck(String userid)throws SQLException;

	// DB에 주소 추가 및 변경하는 메소드 // 
	int addAdreess(Map<String, String> paraMap)throws SQLException;
	
	// 회원의 코인 및 포인트 변경하기
	int coinUpdate(Map<String, String> paraMap)throws SQLException;

	// 비밀번호가 맞는지 확인하는 메소드
	boolean ispasswdCheck(Map<String, String> paraMap)throws SQLException;

	// 주소를 삭제하는 메소드 생성하기 //
	int adrDelete(Map<String, String> paraMap)throws SQLException;

	// 비밀번호를 변경해주는 메소드
	int passwdUpdate(Map<String, String> paraMap)throws SQLException;

	// 회원목록을 보여주는 메소드 // 
	List<MemberVO> selectPagingMember(Map<String, String> paraMap)throws SQLException;

	// 페이징처리를 위해 검색이 있는 회원 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
	int getTotalPage(Map<String, String> paraMap)throws SQLException;

	// 비밀번호가 맞는지 확인하는 메소드
	boolean ispasswdCheck2(Map<String, String> paraMap)throws SQLException;

	

	
	
	
	

}
