package hw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.ChildProductVO;
import common.model.MemberVO;
import common.model.OrderDetailVO;
import common.model.ReviewVO;
import hw.model.InterReviewDAO;
import hw.model.ReviewDAO;

public class MemberReviewWrite extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if( !super.checkLogin(request)) {
			
			// 로그인을 안 했으면
	         String message = "잘못된 접근입니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	      //   super.setRedirect(false);
	         super.setViewPage("/WEB-INF/msg.jsp");
	         
		}
		else {
		
			HttpSession session =  request.getSession(); 
			  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			String userid = loginuser.getUserid();
			// System.out.println("확인용 loginuser.userid : " + loginuser.getUserid());
			// System.out.println("확인용 userid_request : " + userid_request);
			
			try {
			InterReviewDAO rdao = new ReviewDAO();
			
			List<OrderDetailVO> canReviewProdList = rdao.getUnwrittenReviews(userid);
			
			request.setAttribute("canReviewProdList", canReviewProdList);
			request.setAttribute("userid", userid);
			} catch(NumberFormatException e) {
				
			}
			
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hw/memberReviewWrite.jsp");
		
		}
		
	}

}
