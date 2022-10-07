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

public class WishToCartSelect extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		if( !super.checkLogin(request)) {
			// 로그인이 안되어있다면 
			
		}
		
		else { // 로그인 된 상태라면
			
			try {

				HttpSession session =  request.getSession(); 
				  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				String userid = loginuser.getUserid();
				
				Map<String, String> paraMap = new HashMap<>();
				
				String[] arr_chkBoxArr = request.getParameterValues("chkBoxArr"); // 체크박스의 pnum 을 알아와서 map 에 넣음
				// System.out.println("arr_chkBoxArr:" + arr_chkBoxArr);
				
				int result = 0;
				
				if(arr_chkBoxArr != null && arr_chkBoxArr.length > 0) {
					
		            for(int i=0; i<arr_chkBoxArr.length; i++) {
		               // System.out.println("arr_chkBoxArr " + i +" : "+ arr_chkBoxArr[i]);
		            	
		            	paraMap.put("userid", userid);
		    			paraMap.put("pnum", arr_chkBoxArr[i]);
		    			
		    			InterWishlistDAO wishdao = new WishlistDAO();
		    			
		    			InterCartDAO cdao = new CartDAO();
		    			
		    			int isCartExist = cdao.isCartExist(paraMap.get("userid"), Integer.parseInt(paraMap.get("pnum")) ); // 장바구니에 들어잇는 값이 있는지 확인하고 개수 리턴(없으면 0 있으면 개수)
		    			
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
		    			
		       	    } // end of for -----------------------------------
		            
				} // end of if ----------------------------------------------------
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/wishlist.jsp");
					
				
			} catch(Exception e) {
				e.printStackTrace();
				
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		
		}
		
	}

}
