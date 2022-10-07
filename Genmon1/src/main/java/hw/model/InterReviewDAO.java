package hw.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import common.model.ReviewVO;

public interface InterReviewDAO {

	// 리뷰보기 페이지에서 상품정보 알아오기
	Map<String, String> getProdInfo(String pnum) throws SQLException;

	// 리뷰보기 페이지에서 리뷰목록 데이터 얻어오기
	List<ReviewVO> getReviews(String pnum) throws SQLException;

	


}
