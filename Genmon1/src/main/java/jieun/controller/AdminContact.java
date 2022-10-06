package jieun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AdminContact extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		super.setRedirect(false); 
		super.setViewPage("/WEB-INF/jieun/admin_contactTable.jsp"); // 
		// 문서가 로딩되자마자 전체 목록이 보여져야 하므로  
	}

}
