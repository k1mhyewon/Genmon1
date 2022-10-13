package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.MemberVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;

public class CartCount extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if( !super.checkLogin(request)) {
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("cartCnt", 0);
			
			String json = jsonObj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
	         
		}
		else {
			HttpSession session =  request.getSession(); 
			  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			// System.out.println("확인용 loginuser.userid : " + loginuser.getUserid());
			
			String userid = loginuser.getUserid();
			
			InterCartDAO cdao = new CartDAO();
			
			int n = cdao.countCart(userid);
			
			// System.out.println("카트카운트 컨트롤러 44 n: "+ n);
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("cartCnt", n);
			
			String json = jsonObj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
		}
		
		
		
	}

}
