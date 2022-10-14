package jihyun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.OrderDetailVO;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class AdminOrderManage extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 나중에 어드민 확인 넣어주기
		if(super.checkAdmin(request)) {
			
			super.setViewPage("/WEB-INF/jihyun/admin_order_manage.jsp");

		} else {
			
			request.setAttribute("message", "비정상적인 접근입니다");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/common/msg.jsp");
			return;
		}
		
	}

}
