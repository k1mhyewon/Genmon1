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
		pdao.updateProdStopState(pnum);
		
//		super.setRedirect(false); 
		super.setViewPage("/WEB-INF/jieun/admin_productTable.jsp"); // 
	}

}
