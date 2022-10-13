package jihyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jihyun.model.InterOrderDAO;
import jihyun.model.InterPurchaseDAO;
import jihyun.model.OrderDAO;
import jihyun.model.PurchaseDAO;

public class AdminCheckMoneyIn extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(super.checkAdmin(request)) {
			
			String method = request.getMethod();
			
			if("post".equalsIgnoreCase(method)) {
				
				String orderid = request.getParameter("orderid");
				String pnumjoin = request.getParameter("pnumjoin");
				
				InterOrderDAO odao = new OrderDAO();
				
				// 주문 상태 바꿔주고
				odao.checkMoneyIn(orderid); 
				
				// 상품재고 감소시켜야 됨
				int result = odao.decreaOrIncreaProdQty(pnumjoin, -1);
				
				// 그리고 결제 테이블 상태 바꿔줘야 취소가 안됨...
				InterPurchaseDAO purdao = new PurchaseDAO();
				result += purdao.updatePurStatus(orderid);
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("result", result);
				String json = jsonObj.toString();
				request.setAttribute("json", json);
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
				
			}
			
		} else {
			
			request.setAttribute("message", "비정상적인 접근입니다");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/common/msg.jsp");
			return;
		}
		
	}

}
