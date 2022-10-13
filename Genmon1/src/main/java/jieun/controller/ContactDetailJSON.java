package jieun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.ContactVO;
import jieun.model.ContactDAO;
import jieun.model.InterContactDAO;

public class ContactDetailJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String contactid = request.getParameter("contactid");
		
		
		InterContactDAO cdao = new ContactDAO();
		Map<String,String> paraMap  = cdao.selectContactDetail(contactid);
		System.out.println(paraMap.get("contactid")+" "+paraMap.get("acontents")+" "+paraMap.get("registerday"));
		// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
		
		// JSONArray => []
		
		JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
		if( paraMap.size() > 0 ) { // 글이 있으면 넣어두기 
				// JSONObject => {}
//				contactid, fk_userid, email, ctype, contents
			jsonObj.put("contactid", paraMap.get("contactid"));
			jsonObj.put("acontents", paraMap.get("acontents"));
			jsonObj.put("registerday", paraMap.get("registerday"));
			
			
			String json = jsonObj.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
			System.out.println("~~~ 확인용 json =>"+json);
			request.setAttribute("json", json);
//			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
		}
		else {  // DB 에서 조회된 것이 없다라면 
			String json = jsonObj.toString(); 	// 문자열로 변환  
			// "[]"  빈껍데기
			// *** 만약에  select 되어진 정보가 없다라면 [] 로 나오므로 null 이 아닌 요소가 없는 빈배열이다. *** --
//			   System.out.println("~~~~ 확인용 json => " + json);
			//   ~~~~ 확인용 json => []
			request.setAttribute("json", json);
			
//			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
		}
		

	}

}
