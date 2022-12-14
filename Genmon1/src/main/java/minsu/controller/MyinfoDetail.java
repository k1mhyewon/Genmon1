package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;

public class MyinfoDetail extends AbstractController {

	// 내정보를 수정을 클릭하면 넘어가는 마이페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String userid = request.getParameter("loginuser"); // login.jsp에서 userid를 받아온다
		if(!super.checkLogin(request)) {
			// 로그인 안했으면 
		    String message = "회원정보를 수정하려면 먼저 로그인을 하세요.!!";
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
					  String message = "비밀번호 수정이 불가합니다.!!";
			          String loc = "javascript:history.back()";
			            
			            request.setAttribute("message", message);
			            request.setAttribute("loc", loc);
			            
			      //   super.setRedirect(false);
			           super.setViewPage("/WEB-INF/common/msg.jsp");
			           return;
				}
				else {
						// super.setRedirect(false);
						super.setViewPage("/WEB-INF/minsu/myinfoDetail.jsp");
						
			}
		}
	}
}
