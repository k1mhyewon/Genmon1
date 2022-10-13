package jihyun.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class AdminSalesStatus extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		if(super.checkAdmin(request)) {
			
			String method = request.getMethod();
			
			
			// 겟방식이라면 (처음에 넘어왔을때
			if("GET".equalsIgnoreCase(method)) {
				
				InterOrderDAO odao = new OrderDAO();
				
				// 판매현황 페이지 띄워주기
				List<Map<String,String>> salemapList = odao.selectSaleTable();
				
				// 이번주 합계
				Map<String,String> weeksalemap = odao.selectWeekSale();
				
				// 이번달 합계
				Map<String,String> monthsalemap = odao.selectMonthSale();
	
				// 차트 그리기
				Map<String,String> sixmonthChartmap = odao.sixmonthChart();
				
				
				request.setAttribute("salemapList", salemapList);
				request.setAttribute("weeksalemap", weeksalemap);
				request.setAttribute("monthsalemap", monthsalemap);
				request.setAttribute("sixmonthChartmap", sixmonthChartmap);
				
				super.setViewPage("/WEB-INF/jihyun/admin_sales_status.jsp");
				
			// post 방식이라면 검색기능 사용
			} else {
				
			}
		
			
		}  else {
			
			request.setAttribute("message", "비정상적인 접근입니다");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/common/msg.jsp");
			return;
		}
		
	}

}
