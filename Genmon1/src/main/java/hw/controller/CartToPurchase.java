package hw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.CartVO;
import common.model.MemberVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;

public class CartToPurchase extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(super.checkLogin(request)) { // 로그인 한 상태라면 바로 주문으로 가면 안대고 ㅎㅎ
	         
			// --------------------------------------------------------------- //
			
			
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
	         
	         
	         // --------------------------------------------------------------- //
	         
	         
	         
	         super.setRedirect(false);
	         super.setViewPage("/WEB-INF/jihyun/deliveryInfo.jsp");
	         
	      } else { // 로그인 안 한 상태라면 로그인 체크로
	         super.setRedirect(false);
	         super.setViewPage("/WEB-INF/jihyun/checkLogin.jsp");
	      }
		
	}

}
