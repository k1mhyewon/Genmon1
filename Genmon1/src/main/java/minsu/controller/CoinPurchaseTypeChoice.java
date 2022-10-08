package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.*;

public class CoinPurchaseTypeChoice extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		// 코인충전을 하기위한 전제조건은 먼저 로그인을 해야한다.
		// 로그인유무처리는 공통된 부분이기 때문에 부모클래스인 AbstractController에 로그인처리유무 매소드 생성한 후
		if(super.checkLogin(request)) {
			// 로그인을 했으면 
			
			String userid = request.getParameter("userid"); // userid를 받아온다
			
			HttpSession session = request.getSession(); 	// 현재 로그인된 유저와 코인충전창에 넘어온 userid을 비교해야한다.
			MemberVO loginuser =(MemberVO)session.getAttribute("loginuser");
			
		
			if(loginuser.getUserid().equals(userid)) {
				// 로그인한 사용자가 자신의 코인을 충전하는 경우
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/minsu/coinPurchaseTypeChoice.jsp"); // 얼마만큼 구매할지에 대한 view단 페이지로 이동
				
			}
			else {
				
				// 로그인한 사용자가 다른자신의 코인을 충전하려고 시도하는 경우
				String message=" 다른사용자의 코인충전 시도는 불가합니다!!";
				String loc = "javascript:history.back()"; // 이전페이지로 이동
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/msg.jsp");
				
			}
			
		}
		else {
			// 로그인을 안 했으면 
			String message=" 코인충전을 하기 위해서는 먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()"; // 이전페이지로 이동
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/msg.jsp");
		}
		
		
	}

}
