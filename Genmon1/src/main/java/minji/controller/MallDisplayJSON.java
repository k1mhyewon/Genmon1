package minji.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import common.model.ChildProductVO;
import minji.model.InterProductDAO;
import minji.model.ProductDAO;

public class MallDisplayJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		String panmaestate = request.getParameter("panmaestate"); // 0 인지 1인지 
		String start = request.getParameter("start");
		String len = request.getParameter("len");
		
		InterProductDAO pdao = new ProductDAO();
		
		Map<String, String> paraMap = new HashMap<>();
//		paraMap.put("panmaestate", panmaestate);
		paraMap.put("start", start); //  start "1"   "9"  "17" 		"25"   "33"
		
		String end = String.valueOf( Integer.parseInt(start) + Integer.parseInt(len) - 1 ); // 스트링 타입은 int로 바꿔 계산을 하고 그 값은 다시 스트링으로 해줘야 한다.

		paraMap.put("end", end); //   end =>  start + len - 1 ;
								 //	 end  "8"    "16"  "24"		"32"	"40"     
		
		List<ChildProductVO> displayList = pdao.selectDisplay(paraMap); // 	파라맵 where절 필요
		
		JSONArray jsonArr = new JSONArray(); // 복수개 = 배열로 나타낸다. []
		
		if( displayList.size() > 0 ) {
			// 텅비어있으면 안 되고 0보다 커야 배열이 될 수 있다.
			// 리스트 배열크기,길이만큼 돌린다.
			for(ChildProductVO cpvo : displayList) {
				// [ {}, {}, {}  ] 컨트롤러에서 이런 형태로 바꿔준다.
				JSONObject jsonObj = new JSONObject(); // {} {}  {}  // 임포트 할 때 simple 아니고 그냥 java util로!! 
				
				// 생성된 이 빈껍데기 배열 안에 담아주기
				// pnum, pname, price, pcolor, pimage1, salePcnt, pqty, preleasedate, panmaestate
				jsonObj.put("pnum", cpvo.getPnum()); 
				jsonObj.put("pname", cpvo.getParentProvo().getPname()); 
				jsonObj.put("price", cpvo.getParentProvo().getPrice()); 
				jsonObj.put("pcolor", cpvo.getPcolor()); 
				jsonObj.put("pimage1", cpvo.getPimage1());
				jsonObj.put("salePcnt", cpvo.getSalePcnt());
				jsonObj.put("pqty", cpvo.getPqty());
				jsonObj.put("preleasedate", cpvo.getPreleasedate());
				jsonObj.put("panmaestate", cpvo.getPanmaestate());
	            
	            jsonArr.put(jsonObj); // jsonArr.add(jsonObj);  add가 아닌 똑같이 put
	            
			 }// end of for(ChildProductVO cpvo : displayList) 
				
	         // 현재 이 상태이다.[ {} {}  {} ]  현재 제이슨 어레이에 다 담겼다.
	          
				String json = jsonArr.toString(); // 문자열로 변환해준다.  // " [ {} {}  {} ] "
				
		//		System.out.println("확인용 json => "+ json);
	           
				request.setAttribute("json", json);
	            
	        //  super.setRedirect(false);
	            super.setViewPage("/WEB-INF/common/jsonview.jsp"); // json뷰에 뿌린다   request.setAttribute("json", json);
			}  
			else {
				// DB에서 조회된 것이 없다면
				String json = jsonArr.toString(); // 문자열로 반환
				// *** 만약에  select 되어진 정보가 없다라면 [] 로 나오므로 null 이 아닌 요소가 없는 빈배열이다. *** --
			    //   System.out.println("~~~~ 확인용 json => " + json);
			    //   ~~~~ 확인용 json => []
				
				request.setAttribute("json", json);
				
				 System.out.println(displayList.size());
				
			//  super.setRedirect(false);
	            super.setViewPage("/WEB-INF/common/jsonview.jsp"); 
			}
			
		}	
	
}
