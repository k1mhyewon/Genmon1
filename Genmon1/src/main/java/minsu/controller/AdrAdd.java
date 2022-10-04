package minsu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.*;
import common.controller.AbstractController;
import common.model.MemberVO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class AdrAdd extends AbstractController {

	// 주소추가하는 페이지 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		try {
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/minsu/adrAdd.jsp");
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		
		
	}
}

