package minsu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class InfoUpdateEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		MemberVO loginuser  = (MemberVO)session.getAttribute("loginuser");
		
		String userid = (String)session.getAttribute("loginuser");
		String pwd = request.getParameter("pwd");

		System.out.println("~~~ 확인용userid: " + userid);
		System.out.println("~~~ 확인용 pwd : " + pwd);
		if(!super.checkLogin(request)) {
			// 로그인 안했으면 
		    String message = " 먼저 로그인을 하세요.!!";
            String loc = "javascript:history.back()";
            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
            
      //   super.setRedirect(false);
           super.setViewPage("/WEB-INF/common/msg.jsp");
           return;
		}
		else {
			String method = request.getContextPath();
			
			if("get".equals(method)) {
				  String message = "회원정보 수정이 불가합니다.!!";
		          String loc = "javascript:history.back()";
		            
		            request.setAttribute("message", message);
		            request.setAttribute("loc", loc);
		            
		      //   super.setRedirect(false);
		           super.setViewPage("/WEB-INF/common/msg.jsp");
		           return;
			}
			else {
				
				// 로그인한 사람의 패스워드를 알아야하기 때무네 userid를 불러와야한다.
				
				
				InterPersonDAO pdao = new PersonDAO();
				Map<String,String> paraMap = new HashMap<>();
				
				paraMap.put("userid", userid);
				paraMap.put("pwd", pwd);
				
				
				// 비밀번호가 맞는지 확인하는 메소드
				int passwdUpdate = pdao.passwdUpdate(paraMap);
			
	        	// super.setRedirect(false);
	 			super.setViewPage("/WEB-INF/minsu/infoUpdate.jsp");
				
			}
		}
		
		
		
		
	}

}
