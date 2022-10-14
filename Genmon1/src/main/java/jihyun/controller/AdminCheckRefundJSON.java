package jihyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class AdminCheckRefundJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		if(super.checkAdmin(request)) {
			String orderid = request.getParameter("orderid");
			String pnumjoin = request.getParameter("pnumjoin");
			
			//System.out.println(orderid);
			//System.out.println(pnumjoin);
			
			 InterOrderDAO odao = new OrderDAO();
			
			// 환불 테이블 상태 바꿔주고 (status랑 endday)
			odao.checkRefund(orderid);
			
			// 상품재고 늘려줘야함
			int result = odao.decreaOrIncreaProdQty(pnumjoin, 1);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", result);
			String json = jsonObj.toString();
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
		} else {
			
			request.setAttribute("message", "비정상적인 접근입니다");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/common/msg.jsp");
			return;
		}
		
	}

}
