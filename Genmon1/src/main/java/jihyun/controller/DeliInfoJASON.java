package jihyun.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class DeliInfoJASON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		
		if("post".equalsIgnoreCase(method)) { // post 로만 넘어옴
			
			
			if(super.checkAdmin(request)) { // 관리자 페이지용
				
				String orderid = request.getParameter("orderid");
				String deliv_class = request.getParameter("deliv_class");
				// System.out.println(orderid); 
				
				InterOrderDAO odao = new OrderDAO();
				HashMap<String, String> delimap = odao.selectOneDeliInfo(orderid, deliv_class);
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("deliv_company", delimap.get("deliv_company"));
				jsonObj.put("tracking_number", delimap.get("tracking_number"));
				jsonObj.put("deliv_date", delimap.get("deliv_date"));
				
				String json = jsonObj.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//				System.out.println("~~~ 확인용 json =>"+json);
				request.setAttribute("json", json);
				
				
			// 회원이 조회해보는 것
			} else {
				
				String total_status = request.getParameter("total_status");
				String orderid = request.getParameter("orderid");
				
				//System.out.println(total_status);
				//System.out.println(orderid);
				
				if("5".equals(total_status) || "4".equals(total_status)) {
					InterOrderDAO odao = new OrderDAO();
					HashMap<String, String> delimap = odao.selectOneDeliInfo(orderid, "1");
					
					JSONObject jsonObj = new JSONObject();
					
					jsonObj.put("deliv_company", delimap.get("deliv_company"));
					jsonObj.put("tracking_number", delimap.get("tracking_number"));
					jsonObj.put("deliv_date", delimap.get("deliv_date"));
					
					String json = jsonObj.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//					System.out.println("~~~ 확인용 json =>"+json);
					request.setAttribute("json", json);
					
				} else {
					JSONObject jsonObj = new JSONObject();
					String json = jsonObj.toString();
					request.setAttribute("json", json);
				}
			}
			
			
			
//			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
		} // end of post
		
	}

}
