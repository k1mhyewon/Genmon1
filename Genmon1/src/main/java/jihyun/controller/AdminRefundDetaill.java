package jihyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jihyun.model.InterOrderDAO;
import jihyun.model.InterPurchaseDAO;
import jihyun.model.OrderDAO;
import jihyun.model.PurchaseDAO;

public class AdminRefundDetaill extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(super.checkAdmin(request)) {
			
			String orderid = request.getParameter("orderid");
			
			InterOrderDAO odao = new OrderDAO();
			 
			// 주문번호로 환불 리스트 가져오기 (반복)
			List<Map<String, String>> orderRefundMapList = odao.selectOneOrderRefundList(orderid );
			
			// 주문번호로 환불 주문의 주문자 정보 가져오기 
			Map<String, String> refundOrderInfo = odao.selectrefundOrderInfo(orderid );
			
			// 주문번호로 결제 내역 가져오기 
			InterPurchaseDAO pdao = new PurchaseDAO();
			HashMap<String, Object> purvomap = pdao.SelectOnePurch(orderid);
			
			
			request.setAttribute("orderRefundMapList", orderRefundMapList);
			request.setAttribute("refundOrderInfo", refundOrderInfo);
			request.setAttribute("purvomap", purvomap);
			
			
			super.setViewPage("/WEB-INF/jihyun/admin_return_detail.jsp");

		} else {
			
			request.setAttribute("message", "비정상적인 접근입니다");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/common/msg.jsp");
			return;
		}
		
		
	}

}
