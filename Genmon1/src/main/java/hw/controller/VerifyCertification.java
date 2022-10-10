package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class VerifyCertification extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = request.getParameter("userid"); 
		System.out.println("===userid :" + userid);
		
		String userCertificationCode = request.getParameter("userCertiCode");
		// System.out.println("userCertificationCode : " + userCertificationCode);
		
		HttpSession session = request.getSession(); // 세션 불러오기
		String certificationCode = (String) session.getAttribute("certificationCode"); // 오브젝트 타입이기 때문에 캐스팅 해줘야 함
		// System.out.println("certificationCode : "+certificationCode);
		
		String message = "";
		String loc = "";
		// msg.jsp 사용
		
		if( certificationCode.equals(userCertificationCode) ) { 
			// 세션에 저장된 인증코드와 사용자가 폼태그에 입력한 인증번호가 같은 경우
			message = "인증이 성공되었습니다.";
			loc = request.getContextPath()+"/pwdReset.sun?userid="+userid;
			
		}
		else {
			// 세션에 저장된 인증코드와 사용자가 폼태그에 입력한 인증번호가 다른 경우
			message = "인증이 실패하였습니다. \\n인증코드를 다시 발급받으세요.";
			loc = request.getContextPath()+"/pwdFind.sun";
		}
		

		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/common/msg.jsp");
		
		
		// !!!!! 중요 !!!!!
		// !!!! 세션에 저장된 인증코드 삭제하기 !!!!
		session.removeAttribute("certificationCode");
		
	}

}
