package hw.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import common.model.OrderDetailVO;
import common.model.ReviewVO;

public interface InterReviewDAO {

	// 리뷰보기 페이지에서 상품정보 알아오기
	Map<String, String> getProdInfo(String pnum) throws SQLException;

	// 리뷰보기 페이지에서 리뷰목록 데이터 얻어오기
	List<ReviewVO> getReviews(String pnum) throws SQLException;

	// 로그인된 회원의 작성가능 리뷰 상품 목록 얻어오기
	List<OrderDetailVO> getUnwrittenReviews(String userid) throws SQLException;

	// 리뷰 테이블에 insert
	int reviewInsert(ReviewVO rvo) throws SQLException;

	// 리뷰 삭제하기
	int deleteReview(String reviewid) throws SQLException;
	
	// 리뷰 댓글 삭제하기
	int deleteReviewReply(String reviewid) throws SQLException;

	// 리뷰 댓글 달기
	int insertReply(String reviewid, String reply_content) throws SQLException;

	// 관리자용 리뷰 리스트 select 해오기
	List<ReviewVO> selectReviewListforAdmin(Map<String, String> paraMap) throws SQLException;

	// 관리자용 팝업창 단일 리뷰 select 해오기
	ReviewVO getOneReview(String orderDetailId) throws SQLException;

	


}
