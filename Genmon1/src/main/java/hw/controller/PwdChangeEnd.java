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
		HttpSession session = request.getSession();
		
		String userid = (String) session.getAttribute("userid"); // 인증이 성공했을때만 들어옴
		
		System.out.println("~~~~~~~~~~~~~~~~ userid : "+userid);
		
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			// 암호 변경하기 버튼을 클릭한 경우
			
			String pwd = request.getParameter("pwd1");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("pwd", pwd);
			paraMap.put("userid", userid);
			
			System.out.println("pwd : "+pwd);
			System.out.println("userid : "+userid);
			
			InterMemberDAO mdao = new MemberDAO();
			
			boolean isExistPwd = mdao.isExistPwd(paraMap);
			System.out.println("isExistPwd : "+isExistPwd);
			
			request.setAttribute("isExistPwd", isExistPwd);
			
			if(isExistPwd) {
				
				// System.out.println("이미 사용중인 비밀번호 / 세션에 저장 / isExistPwd => "+isExistPwd);
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/pwdChange.jsp");
				
			}
			else {
				
				int n = mdao.pwdUpdate(paraMap);
				
				request.setAttribute("n", n);
				
				String message = "";
				String loc = "";
				
				
				if(n == 1) {
					message = "비밀번호가 변경되었습니다. 새로운 비밀번호로 로그인해주세요.";
					
					
				}
				else {
					message = "오류가 발생했습니다. 다시 시도해주세요.";
					
				}
				
				// !!!! 세션에 저장된 인증코드 삭제하기 !!!! 
				session.removeAttribute("certificationCode");
				session.removeAttribute("userid");
				
				request.setAttribute("message", message);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/pwdMsg.jsp");
			}
			
			
			
			
		} // end of if("POST".equalsIgnoreCase(method)) {} -------------------------------------- 
		
	}

}
