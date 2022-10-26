package jihyun.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class AdminSearchChartJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(super.checkAdmin(request)) {
			
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");	
			
			InterOrderDAO odao = new OrderDAO();
			
			// 판매현황 페이지 띄워주기
			List<Map<String,String>> searchSalemapList = odao.seachSelectSaleTable(startday, endday);
				
				
			JSONArray jsArr = new JSONArray();
			
			if(searchSalemapList !=null && searchSalemapList.size()>0) {
				
				for(Map<String,String> searchSalemap : searchSalemapList) {
					
					JSONObject jsobj= new JSONObject();
					
					jsobj.put("date", searchSalemap.get("date"));
					jsobj.put("order", searchSalemap.get("order"));
					jsobj.put("cancel", searchSalemap.get("cancel"));
					jsobj.put("refund", searchSalemap.get("refund"));
					jsobj.put("total", searchSalemap.get("total"));
					
					jsArr.put(jsobj);
					
				} // end of for
			} // end of if
			
			String json = jsArr.toString(); // 제품후기가 없는경우 "[]"
											// 제품후기가 있는경우 "[{},{},{}]"
			
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
