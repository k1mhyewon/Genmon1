package minji.model;

import java.sql.SQLException;
import java.util.*;
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

	// color와 material이 동일한 추천제품 가져오기 
	List<ChildProductVO> recommendProduct(Map<String, String> map) throws SQLException;

	// 필터에서 선택한 사항들에 해당하는 상품 보여주기 
	List<ChildProductVO> selectProductList(Map<String, String> paraMap) throws SQLException;

	// Ajax(JSON) 사용하여 HIT 상품목록을 "스크롤" 방식으로 페이징처리하기
	// 상품 전체 개수 알아오기 메소드
	int totalPspecCount(String pnum) throws SQLException;

	// 상품 8개씩 잘라서 스크롤 방식으로 띄워주는 메소드
	List<ChildProductVO> selectDisplay(Map<String, String> paraMap) throws SQLException;

	// 상품 목록 카테고리에서 베스트셀러 리스트 보여주는 메소드
	List<ChildProductVO> selectBestProduct() throws SQLException;

	// 상품 목록 카테고리에서 클래식디자인 리스트 보여주는 메소드
	List<ChildProductVO> selectClassicProduct() throws SQLException;

	// 상품 목록 카테고리에서 틴트렌즈 리스트 보여주는 메소드
	List<ChildProductVO> selectLenseProduct() throws SQLException;

	// 베스트 상품 리스트 페이지에서 간략보기 누르면 전체 상품의 이미지들만 나오는 메소드 
	List<ChildProductVO> simpleBestProduct() throws SQLException;

	// 클래식 리스트 페이지에서 간략보기 누르면 전체 상품의 이미지들만 나오는 상픔심플리스트 메소드 
	List<ChildProductVO> simpleClassicProduct() throws SQLException;

	// 틴트렌즈 리스트 페이지에서 간략보기 누르면 전체 상품의 이미지들만 나오는 상픔심플리스트 메소드 
	List<ChildProductVO> simpleLenseProduct() throws SQLException;

	
}
