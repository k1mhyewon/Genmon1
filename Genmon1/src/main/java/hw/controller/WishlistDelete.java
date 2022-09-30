package hw.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hw.model.InterWishlistDAO;
import hw.model.WishlistDAO;

public class WishlistDelete extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			// System.out.println("wishlistDelete 로 넘어옴");
			
			String userid = request.getParameter("fk_userid");
			String pnum = request.getParameter("fk_pnum");
			
			// System.out.println("userid: "+userid);
			// System.out.println("pnum: "+pnum);
			
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("userid", userid);
			paraMap.put("pnum", pnum);
			
			InterWishlistDAO wishdao = new WishlistDAO();
			
			int result = wishdao.deleteWishlist(paraMap);
			
			if(result == 1) {
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/wishlist.jsp");
				
			}
			else {
				// 로그인한 사용자가 다른 사용자의 정보를 수정하려고 시도하는 경우
				String message = "오류 발생";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			
			
			
			
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
	}

}
