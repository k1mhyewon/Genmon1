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



}
