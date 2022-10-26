package jieun.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jihyun.controller.GoogleMail;

public class Mail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			String contactid = request.getParameter("contactid");
			String contents = request.getParameter("contents");
			String email = request.getParameter("email");
			String message = "";
		   // === 메일 발송하기 === //
		   // 라이브러리 다운받고 시큐리티 파일 고치고 메일보낼 준비가 됐다면 메일 보낼 클래스를 만들어서 사용할거임
			GoogleMail mail = new GoogleMail();
			
			// 메일이 성공적으로 보내졌는지 유무를 알아오기 위한 용도
			boolean sendMailSuccess = false;
			
			SimpleDateFormat dateft = new SimpleDateFormat("yyyy-MM-dd");
			Calendar currentDate = Calendar.getInstance();
			dateft.format(currentDate.getTime());
			
			
			String subject = "[젠틀몬스터] "+dateft.format(currentDate.getTime())+" 문의내용입니다." ;
			String title = email +"님의 문의에대한 답변이 등록되었습니다.";
			
			String content = "<div style='width:650px;'>"+contents
					+ "</div>";
			
			try {
				mail.sendmail(email, content, title, subject); // 구글메일 클래스 안의 메일 보내기 메소드 사용
				sendMailSuccess =  true; // 메일전송이 성공했음을 기록함
				message="메일발송이 성공되었습니다.";
				
			} catch (Exception e) { 
				// 메일전송이 실패한 경우 여기에 온다
				e.printStackTrace();
				sendMailSuccess = false; // 메일전송이 실패했음을 기록함
				message="메일발송이 실패되었습니다.";
			}
			JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
		//			contactid, fk_userid, email, ctype, contents
			jsonObj.put("message", message);
			
			String json = jsonObj.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
		//		System.out.println("~~~ 확인용 json =>"+json);
			request.setAttribute("json", json);
			
		//		super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");


	}

}
