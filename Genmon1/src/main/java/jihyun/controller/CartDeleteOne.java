package jihyun.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;

public class CartDeleteOne extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// DB는 회원만 있으니까
		if(super.checkLogin(request)) {
			String pnum = request.getParameter("pnum");
			
			HttpSession session =  request.getSession(); 
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			System.out.println(pnum);
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("pnum", pnum);
			paraMap.put("loginUserid", loginuser.getUserid());
			
			InterCartDAO cdao = new CartDAO();
			
			int n = cdao.cartDeleteOne(paraMap);
			
			if(n==1) {
				request.setAttribute("json", String.valueOf(n));
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
			}
			
		}
		
	}

}
