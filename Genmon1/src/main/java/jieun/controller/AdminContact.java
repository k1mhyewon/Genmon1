package jieun.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import common.util.MyUtil;
import jieun.model.ContactDAO;
import jieun.model.InterContactDAO;

public class AdminContact extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// === 로그인을 하지 않은 상태라면 조회가 불가능하도록 한다. === //
					if( !super.checkLogin(request) ) {
						String message = "먼저 로그인을 하세요!!";
						String loc = "javascript:history.back()";
						
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						
					//	super.setRedirect(false);
						super.setViewPage("/WEB-INF/common/msg.jsp");
						
					}
					
					else { // 로그인을 한경우 
						HttpSession session = request.getSession();
						MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
						
						if(!"admin".equals(loginuser.getUserid())) {
							// === 관리자(admin)가 아닌 일반사용자로 로그인 했을 때는 조회가 불가능하도록 한다. === //
							String message = "관리자만 접근가능합니다!!";
							String loc = "javascript:history.back()";
							
							request.setAttribute("message", message);
							request.setAttribute("loc", loc);
							
						//	super.setRedirect(false);
							super.setViewPage("/WEB-INF/common/msg.jsp");
						}
						else {
							// === 관리자(admin)로 로그인 했을 때만 조회가 가능하도록 한다. === //
							
							//InterContactDAO cdao = new ContactDAO();
							
							//Map<String, String> paraMap = new HashMap<>();
//							paraMap.put("searchType", searchType);
//							paraMap.put("searchWord", searchWord);
					
							
							
						 // **** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 **** //
				            String currentURL = MyUtil.getCurrentURL(request);
				            // 회원조회를 했을시 현재 그 페이지로 그대로 되돌아가기 위한 용도로 쓰임.
				            currentURL = currentURL.replaceAll("&", " ");
				         //  System.out.println("currentURL => " + currentURL);      
				            
				            request.setAttribute("goBackURL", currentURL);
						  
//							super.setRedirect(false); 
							super.setViewPage("/WEB-INF/jieun/admin_productTable.jsp"); // 
							
						}
						
						
						
					}
				
		
		
//		super.setRedirect(false); 
		super.setViewPage("/WEB-INF/jieun/admin_contactTable.jsp"); // 
		// 문서가 로딩되자마자 전체 목록이 보여져야 하므로  
	}

}
