package hw.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;
import hw.model.InterWishlistDAO;
import hw.model.WishlistDAO;

public class WishToCartOne extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		


		if( !super.checkLogin(request)) {
			// 로그인이 안되어있다면 
			
		}
		
		else {
			// 로그인이 되어있다면 
			
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

    			InterCartDAO cdao = new CartDAO();
    			
    			int isCartExist = cdao.isCartExist(userid, Integer.parseInt(pnum) ); // 장바구니에 들어잇는 값이 있는지 확인하고 개수 리턴(없으면 0 있으면 개수)
    			
    			int result = 0;
    			
    			if(isCartExist == 0) { // 해당 상품이 장바구니에 없다면
    				result = wishdao.wishToCartInsert(paraMap); // insert
    			}
    			else {
    				paraMap.put("qty", String.valueOf(isCartExist+1) );  // qty(업데이트할개수) 에 현재 있는 개수+1 넣기
    				
    				result = wishdao.wishToCartUpdate(paraMap); // insert
    				
    			}
    			
    			if(result != 1) { // delete 에서 오류가 발생했다면 
    				
    				String message = "오류 발생"; 
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					
					return; // 메소드 종료
    			}
				
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		}
		
		
	}

}
