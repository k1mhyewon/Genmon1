package hw.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hw.model.InterMemberDAO;
import hw.model.MemberDAO;

public class PwdFind extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		boolean isUserExists = false;
		
		String userid = request.getParameter("userid");
		String email = request.getParameter("email");
		
		if("POST".equalsIgnoreCase(method)) { 
			// 비밀번호 찾기 모달창에서 찾기 버튼을 클릭한 경우
			// System.out.println("컨트롤러로 넘어옴");
			
			InterMemberDAO mdao = new MemberDAO();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("email", email);
			
			isUserExists = mdao.isUserExists(paraMap);
			// System.out.println("isUserExists : "+isUserExists);
			
			boolean sendMailSuccess = false; // 메일이 정상적으로 전송되었는지 알아오기 위한 용도
			
			if(isUserExists) {
				// System.out.println("유저 확인.");
				// 회원으로 존재하는 경우
				
				// *** 랜덤한 인증키 생성 시작 *** // ---------------------------------------------
				Random rnd = new Random();
				
				String certificationCode = "";
				// 인증키는 영문소문자 5글자 + 숫자 7글자 로 만듦
				// 예: certificationCode ==> dnfef5334238
				
				char randchar = ' ';
				for(int i=0; i<5; i++) {
					// min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면 
	                // int rndnum = rnd.nextInt(max - min + 1) + min; 
					// 영문소문자 'a' 부터 'z' 까지 랜덤하게 1개를 만든다.
					
					randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
					certificationCode += randchar;
					
				} // end of for -----------------------------
				
				int randnum = 0;
				for(int i=0; i<7; i++) {
					
					randnum = (rnd.nextInt(9 - 0 + 1) + 0);
					certificationCode += randnum;
					
				} // end of for -----------------------------
				
				// System.out.println("~~~~~~~ 확인용 certificationCode " + certificationCode);
				// ~~~~~~~ 확인용 certificationCode uxajw2694210
				
				// *** 랜덤한 인증키 생성 끝  *** // --------------------------------------------
				
				String pwdChangeLink = "http://localhost:9090/Genmon1/member/pwdChange.sun";
				// 비밀번호 변경 페이지 링크
				pwdChangeLink += "?userid="+userid+"&certificationCode="+certificationCode;
				
				// System.out.println("pwdChangeLink: " + pwdChangeLink);

				// 랜덤하게 생성한 인증코드(certificationCode) 를 비밀번호 찾기를 하고자 하는 사용자의 email 로 전송한다. khwclass@gmail.com qWer1234$
				GoogleMail mail = new GoogleMail();
				
				try {
					mail.sendmail(email, pwdChangeLink);
					sendMailSuccess = true; // 메일 전송 성공 기록
	
					// 세션(Session) 불러오기
					HttpSession session = request.getSession();
					session.setAttribute("certificationCode", certificationCode);
					// 발급한 인증코드를 세션에 저장함
					
				} catch(Exception e) {
					e.printStackTrace();
					sendMailSuccess = false; // 메일 전송 실패 기록 / 디폴트가 false 이기 때문에 굳이 안해도 됨. 
				}
				
			
			} // end of if(isUserExists) ----------------------------
			

			request.setAttribute("isUserExists", isUserExists);
			request.setAttribute("userid", userid);
			request.setAttribute("email", email);
			request.setAttribute("sendMailSuccess", sendMailSuccess);
			
			request.setAttribute("method", method);
			
		} // end of if("POST".equalsIgnoreCase(method)) -----------------------

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hw/pwdFind.jsp"); // 뷰단으로 보내버림
	
		
	}

}
