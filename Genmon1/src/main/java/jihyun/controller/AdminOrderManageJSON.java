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
		
		if("주문".equals(ctype)) {
			
			// 일단 주문만 담아와보자
			InterOrderDAO odao = new OrderDAO();
			List<HashMap<String,String>> mapList = odao.adminSelectOnlyOrder();
			
			// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
			
			// JSONArray => []
			JSONArray jsonArr = new JSONArray(); // []   ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONArray;)
			
			
			if( mapList.size() > 0 ) { // 글이 있으면 넣어두기 
				for( HashMap<String,String> map : mapList) {
					// JSONObject => {}
					JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
//					contactid, fk_userid, email, ctype, contents
					jsonObj.put("purchase_status", map.get("PURCHASE_STATUS"));
					jsonObj.put("pk_orderid", map.get("PK_ORDERID"));
					jsonObj.put("orderdate", map.get("ORDERDATE"));
					jsonObj.put("name", map.get("NAME"));
					jsonObj.put("pnames", map.get("pnames"));
					
					jsonArr.put(jsonObj);
				}// end of for -----------------
				
				String json = jsonArr.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//				System.out.println("~~~ 확인용 json =>"+json);
				request.setAttribute("json", json);
				
//				super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
			} // 주문 내역이 있다면...
		
		} // 주문 탭이라면
		
	}

}
