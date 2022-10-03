package jieun.model;

import java.sql.SQLException;
import java.util.*;

import common.model.ChildProductVO;

public interface InterProductDAO {

	
	// 전체 상품갯수 
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// 한 페이지마다 나오는 상품들 select 
	List<ChildProductVO> selectPagingProduct(Map<String, String> paraMap) throws SQLException;


}
