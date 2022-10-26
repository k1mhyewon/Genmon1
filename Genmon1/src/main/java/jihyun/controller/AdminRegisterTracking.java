package jihyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class AdminRegisterTracking extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 관리자일때만
		if(super.checkAdmin(request)) {
		
			String method = request.getMethod();
			
			// get 방식 처음 들어왔을때 페이지 띄어주기
			if("GET".equalsIgnoreCase(method)) {
				
				InterOrderDAO odao = new OrderDAO();
				List<HashMap<String,String>> mapList =  odao.selectAllNeedShipOrder(); // 배송등록 목록 불러오기
				
				request.setAttribute("mapList", mapList);
				
				super.setViewPage("/WEB-INF/jihyun/admin_order_register_tracking.jsp");
				
				
				
			} else { // post 방식 // 배송지 등록 ajax
				
				// 배송지에 insert 해주고 
				// 교환배송이라면 교환 상태 없뎃
				// 일반 배송이라면 일반주문 상세 상태 업뎃
				String orderidjoin = request.getParameter("orderidjoin");
				String trackjoin = request.getParameter("trackjoin");
				String companyjoin = request.getParameter("companyjoin");
				String orderstatusjoin = request.getParameter("orderstatusjoin");
				
				//System.out.println(orderidjoin);
				//System.out.println(trackjoin);
				//System.out.println(companyjoin);
				//System.out.println(orderstatusjoin);
				
				InterOrderDAO odao = new OrderDAO();
				Map<String, String> paraMap = new HashMap<>();
				
				paraMap.put("orderidjoin", orderidjoin);
				paraMap.put("trackjoin", trackjoin);
				paraMap.put("companyjoin", companyjoin);
				paraMap.put("orderstatusjoin", orderstatusjoin);
				
				odao.insertManyTrack(paraMap); // 배송지 일괄등록 및 업데이트 
				
			}
		
		} else {
			
			request.setAttribute("message", "비정상적인 접근입니다");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/common/msg.jsp");
			return;
		}
		
	}

}
