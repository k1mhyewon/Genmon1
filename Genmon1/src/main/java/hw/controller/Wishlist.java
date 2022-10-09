package hw.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.MemberVO;
import hw.model.InterWishlistDAO;
import hw.model.WishlistDAO;
import hw.model.WishlistVO;

public class Wishlist extends AbstractController {

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
		
		if(loginuser.getUserid().equals(userid)) {
			
			InterWishlistDAO wishdao = new WishlistDAO();
			
			List<WishlistVO> wishList = wishdao.selectWishlist(userid);
			
			/*
			JSONArray jsonArr = new JSONArray();  // []
			
			if( wishList.size() > 0 ) { // db에 wishlist 상품이 있다면
				
				for( WishlistVO wishvo : wishList) {
					
					JSONObject jsonObj = new JSONObject(); // {}
					
					jsonObj.put("pimage1", wishvo.getPimage1() ); // {"pimage1":didion_1.jpg
					jsonObj.put("pname", wishvo.getPname());
					jsonObj.put("price", wishvo.getPrice());
					
					jsonArr.put(jsonObj); // [{},{},{},{}]
					
				} // end of for --------------------
				
				String json = jsonArr.toString(); // 문자열로 변환 "[{},{},{},{}]"
				System.out.println("~~~ json : "+ json);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/wishlist.jsp");
				
			}
			else { // db에 wishlist 상품이 없다면
				
				String json = jsonArr.toString(); // 문자열로 변환 "[{},{},{},{}]"
				// *** 만약에  select 되어진 정보가 없다라면 [] 로 나오므로 null 이 아닌 요소가 없는 빈배열이다. *** --
				
				request.setAttribute("json", json);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/wishlist.jsp");
				
			}
			*/
			
			request.setAttribute("wishList", wishList);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hw/wishlist.jsp");
			
		}
		else {
			// 로그인한 사용자가 다른 사용자의 정보를 수정하려고 시도하는 경우
			String message = "다른 사용자의 my page 로는 접근 불가합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		
		}
	}

}
