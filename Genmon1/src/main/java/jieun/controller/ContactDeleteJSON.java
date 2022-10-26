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

public class ContactDeleteJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pwd = request.getParameter("pwd");
		String contactid = request.getParameter("contactid");
		
		//Map<String,String> paraMap = new HashMap<>();
		//paraMap.put("pname", pname);
		
		InterContactDAO cdao = new ContactDAO();
		int result= cdao.deleteMyContact(pwd, contactid);
		String message = result==1? "문의삭제에 성공했습니다!":"비밀번호 입력값이 틀립니다!";
		JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
//				contactid, fk_userid, email, ctype, contents
		jsonObj.put("message", message);
		
		String json = jsonObj.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//			System.out.println("~~~ 확인용 json =>"+json);
		request.setAttribute("json", json);
		
//			super.setRedirect(false);
		super.setViewPage("/WEB-INF/common/jsonview.jsp");

		

	}

}
