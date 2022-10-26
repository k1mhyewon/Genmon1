package minji.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.ChildProductVO;
import minji.model.InterProductDAO;
import minji.model.ProductDAO;

public class ProductListBestSeller extends AbstractController {
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	//	String pnum = request.getParameter("pnum");
		
		List<ChildProductVO> bestList = new ArrayList<>();
		
		InterProductDAO pdao = new ProductDAO();
		
		bestList = pdao.selectBestProduct(); 
		
		
		request.setAttribute("bestList", bestList);
		
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/minji/productListBestSeller.jsp");
	}
		
}


