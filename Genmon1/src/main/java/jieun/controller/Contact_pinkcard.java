package jieun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Contact_pinkcard extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		super.setRedirect(false); 
		super.setViewPage("/WEB-INF/jieun/customercare_pinkcard_register.jsp"); 
	}

}
