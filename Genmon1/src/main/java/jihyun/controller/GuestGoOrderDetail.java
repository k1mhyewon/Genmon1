package jihyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.OrderVO;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class GuestGoOrderDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();

		
		// 겟방식으로 넘어온 거라면 페이지 보여주기
		if("get".equalsIgnoreCase(method)) { 
			
			request.setAttribute("method", method);
			super.setViewPage("/WEB-INF/jihyun/guestGoOrderDetail.jsp");
			
		} else { // post 방식으로 넘어온 거라면 주문번호 조회하기
			
			String input_orderid = request.getParameter("name");
			String input_email = request.getParameter("email");
			
			
			InterOrderDAO adao = new OrderDAO();
			OrderVO ovo = adao.findGuestOrder(input_orderid, input_email); // 비회원 주문조회 메소드
			
			if(ovo!=null) { // 주문번호 맞으면 원래페이지로 가고
				
				request.setAttribute("orderid", ovo.getPk_orderid());
				
				request.setAttribute("method", method);
				super.setViewPage("/WEB-INF/jihyun/guestGoOrderDetail.jsp");
				
				
			} else {
				// 틀리면 가마니
				request.setAttribute("method", method);
				super.setViewPage("/WEB-INF/jihyun/guestGoOrderDetail.jsp");
			}
			
		}
	}

}
