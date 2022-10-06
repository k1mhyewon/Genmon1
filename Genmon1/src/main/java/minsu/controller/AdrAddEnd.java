package minsu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class AdrAddEnd extends AbstractController {

	// 주소추가 및 기본 배송지를 보여주는 곳 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser  = (MemberVO)session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		System.out.println("~~~ 확인용2 : " + request.getParameter("address"));
		System.out.println("~~~ 확인용2 : " + request.getParameter("detailAddress"));
		System.out.println("~~~ 확인용2 : " + request.getParameter("extraAddress"));
	
		
		if(!super.checkLogin(request)) {
				// 로그인 안했으면 
			    String message = "회원정보를 수정하려면 먼저 로그인을 하세요.!!";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	      //   super.setRedirect(false);
	           super.setViewPage("/WEB-INF/common/msg.jsp");
	           return;
			}
			else {
		
				String method = request.getContextPath();
				
				if("get".equals(method)) {
					  String message = "회원정보 수정이 불가합니다.!!";
			          String loc = "javascript:history.back()";
			            
			            request.setAttribute("message", message);
			            request.setAttribute("loc", loc);
			            
			      //   super.setRedirect(false);
			           super.setViewPage("/WEB-INF/common/msg.jsp");
			           return;
				}
				else {
					
					String name = request.getParameter("name");
					String postcode = request.getParameter("postcode");
					String address = request.getParameter("address");
					String detailAddress = request.getParameter("detailAddress");
					String extraAddress = request.getParameter("extraAddress");
					
					
					 Map<String,String> paraMap = new HashMap<>();
					 paraMap.put("name",name);
		        	 paraMap.put("postcode",postcode);
		        	 paraMap.put("address",address);
		        	 paraMap.put("detailAddress",detailAddress);
		        	 paraMap.put("extraAddress",extraAddress);
		        	 paraMap.put("userid",userid);
					
					// DB에 주소를 추가하기
					InterPersonDAO pdao =  new PersonDAO();
					int n = pdao.addAdreess(paraMap);
				
			         if(n == 1) {
			        	 
			        	 String message = "주소등록 성공!!";
			        	 String loc = "/WEB-INF/minsu/adrView.jsp"; 
			        	 
			        	request.setAttribute("message", message);
						request.setAttribute("loc", loc);
			        	 
			         }
			         else {
			        	 String  message = "주소등록 실패!!";
			        	 String loc = "javascript:history.back()"; // 이전페이지로 이동
				         
				        request.setAttribute("message", message);
						request.setAttribute("loc", loc);
							
						//	super.setRedirect(false);
							super.setViewPage("/WEB-INF/common/msg.jsp");
			         }
				
					
				}
			}
	}
}