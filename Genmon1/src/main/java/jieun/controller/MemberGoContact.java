package jieun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MemberGoContact extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method  = request.getMethod();
		
		
		if( "POST".equalsIgnoreCase(method) ) { // 
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String type = request.getParameter("type");
			String order = request.getParameter("order");
			String contents = request.getParameter("contents");
			String password = request.getParameter("password");
			String file = request.getParameter("file");
			
		}
		else {
			//		super.setRedirect(false); 
			super.setViewPage("/WEB-INF/jieun/memberContactForm.jsp");
			
		}
		
		
		
	}
}
