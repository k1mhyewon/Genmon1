package hw.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import common.model.ReviewVO;
import hw.model.InterReviewDAO;
import hw.model.ReviewDAO;

public class MemberReview extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		try {
			HttpSession session =  request.getSession(); 
			
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			if(loginuser != null) {
				String userid = loginuser.getUserid();
				request.setAttribute("userid", userid);
			}
			
			String pnum = request.getParameter("pnum");
			
			String searchType = request.getParameter("searchType");
			if(searchType == null) {
				searchType = "uploaddate";
			}
			
			request.setAttribute("searchType", searchType);
			
			// System.out.println("컨트롤러 pnum: "+ pnum);
			
			InterReviewDAO rdao = new ReviewDAO();
			
			String currentShowPageNo = request.getParameter("currentShowPageNo");
			
			// System.out.println("컨트롤러 44 currentShowPageNo: "+ currentShowPageNo);
			
			if( currentShowPageNo == null) {
				currentShowPageNo = "1";
			}
			
			try {
				if(Integer.parseInt(currentShowPageNo) < 1) {
					currentShowPageNo = "1";
				}
				
			} catch(NumberFormatException e) {
				currentShowPageNo = "1";
			}
			
			int totalPage = rdao.getTotalPage(pnum); // 리뷰 페이지 수 알아오기
			
			if( Integer.parseInt(currentShowPageNo) > totalPage ) {
				currentShowPageNo = "1";
			}
			
			
			
			Map<String, String> prodMap = rdao.getProdInfo(pnum); // 리뷰보기 창에서 상품정보 얻어오기
			
			request.setAttribute("pname", prodMap.get("pname"));
			request.setAttribute("price", prodMap.get("price"));
			request.setAttribute("pimage1", prodMap.get("pimage1"));
			request.setAttribute("replyCnt", prodMap.get("replyCnt"));
			request.setAttribute("avg_star", prodMap.get("avg_star"));
			request.setAttribute("avg_star_shape", prodMap.get("avg_star_shape"));
			
			// System.out.println("pnum: "+ prodMap.get("pnum"));
			
			request.setAttribute("pnum", prodMap.get("pnum"));
			
			
			List<ReviewVO> reviewList = rdao.getReviews(pnum, currentShowPageNo, searchType);
			
			request.setAttribute("reviewList", reviewList);
			
			
			// ***** ====================== 페이지바 만들기 시작 ====================== ***** //
			
			String pageBar = "";
			
			int blockSize = 5; // blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다.
			
			int loop = 1; // loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도이다.
			
			// !!!! 다음은 pageNo 를 구하는 공식이다. !!!! //
			int pageNo  = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1 ;
			// pageNo 는 페이지바에서 보여지는 첫번째 번호이다.
			
			// System.out.println("컨트롤러 96 pageNo: "+ pageNo);

			// **** [맨처음][이전] 만들기 **** //
			if(pageNo !=  1) {
				pageBar += "<li class='page-item'><a class='page-link' href='memberReview.sun?pnum="+pnum+"&currentShowPageNo=1&searchType="+searchType+"'>&lt;&lt;</a></li>";
				pageBar += "<li class='page-item'><a class='page-link' href='memberReview.sun?pnum="+pnum+"&currentShowPageNo=" + (pageNo-1)+"&searchType=" +searchType+"'>&lt;</a></li>";
			}
			
			
			while( !(loop > blockSize || pageNo > totalPage) ) {
				
				if(pageNo == Integer.parseInt(currentShowPageNo)) {
					pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				}
				else {
					pageBar += "<li class='page-item'><a class='page-link' href='memberReview.sun?pnum="+pnum+"&currentShowPageNo=" + pageNo +"&searchType=" +searchType+ "'>" + pageNo + "</a></li>";
				}
				loop++;    //  1  2  3  4  5  6  7  8  9 10
				pageNo++;  //  1  2  3  4  5  6  7  8  9 10
				           // 11 12 13 14 15 16 17 18 19 20
						   // 21 22 23 24 25 26 27 28 29 30
				
			} // end of while() ---------------
			
			// **** [다음][마지막] 만들기 **** //
			if(pageNo <= totalPage) {
				pageBar += "<li class='page-item'><a class='page-link' href='memberReview.sun?pnum="+pnum+"&currentShowPageNo=" + pageNo +"&searchType=" +searchType+ "'> &gt;</a></li>";
				pageBar += "<li class='page-item'><a class='page-link' href='memberReview.sun?pnum="+pnum+"&currentShowPageNo=" + totalPage +"&searchType=" +searchType+ "'>&gt;&gt;</a></li>";
			}
			
			request.setAttribute("pageBar", pageBar);
			
			// ***** ======= 페이지바 만들기 끝 ====== ***** //
			
			
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/hw/memberReview.jsp");
			} catch(Exception e) {
				e.printStackTrace();
				
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		
		}
		
	

}
