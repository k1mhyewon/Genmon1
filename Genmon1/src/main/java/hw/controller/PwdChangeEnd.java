package hw.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hw.model.InterMemberDAO;
import hw.model.MemberDAO;

public class PwdChangeEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// System.out.println("===== PwdUpdateEnd 로 넘어옴 =====");
		
		String userid = request.getParameter("userid"); // 인증이 성공했을때만 들어옴
		
		// System.out.println("~~~~~~~~~~~~~~~~ userid : "+userid);
		
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			// 암호 변경하기 버튼을 클릭한 경우
			
			String pwd = request.getParameter("pwd1");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("pwd", pwd);
			paraMap.put("userid", userid);
			
			InterMemberDAO mdao = new MemberDAO();
			int n = mdao.pwdUpdate(paraMap);
			
			request.setAttribute("n", n);
			
			String message = "";
			String loc = "";
			
			HttpSession session = request.getSession();
			
			if(n == 1) {
				message = "비밀번호가 변경되었습니다. 다시 로그인해주세요.";
				
				
			}
			else {
				message = "오류가 발생했습니다. 다시 시도해주세요.";
				
			}
			
			// !!!! 세션에 저장된 인증코드 삭제하기 !!!! 
			session.removeAttribute("certificationCode");
			
			request.setAttribute("message", message);
			
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/hw/pwdMsg.jsp");
			
		} 
		
	}

}
