package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hw.model.InterReviewDAO;
import hw.model.ReviewDAO;

public class ReviewCount extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pnum = request.getParameter("pnum");
		
		InterReviewDAO rdao = new ReviewDAO();
		
		int n = rdao.getReviewCnt(pnum);
		
		String cnt = String.valueOf(n); 
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("cnt", cnt);
		
		String json = jsonObj.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/common/jsonview.jsp");
		
		
	}

}
