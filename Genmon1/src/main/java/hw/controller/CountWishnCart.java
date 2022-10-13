package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.MemberVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;

public class CountWishnCart extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(super.checkLogin(request)) { // 회원 이라면
			
			HttpSession session =  request.getSession(); 
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			String userid = loginuser.getUserid();
			
			InterCartDAO cdao = new CartDAO();
			
			String count = request.getParameter("count");
			
			if("cart".equals(count)) {
				int cnt = cdao.countCart(userid);
				
				String str_cnt = Integer.toString(cnt);
				
				// System.out.println("cnt: "+str_cnt);
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("cnt", str_cnt);
				
				String json = jsonObj.toString();
				request.setAttribute("json", json);

				super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
				
			}
			else if("wish".equals(count)) {
				
				
			}
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hw/cart.jsp");
			
		}
		
		
	}

}
