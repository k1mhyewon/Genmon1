package jieun.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class GuestSearchContact extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
//			super.setRedirect(false); 
			super.setViewPage("/WEB-INF/jieun/contactGuestLogin.jsp"); 
			
		}
		
		
		
		
		
			
		}
		
		
		
	}

