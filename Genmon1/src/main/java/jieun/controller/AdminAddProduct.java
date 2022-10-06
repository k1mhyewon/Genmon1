package jieun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.*;
import jieun.model.*;

public class AdminAddProduct extends AbstractController {

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
				else { //  관리자로 로그인한 경우 상품 추가 가능 
					
					//		super.setRedirect(false); 
					super.setViewPage("/WEB-INF/jieun/admin_addProduct.jsp"); // 
					
				}
				
				
				
			}
		
		
		
		
	
			
			
			
			
	}

}
