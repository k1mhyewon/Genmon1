package jihyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import common.model.OrderVO;

public class PayInfo extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// post로만 넘어옴
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method) ) {
			
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String mobile = request.getParameter("mobile");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String detailAddress = request.getParameter("detailAddress");
			String extraAddress = request.getParameter("extraAddress");
			
			if(super.checkLogin(request)) { // 회원주문
				
				HttpSession sesssion = request.getSession();
				MemberVO loginuser = (MemberVO) sesssion.getAttribute("loginuser");
				
				OrderVO ovo = new OrderVO(loginuser.getUserid(), email, name, postcode, address,  detailAddress, extraAddress, mobile);
				request.setAttribute("ovo", ovo);
				super.setViewPage("/WEB-INF/jihyun/payInfo.jsp");
				
			} else { // 비회원주문
				OrderVO ovo = new OrderVO(email, name, postcode, address,  detailAddress, extraAddress, mobile);
				request.setAttribute("ovo", ovo);
				super.setViewPage("/WEB-INF/jihyun/payInfo.jsp");
				
			}// end of 
			
			
		}
		
		
	}

}
