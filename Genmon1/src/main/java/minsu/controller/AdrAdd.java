package minsu.controller;

import javax.servlet.http.*;
import common.controller.AbstractController;

public class AdrAdd extends AbstractController {

	// 주소추가하는 페이지 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!super.checkLogin(request)) {
			// 로그인 안했으면 
		    String message = "회원정보를 수정하려면 먼저 로그인을 하세요.!!";
            String loc = "javascript:history.back()";
            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
            
      //   super.setRedirect(false);
           super.setViewPage("/WEB-INF/common/index.jsp");
           return;
		}
		else {
		 
			try {
				// super.setRedirect(false);
				super.setViewPage("/WEB-INF/minsu/adrAdd.jsp");
				} catch(Exception e) {
					e.printStackTrace();
					super.setRedirect(true);
					super.setViewPage(request.getContextPath()+"/error.sun");
				}
		
		}
	}
}

