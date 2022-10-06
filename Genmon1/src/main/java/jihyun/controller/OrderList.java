package jihyun.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class OrderList extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(super.checkLogin(request)) { // 마이페이지는 로그인 했을때만
			
			HttpSession session =  request.getSession(); 
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			InterOrderDAO odao = new OrderDAO();
			
			// 아이디 가지고 주문 리스트 뿌려주기
			List<HashMap<String,String>> mapList =  odao.selectOrderList(loginuser.getUserid());
			
			request.setAttribute("mapList", mapList);
			
			System.out.println(mapList.size());
			
			super.setViewPage("/WEB-INF/jihyun/myinfo_orderList.jsp");
			
			
		} else { // 로그인 안한 사람이 들어오려함
			
			request.setAttribute("message", "비정상적인 접근입니다");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/common/msg.jsp");
			return;
		}
		
		
	}

}
