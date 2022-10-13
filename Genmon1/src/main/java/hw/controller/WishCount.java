package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hw.model.InterWishlistDAO;
import hw.model.WishlistDAO;

public class WishCount extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pnum = request.getParameter("pnum");
		
		InterWishlistDAO wdao = new WishlistDAO();
		
		int n = wdao.wishCount(pnum);
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("wishCnt", n);
		
		String json = jsonObj.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/common/jsonview.jsp");
		
	}

}
