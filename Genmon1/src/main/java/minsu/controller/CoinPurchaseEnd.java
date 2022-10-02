package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;

public class CoinPurchaseEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 아임포트 결제창을 사용하기위한 전제조건은 먼저 로그인을 해야하는 것이다,
		if(super.checkLogin(request)) {
			
			// 로그인을 했으면
			String userid = request.getParameter("userid"); // userid를 받아온다
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			if(loginuser.getUserid().equals(userid)) { 
				//로그인한 사용자가 자신의 코인을 결제하는 경우 
				
				String productName = "코인충전"; // "새우깡"; 글자길이 16글자가 넘어가면 뒷부분은 생략되어...으로 나온다
				String coinmoney = request.getParameter("coinmoney");
				
				
				request.setAttribute("productName", productName);
				request.setAttribute("coinmoney", coinmoney);
				request.setAttribute("email", loginuser.getEmail() ); // loginuser에 저장되어 있는 로그인한 회원의 정보를 get해온다.
				request.setAttribute("name",  loginuser.getName());
				request.setAttribute("mobile", loginuser.getMobile() );
				
				request.setAttribute("userid", userid); // DB에 업데이트 하기위해서 필요하기 때문에 담는다
				
				// 정보를 담아서 view단 페이지로 넘긴다.
		  //   super.setRedirect(false);
               super.setViewPage("/WEB-INF/minsu/paymentGateway.jsp"); //결제창으로 이동
			
			}
			else {
				// 로그인한 사용자가 다른 사용자의 코인을 충전하려고 시도하는 경우 
	            String message = "다른 사용자의 코인충전 결제 시도는 불가합니다.!!";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
          //   super.setRedirect(false);
               super.setViewPage("/WEB-INF/msg.jsp");
               return;
			
			}
			
			
			
		}
		else {
			// 로그인을 안 했으면 
			String message=" 코인충전을 하기 위해서는 먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()"; // 이전페이지로 이동
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
	}

}
