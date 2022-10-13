package jieun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jieun.model.InterProductDAO;
import jieun.model.ProductDAO;

public class AdminProdSellStop extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pnum = request.getParameter("pnum");
		
		InterProductDAO pdao = new ProductDAO(); 
		int result = pdao.updateProdStopState(pnum);
		
		String message = "";
		String loc = "";
		
		message = result==1 ? "해당 제품 성공적으로 판매중단 되었습니다.":"해당 제품 판매중단에 실패했습니다.";

		loc = request.getContextPath()+"/admin/adminProduct.sun";
		
		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
//		super.setRedirect(false); 
		super.setViewPage("/WEB-INF/common/msg.jsp"); // 
		
	}

}
