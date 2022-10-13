package jihyun.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.ContactVO;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class AdminOrderManageJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String ctype = request.getParameter("ctype"); // 
		InterOrderDAO odao = new OrderDAO();
		
		
		if("주문".equals(ctype)) {
			
			String select = "6,1,5";
			
			List<HashMap<String,String>> mapList = odao.adminSelectOrderS(select);
			
			// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
			
			// JSONArray => []
			JSONArray jsonArr = new JSONArray(); // []   ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONArray;)
			
			
			if( mapList.size() > 0 ) { // 글이 있으면 넣어두기 
				for( HashMap<String,String> map : mapList) {
					// JSONObject => {}
					JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
//					contactid, fk_userid, email, ctype, contents
					jsonObj.put("classname", "주문");
					jsonObj.put("pname", map.get("pname"));
					jsonObj.put("order_detail_id", map.get("order_detail_id"));
					jsonObj.put("orderid", map.get("orderid"));
					jsonObj.put("name", map.get("name"));
					if("6".equals(map.get("status"))) {
						jsonObj.put("status", "입금대기");
					} else if("1".equals(map.get("status"))) {
						jsonObj.put("status", "결제완료");
					} else if("5".equals(map.get("status"))) {
						jsonObj.put("status", "배송완료");
					}
					jsonObj.put("date", map.get("date"));
					
					jsonArr.put(jsonObj);
				}// end of for -----------------
				
				String json = jsonArr.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//				System.out.println("~~~ 확인용 json =>"+json);
				request.setAttribute("json", json);
				
//				super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
			} // 주문 내역이 있다면...
		
			
		} else if("취소".equals(ctype)) {
			
			String select = "0,7,9";
			
			List<HashMap<String,String>> mapList = odao.adminSelectOrderS(select);
			
			// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
			
			// JSONArray => []
			JSONArray jsonArr = new JSONArray(); // []   ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONArray;)
			
			
			if( mapList.size() > 0 ) { // 글이 있으면 넣어두기 
				for( HashMap<String,String> map : mapList) {
					// JSONObject => {}
					JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
//					contactid, fk_userid, email, ctype, contents
					jsonObj.put("classname", "취소");
					jsonObj.put("pname", map.get("pname"));
					jsonObj.put("order_detail_id", map.get("order_detail_id"));
					jsonObj.put("orderid", map.get("orderid"));
					jsonObj.put("name", map.get("name"));
					if("0".equals(map.get("status"))) {
						jsonObj.put("status", "주문취소");
					} else if("7".equals(map.get("status"))) {
						jsonObj.put("status", "미입금취소");
					} else if("9".equals(map.get("status"))) {
						jsonObj.put("status", "주문취소 환불완료");
					}
					jsonObj.put("date", map.get("date"));
					
					jsonArr.put(jsonObj);
				}// end of for -----------------
				
				String json = jsonArr.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//				System.out.println("~~~ 확인용 json =>"+json);
				request.setAttribute("json", json);
				
//				super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
			} // 주문 내역이 있다면...
			
		} else if("환불".equals(ctype)) {
			
			
			List<HashMap<String,String>> mapList = odao.adminSelectRefundOrder();
			
			// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
			
			// JSONArray => []
			JSONArray jsonArr = new JSONArray(); // []   ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONArray;)
			
			
			if( mapList.size() > 0 ) { // 글이 있으면 넣어두기 
				for( HashMap<String,String> map : mapList) {
					// JSONObject => {}
					JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
//					contactid, fk_userid, email, ctype, contents
					jsonObj.put("classname", "환불");
					jsonObj.put("pname", map.get("pname"));
					jsonObj.put("order_detail_id", map.get("order_detail_id"));
					jsonObj.put("orderid", map.get("orderid"));
					jsonObj.put("name", map.get("name"));
					if("0".equals(map.get("status"))) {
						jsonObj.put("status", "환불신청");
					} else if("1".equals(map.get("status"))) {
						jsonObj.put("status", "환불수거완료");
					} else if("2".equals(map.get("status"))) {
						jsonObj.put("status", "환불완료");
					}
					jsonObj.put("date", map.get("date"));
					
					jsonArr.put(jsonObj);
				}// end of for -----------------
				
				String json = jsonArr.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//				System.out.println("~~~ 확인용 json =>"+json);
				request.setAttribute("json", json);
				
//				super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
			}	
			
		} else if("완료".equals(ctype)) {
			
			String select = "4,8";
			
			List<HashMap<String,String>> mapList = odao.adminSelectOrderS(select);
			
			// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
			
			// JSONArray => []
			JSONArray jsonArr = new JSONArray(); // []   ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONArray;)
			
			
			if( mapList.size() > 0 ) { // 글이 있으면 넣어두기 
				for( HashMap<String,String> map : mapList) {
					// JSONObject => {}
					JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
//					contactid, fk_userid, email, ctype, contents
					jsonObj.put("classname", "주문완료");
					jsonObj.put("pname", map.get("pname"));
					jsonObj.put("order_detail_id", map.get("order_detail_id"));
					jsonObj.put("orderid", map.get("orderid"));
					jsonObj.put("name", map.get("name"));
					jsonObj.put("status", "구매확정");
					jsonObj.put("date", map.get("date"));
					
					jsonArr.put(jsonObj);
				}// end of for -----------------
				
				String json = jsonArr.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//				System.out.println("~~~ 확인용 json =>"+json);
				request.setAttribute("json", json);
				
//				super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
			} // 주문 내역이 있다면...
			
		}
		
	}

}
