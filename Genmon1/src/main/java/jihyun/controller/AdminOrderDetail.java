package jihyun.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.OrderDetailVO;
import common.model.OrderVO;
import jihyun.model.InterOrderDAO;
import jihyun.model.InterPurchaseDAO;
import jihyun.model.OrderDAO;
import jihyun.model.PurchaseDAO;

public class AdminOrderDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String orderid = request.getParameter("orderid");
		
		InterOrderDAO odao = new OrderDAO();
		
		// 주문번호 가져왔고 나중에 뭐라도 해야대 알지
		// 주문조회 먼저하자... 조인으로 다가져올지... 따로 따로 가져올지... 일단 따로
		OrderVO odervo = odao.selectOneOrder(Long.valueOf(orderid));
		 
			
		// 주문번호로 주문상세 전부 가져오기
		List<OrderDetailVO> orddtailList = odao.selectOneOrderDetail(Long.valueOf(orderid) );
		
		// 주문 상세 모두 조회해서 주문 상태 정하기
		int total_status = 0;
		int totalqty = orddtailList.size();
		
		for(int i=0 ;i<totalqty; i++) {
			if(orddtailList.get(i).getOrder_status()== 3) {
				total_status = orddtailList.get(i).getOrder_status();
				break;
				
			} else if(orddtailList.get(i).getOrder_status()== 8){
				continue;
			} else {
				total_status = orddtailList.get(i).getOrder_status();
			}
		}
		
		// 주문번호로 결제 내역 가져오기 
		InterPurchaseDAO pdao = new PurchaseDAO();
		HashMap<String, Object> purvomap = pdao.SelectOnePurch(orderid);
		
		request.setAttribute("purvomap", purvomap);
		request.setAttribute("orddtailList", orddtailList);
		request.setAttribute("odervo", odervo);
		request.setAttribute("totalqty",totalqty); 
		request.setAttribute("total_status",total_status);
		
		
		
		super.setViewPage("/WEB-INF/jihyun/admin_order_detail.jsp");
		
	}

}
