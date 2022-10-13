package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import common.model.ReviewVO;
import hw.model.InterReviewDAO;
import hw.model.ReviewDAO;

public class AdminReplyAnswer extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// == 관리자로 로그인 했을때만 조회가 가능하도록
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser"); // 여기서 loginuser  는 절대 null 이 아님
		
		if( loginuser  != null && "admin".equals(loginuser.getUserid())) {
			
			
			String method = request.getMethod();
			
			if("GET".equalsIgnoreCase(method)) { // 클릭한 회원이 작성한 문의글을 보여줄때 
				
				String orderDetailId = request.getParameter("orderDetailId");
				String type = request.getParameter("type");
				
				InterReviewDAO rdao = new ReviewDAO();
				
				ReviewVO rvo = rdao.getOneReview(orderDetailId);
				
				request.setAttribute("rvo", rvo);
				request.setAttribute("type", type);
				

				super.setRedirect(false); 
				super.setViewPage("/WEB-INF/hw/admin_reviewAnswer.jsp");
				
			}
				
		}
		
		else {
			// 관리자로 로그인을 안했을때 
			String message = "관리자만 접근이 가능합니다!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/msg.jsp");
		}
		
		
	}

}
