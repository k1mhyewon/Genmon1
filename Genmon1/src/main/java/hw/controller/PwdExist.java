package hw.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hw.model.InterMemberDAO;
import hw.model.MemberDAO;

public class PwdExist extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("pwd", pwd);
			paraMap.put("userid", userid);
			
			InterMemberDAO mdao = new MemberDAO();
			
			boolean result = mdao.isExistPwd(paraMap); // 이미 사용중인 비밀번호인지 확인
			
			request.setAttribute("result", result);
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/hw/pwdChange.jsp");
		}
		
	}

}
