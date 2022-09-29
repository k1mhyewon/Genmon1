package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class PwdInput extends AbstractController {

	// 내정보수정하기 할때 비밀번호 확인창
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/minsu/pwdInput.jsp");
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		

	}
}