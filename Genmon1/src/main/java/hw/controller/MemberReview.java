package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MemberReview extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		try {
			
			String pnum = request.getParameter("pnum");
			
			request.setAttribute("pnum", pnum);
			
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/hw/memberReview.jsp");
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		
		}
		
	

}
