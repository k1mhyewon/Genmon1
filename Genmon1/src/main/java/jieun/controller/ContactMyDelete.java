package jieun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class ContactMyDelete extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contactid", request.getParameter("contactid"));
		//		super.setRedirect(false); 
		super.setViewPage("/WEB-INF/jieun/contactMydelete.jsp"); 
	}

}
