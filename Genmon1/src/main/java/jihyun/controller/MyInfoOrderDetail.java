package jihyun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import common.model.OrderDetailVO;
import common.model.OrderVO;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class MyInfoOrderDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 마이인포니까 회원만 // 주문번호랑 fk_userid 비교해주기
		if(super.checkLogin(request)) {
			
			String orderid = request.getParameter("orderid");
			String totalqty = request.getParameter("totalqty");
			
			HttpSession session =  request.getSession(); 
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			// 일단 조회하기
			InterOrderDAO odao = new OrderDAO();
			
			try {
				
				// 주문조회 먼저하자... 조인으로 다가져올지... 따로 따로 가져올지... 일단 따로
				OrderVO odervo = odao.selectOneOrder(Long.valueOf(orderid));
				 
				if(loginuser.getUserid().equals(odervo.getFk_userid()) ) { // 로그인 한 회원의 주문일때
					
					// 주문번호로 주문상세 전부 가져오기
					List<OrderDetailVO> orddtailList = odao.selectOneOrderDetail(Long.valueOf(orderid) );
					
					request.setAttribute("orddtailList", orddtailList);
					request.setAttribute("odervo", odervo);
					request.setAttribute("totalqty",totalqty);
					
					
					super.setViewPage("/WEB-INF/jihyun/myinfo_orderDetail.jsp");
					
					
				} else { // 본인의 주문이 아닐때
					request.setAttribute("message", "비정상적인 접근입니다");
					request.setAttribute("loc", "javascript:history.back()");
					
					super.setViewPage("/WEB-INF/common/msg.jsp");
					return;
				}
				
			} catch (NumberFormatException e) { // 주문번호를 문자로 장난친거
				request.setAttribute("message", "주문번호는 숫자만 들어올 수 있습니다.");
				request.setAttribute("loc", "javascript:history.back()");
				
				super.setViewPage("/WEB-INF/common/msg.jsp");
				return;
				
			} catch (Exception e) {
				request.setAttribute("message", "비정상적인 접근입니다");
				request.setAttribute("loc", "javascript:history.back()");
				
				super.setViewPage("/WEB-INF/common/msg.jsp");
				return;
			}
			
			
		} else {// 로그인 안한채로 넘어온거임
			request.setAttribute("message", "비정상적인 접근입니다");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/common/msg.jsp");
			return;
		}
		
		
	}

}
