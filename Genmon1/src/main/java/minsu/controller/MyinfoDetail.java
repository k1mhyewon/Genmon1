package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MyinfoDetail extends AbstractController {

	// 내정보를 수정을 클릭하면 넘어가는 마이페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/minsu/myinfoDetail.jsp");
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		
	}

}