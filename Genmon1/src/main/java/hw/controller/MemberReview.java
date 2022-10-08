package hw.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.ReviewVO;
import hw.model.InterReviewDAO;
import hw.model.ReviewDAO;

public class MemberReview extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		try {
			
			String pnum = request.getParameter("pnum");
			
			// System.out.println("컨트롤러 pnum: "+ pnum);
			
			InterReviewDAO rdao = new ReviewDAO();
			
			Map<String, String> prodMap = rdao.getProdInfo(pnum); // 리뷰보기 창에서 상품정보 얻어오기
			
			request.setAttribute("pname", prodMap.get("pname"));
			request.setAttribute("price", prodMap.get("price"));
			request.setAttribute("pimage1", prodMap.get("pimage1"));
			request.setAttribute("replyCnt", prodMap.get("replyCnt"));
			request.setAttribute("avg_star", prodMap.get("avg_star"));
			request.setAttribute("avg_star_shape", prodMap.get("avg_star_shape"));
			
			List<ReviewVO> reviewList = rdao.getReviews(pnum);
			
			request.setAttribute("reviewList", reviewList);
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/hw/memberReview.jsp");
			} catch(Exception e) {
				e.printStackTrace();
				
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		
		}
		
	

}
