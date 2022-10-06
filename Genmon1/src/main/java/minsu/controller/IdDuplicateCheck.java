package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;


public class IdDuplicateCheck extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String method = request.getMethod(); // "get"또는 "post"
		
		if("POST".equalsIgnoreCase(method)) {
		
			String userid = request.getParameter("userid");
			
			InterPersonDAO pdao = new PersonDAO();
			boolean isExists = pdao.idDuplicateCheck(userid); //userid가 중복되었는지 아닌지 DB에 보내서 확인. InterPersonDAO로 넘긴다
			
			// 결과물을 json(join.jsp)으로 넘긴다.
			
			JSONObject jsonObj = new  JSONObject(); // jsonObj은 자바스크립트 객체{}를 하나 만들어준다.
			jsonObj.put("isExists", isExists); // {"isExists":true} 또는 {"isExists":false}으로 만들어준다.
			
			String json = jsonObj.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}"으로 만들어줘서 web에 보낸다
			System.out.println(">> 확인용 json => " + json + "<< ");
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
		}
		
	}
}
