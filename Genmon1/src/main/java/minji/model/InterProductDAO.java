package minji.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import common.model.AddImgVO;
import common.model.ChildProductVO;

public interface InterProductDAO {

	
	// 상품 전체를 셀렉해와서 리스트로 뿌려주는 메소드
	List<ChildProductVO> selectAllProduct()  throws SQLException;

	// pnum을 가지고 상품 디테일을 알아오는 메소드 
	ChildProductVO selectOneDetail(String pnum) throws SQLException;

	// 색깔이 다른 동일 제품들 조회해오기 
	List<ChildProductVO> SelectSameProduct(Map<String, String> paraMap) throws SQLException;

	// 상품 리스트 페이지에서 간략보기 누르면 전체 상품의 이미지들만 나오는 상픔심플리스트 메소드 
	List<ChildProductVO> simpleAllProduct() throws SQLException;

}
