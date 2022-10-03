package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class PwdChange extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			String userid = request.getParameter("userid"); 
			// System.out.println("===userid :" + userid);
			
			
			request.setAttribute("userid", userid);
			
			String userCertificationCode = request.getParameter("certificationCode"); 
			// System.out.println("===certificationCode :" + certificationCode);
			
			HttpSession session = request.getSession(); // 세션 불러오기
			String certificationCode = (String) session.getAttribute("certificationCode"); // 오브젝트 타입이기 때문에 캐스팅 해줘야 함
			// System.out.println("certificationCode : "+certificationCode);
			
			String message = "";
			String loc = "";
			// msg.jsp 사용
			
			if( certificationCode.equals(userCertificationCode) ) { 
				// 세션에 저장된 인증코드와 사용자가 폼태그에 입력한 인증번호가 같은 경우
				
				// super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/pwdChange.jsp");
				
				// !!!!! 중요 !!!!!
				// !!!! 세션에 저장된 인증코드 삭제하기 !!!! ==> 비밀번호 변경 완료되면.
				// session.removeAttribute("certificationCode");
				
			}
			else {
				// 세션에 저장된 인증코드와 사용자가 폼태그에 입력한 인증번호가 다른 경우
				message = "올바르지 않은 접속시도입니다.";
				loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				// super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/msg.jsp");
			}
			
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
			super.setRedirect(true);
			super.setViewPage(request.getContextPath()+"/error.sun");
		}
		
		
	}

}
