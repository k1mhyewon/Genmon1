package hw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.ReviewVO;
import hw.model.InterReviewDAO;
import hw.model.ReviewDAO;

public class ReviewDisplayJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String type = request.getParameter("type");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("type", type);
		
		InterReviewDAO rdao = new ReviewDAO();
		
		List<ReviewVO> reviewList = rdao.selectReviewListforAdmin(paraMap);
		// 복수개이므로 자바스크립트의 배열형식으로 받아와야함.
		
		// JSONArray => []
		JSONArray jsonArr = new JSONArray();
		
		if( reviewList.size() > 0 ) {
			for(ReviewVO rvo: reviewList) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("content", rvo.getContent());
				jsonObj.put("orderDetailId", rvo.getFk_pk_order_detail_id());
				jsonObj.put("uploaddate", rvo.getUploaddate());
				jsonObj.put("img", rvo.getImg_orginFileName());
				jsonObj.put("star", rvo.getStar_text());
				jsonObj.put("reply", rvo.getReply());
				jsonObj.put("userid", rvo.getOdvo().getOvo().getFk_userid());
				
				jsonArr.put(jsonObj);
				
			}
			
			String json = jsonArr.toString();
			
			// System.out.println("~~~ 컨트롤러 확인용 json =>"+json);
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
		}
		
		else {  // DB 에서 조회된 것이 없다라면 
			String json = jsonArr.toString(); 	// 문자열로 변환  
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
