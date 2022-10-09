package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import hw.model.InterWishlistDAO;
import hw.model.WishlistDAO;

public class AddToWish extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if( !super.checkLogin(request)) {
			
			// 로그인을 안 했으면
	         String message = "잘못된 접근입니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	      //   super.setRedirect(false);
	         super.setViewPage("/WEB-INF/common/msg.jsp");
	         
		}
		else {
			
			HttpSession session =  request.getSession(); 
			  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			// System.out.println("확인용 loginuser.userid : " + loginuser.getUserid());
			
			String userid = request.getParameter("userid");
			// System.out.println("확인용 userid_request : " + userid_request);
			String pnum = request.getParameter("pnum");
			
			InterWishlistDAO wdao = new WishlistDAO();
			
			int n = wdao.addToWish(userid, pnum);
			
			
			
		}
		
		
	}

}
