package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;

public class MemberOneDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// === 로그인을 하지 않은 상태라면 조회가 불가능하도록 한다. === //
		if(!super.checkLogin(request)) {
			
			String message = "먼저 로그인하세요.!!";
	        String loc = "javascript:history.back()";
	            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
	            
       //   super.setRedirect(false);
            super.setViewPage("/WEB-INF/common/msg.jsp");
        
		}
		else {
			
			HttpSession session = request.getSession(); // 로그인한 유저id를 알아야한다.
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); // loginuser이 object타입이므로 MemberVO로 형변환
			
			if(!"admin".equals(loginuser.getUserid()) ) {
				// === 관리자(admin)가 아닌 일반사용자로 로그인 했을때는 조회가 불가능하도록 한다. === //
				
				String message = "관리자 이외는 접근이 불가합니다.!!";
		        String loc = "javascript:history.back()";
		            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
		            
	       //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/common/msg.jsp");
				
			}
			else {
				// === 관리자(admin)로 로그인 했을때만 조회가 가능하도록 한다. === //
				
				try {
					// super.setRedirect(false);
					super.setViewPage("/WEB-INF/minsu/memberOneDetail.jsp");
					} catch(Exception e) {
						e.printStackTrace();
						super.setRedirect(true);
						super.setViewPage(request.getContextPath()+"/error.sun");
					}
			}
		}
	}

}
