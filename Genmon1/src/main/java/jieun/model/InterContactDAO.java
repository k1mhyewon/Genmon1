package jieun.model;

import java.sql.SQLException;
import java.util.*;

import common.model.ChildProductVO;
import common.model.ContactVO;

public interface InterContactDAO {

	// 문의 유형에 따른 문의글 가져오기 
	List<ContactVO> selectContactList(Map<String, String> paraMap) throws SQLException;

	// 클릭한 한 문의글 정보 가져오기    
	ContactVO contactOneDetail(String contactid) throws SQLException;

	// 회원문의글 insert
	void insertMemberContact(ContactVO cvo) throws SQLException;

	// 비회원문의글 insert
	void insertGuestContact(ContactVO cvo) throws SQLException;

	// 회원문의리스트 목록 
	List<ContactVO> selectAllMyContact(Map<String, String> paraMap) throws SQLException;

	// 문의목록에서 클릭한 문의 관리자 답변 나오기 
	Map<String, String> selectContactDetail(String contactid) throws SQLException;
	
	// 전체 한 페이지에 나오는 상품갯수에 따른 총 문의페이지 갯수 
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// 문의글 쓸때 파일명 알아오기
	Map<String, String> getContactFileName(String contactid) throws SQLException;



}
