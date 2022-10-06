package jihyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;

public class CheckLogin extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(super.checkLogin(request)) { // 로그인 한 상태라면 바로 주문으로 가면 안대고 ㅎㅎ
			
			HttpSession session =  request.getSession(); 
			  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			request.setAttribute("email", loginuser.getEmail());
			request.setAttribute("name", loginuser.getName());
			request.setAttribute("mobile", loginuser.getMobile());
			request.setAttribute("postcode", loginuser.getPostcode());
			request.setAttribute("address", loginuser.getAddress());
			request.setAttribute("detailAddress", loginuser.getDetailaddress());
			request.setAttribute("extraAddress", loginuser.getExtraaddress());
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jihyun/deliveryInfo.jsp");
			
		} else { // 로그인 안 한 상태라면 로그인 체크로
			
			String all_pnum = request.getParameter("all_pnum");
			String all_qty = request.getParameter("all_qty");
			
			System.out.println("확인용 all_pnum : "+ all_pnum);
			System.out.println("확인용 all_qty : "+ all_qty);
			
			request.setAttribute("all_pnum", all_pnum);
			request.setAttribute("all_qty", all_qty);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jihyun/checkLogin.jsp");
		}
		
		
		
	}

}
