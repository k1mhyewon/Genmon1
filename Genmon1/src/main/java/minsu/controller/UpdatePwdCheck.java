package minsu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class UpdatePwdCheck extends AbstractController {

	// 비밀번호 변경을 위해 비밀번호를 올바르게 입력했는지 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(!super.checkLogin(request)) {
			// 로그인 안했으면 
		    String message = "로그인을 하세요.!!";
            String loc = "javascript:history.back()";
            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
            
      //   super.setRedirect(false);
           super.setViewPage("/WEB-INF/common/msg.jsp");
           return;
		}
		else {
			String method = request.getContextPath();
			
			if("get".equalsIgnoreCase(method)) {
				  String message = "비밀번호 수정이 불가합니다.!!";
		          String loc = "javascript:history.back()";
		            
		            request.setAttribute("message", message);
		            request.setAttribute("loc", loc);
		            
		      //   super.setRedirect(false);
		           super.setViewPage("/WEB-INF/common/msg.jsp");
		           return;
			}
			else {
				
				String pwd = request.getParameter("pwd");
				String userid = loginuser.getUserid();
				
				/* System.out.println("확인용 pwd :"+ pwd + "userid: " + userid ); */
			
				
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("pwd", pwd);
				paraMap.put("userid", userid);
				
				// 유저의 비밀번호가 맞는지 확인하는 매소드
				InterPersonDAO pdao = new PersonDAO();
				boolean ispasswdCheck2 = pdao.ispasswdCheck2(paraMap);
				
				if(ispasswdCheck2) {
					// 올바른 경우
					request.setAttribute("ispasswdCheck2", ispasswdCheck2);
					
					// super.setRedirect(false);
					super.setViewPage("/WEB-INF/minsu/infoUpdateEnd.jsp");
				}
				else {
					 String message = "비밀번호가 다릅니다.!!";
					 String loc = "javascript:history.back()";
					 
					   request.setAttribute("message", message);
					   request.setAttribute("loc", loc);
					   
					   super.setViewPage("/WEB-INF/common/msg.jsp");
			           return;
				}


			}
		}
		
	}
}