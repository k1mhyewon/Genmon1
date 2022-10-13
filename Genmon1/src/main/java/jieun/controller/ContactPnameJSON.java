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
import jieun.model.InterProductDAO;
import jieun.model.ParentProductVO;
import jieun.model.ProductDAO;

public class ContactPnameJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pname = request.getParameter("pname");
		
		//Map<String,String> paraMap = new HashMap<>();
		//paraMap.put("pname", pname);
		
		InterProductDAO pdao = new ProductDAO();
		ParentProductVO pvo = pdao.selectPnameInfo(pname);
		
		// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
		
		// JSONArray => []
		// JSONArray jsonArr = new JSONArray(); // []   ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONArray;)
		
		
		// JSONObject => {}
		JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
//				contactid, fk_userid, email, ctype, contents
		jsonObj.put("price", pvo.getPrice());
		//  jsonObj.put("fk_userid", cvo.getFk_userid());
		jsonObj.put("pcontent", pvo.getPcontent());
		jsonObj.put("pmaterial", pvo.getPmaterial());
		
		String json = jsonObj.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//			System.out.println("~~~ 확인용 json =>"+json);
		request.setAttribute("json", json);
		
//			super.setRedirect(false);
		super.setViewPage("/WEB-INF/common/jsonview.jsp");

		

	}

}
