package jihyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AdminRefundDetaill extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.setViewPage("/WEB-INF/jihyun/admin_return_detail.jsp");
		
	}

}
