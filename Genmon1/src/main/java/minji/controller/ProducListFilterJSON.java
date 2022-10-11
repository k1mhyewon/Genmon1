package minji.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

import common.controller.AbstractController;
import common.model.ChildProductVO;

import minji.model.InterProductDAO;
import minji.model.ProductDAO;

public class ProducListFilterJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String color = request.getParameter("checked_filter1");
		String material = request.getParameter("checked_filter2");
		String order = request.getParameter("checked_filter3");
		
		System.out.println(color);
		System.out.println(material);
		System.out.println(order);
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("color", color);
		paraMap.put("material", material);
		paraMap.put("order", order);
		
		InterProductDAO pdao = new ProductDAO();
		List<ChildProductVO> selectList = pdao.selectProductList(paraMap);
		
		// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
		
		// JSONArray => []
		String json="";
		JSONArray jsonArr = new JSONArray(); // []   ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONArray;)
		System.out.println("사이즈=>"+selectList.size());
		
		if( selectList.size() != 0 ) { // 글이 있으면 넣어두기 
			for( ChildProductVO cpvo : selectList) {
				// JSONObject => {}
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("pnum", cpvo.getPnum());
				jsonObj.put("salePcnt", cpvo.getSalePcnt());
				jsonObj.put("pqty", cpvo.getPqty());
				jsonObj.put("pcolor", cpvo.getPcolor());
				jsonObj.put("pimage1", cpvo.getPimage1());
				jsonObj.put("pname", cpvo.getParentProvo().getPname());
				jsonObj.put("price", cpvo.getParentProvo().getPrice());
				jsonObj.put("pmaterial", cpvo.getParentProvo().getPmaterial());
				
				jsonArr.put(jsonObj);
			}// end of for -----------------
			
			json = jsonArr.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
				
			System.out.println("~~~ 확인용 json =>"+json);
			request.setAttribute("json", json);
//			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
			
		} 
		
		else {
			System.out.println("확인용노노");
			json = jsonArr.toString();
			request.setAttribute("json", json);
//			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
		}
	
			
			
	}
	
}
