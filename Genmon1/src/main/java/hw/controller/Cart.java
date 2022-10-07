package hw.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.CartVO;
import common.model.MemberVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;
import hw.model.InterWishlistDAO;
import hw.model.WishlistDAO;
import hw.model.WishlistVO;

public class Cart extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// System.out.println("컨트롤러 입성");
		
		if(super.checkLogin(request)) { // 회원 이라면
			
			HttpSession session =  request.getSession(); 
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			String fk_userid = loginuser.getUserid();
			
			InterCartDAO cdao = new CartDAO();
            List<CartVO> cartList = cdao.memberCartSelect(fk_userid);
            int listSize = cartList.size();
            
            request.setAttribute("cartList", cartList);
            request.setAttribute("listSize", listSize);
            
            super.setRedirect(false);
            super.setViewPage("/WEB-INF/hw/cart.jsp");
			
			
		} else { // 비회원이라면]
			
			super.setRedirect(false);
            super.setViewPage("/WEB-INF/hw/cart.jsp");
		}
		
		
		
		
		
	}

}
