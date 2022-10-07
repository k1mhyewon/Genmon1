package hw.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import common.model.ChildProductVO;
import common.model.ReviewVO;

public interface InterReviewDAO {

	// 리뷰보기 페이지에서 상품정보 알아오기
	Map<String, String> getProdInfo(String pnum) throws SQLException;

	// 리뷰보기 페이지에서 리뷰목록 데이터 얻어오기
	List<ReviewVO> getReviews(String pnum) throws SQLException;

	// 로그인된 회원의 작성가능 리뷰 상품 목록 얻어오기
	List<ChildProductVO> getUnwrittenReviews(String userid) throws SQLException;

	


}
