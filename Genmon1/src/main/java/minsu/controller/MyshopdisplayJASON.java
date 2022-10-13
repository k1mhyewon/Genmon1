package minsu.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.ContactVO;
import minsu.model.InterShopDAO;
import minsu.model.ShopDAO;

public class MyshopdisplayJASON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String city = request.getParameter("city");
		
		InterShopDAO sdao = new ShopDAO();
		
		Map<String, String> paraMap =  sdao.showShop(city);
		
		
		JSONObject jsonObj = new JSONObject(); 

		jsonObj.put("sname", paraMap.get("sname"));
		jsonObj.put("simg", paraMap.get("simg"));
		jsonObj.put("sadr", paraMap.get("sadr"));
		jsonObj.put("stel", paraMap.get("stel"));
		jsonObj.put("stime", paraMap.get("stime"));
		jsonObj.put("sdesc", paraMap.get("sdesc"));
			
		
		String json = jsonObj.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
		request.setAttribute("json", json);
		
//					super.setRedirect(false);
		super.setViewPage("/WEB-INF/common/jsonview.jsp");
		
		
		
		
		
	}

}
