package jihyun.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.CartVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;

public class NotMemberCartDisplayJASON extends AbstractController {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String all_key = request.getParameter("allkey");
		String all_qty = request.getParameter("allqty");
		
		//System.out.println(all_key);
		//System.out.println(all_qty);
		
		String[] arr_key = all_key.split(",");
		String[] arr_qty = all_qty.split(",");
		
		List<CartVO> carttList = new ArrayList<>();
		InterCartDAO cdao = new CartDAO();
		
		for(int i =0; i<arr_qty.length; i++) {
			
			CartVO cvo = cdao.selectOneOrder(arr_key[i], arr_qty[i]);
			
			//System.out.println(arr_key[i]);
			//System.out.println( arr_qty[i]);
			
			carttList.add(cvo);
		}
		
		// 결과물을 json(javascript) 형태로 보내줘야한다
		
		JSONArray jsonArr = new JSONArray(); // list를 []로 바꿔줘야함  
		
		if(carttList.size() >0) {
			for(CartVO cvo: carttList) {
				JSONObject jsonObj = new JSONObject();// {} 인 객체로 바꿔주는 것
				// list의 크기만큼 {},{},{},{},{},{},{},{}
				
				jsonObj.put("pnum",cvo.getFk_pnum());
				jsonObj.put("qty",cvo.getQty());
				jsonObj.put("pname",cvo.getAllProdvo().getParentProvo().getPname());
				jsonObj.put("colname",cvo.getAllProdvo().getColorName());
				jsonObj.put("image",cvo.getAllProdvo().getPimage1());
				jsonObj.put("price",cvo.getAllProdvo().getParentProvo().getPrice());
				
				jsonArr.put(jsonObj); // [{},{},{},{},{},{},{},{}]
			}
			
			String json = jsonArr.toString(); // 문자열로 변환 // "[{},{},{},{},{},{},{},{}]"
			// System.out.println(json);
			
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
			
		} else { // DB에서 조회된 것이 없다면
			 String json = jsonArr.toString(); // 문자열로 변환 "[]" 빈껍데기
			// *** 만약에  select 되어진 정보가 없다라면 [] 로 나오므로 null 이 아닌 요소가 없는 빈배열이다. *** --
		    //   System.out.println("~~~~ 확인용 json => " + json);
		    //   ~~~~ 확인용 json => []
			
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
		}
	}

}
