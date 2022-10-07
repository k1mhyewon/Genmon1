package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.controller.AbstractController;

public class PwdInput extends AbstractController {

	// 내정보수정하기 할때 비밀번호 확인창
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
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
		

	}
}