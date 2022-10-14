package minji.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.ChildProductVO;
import minji.model.InterProductDAO;
import minji.model.ProductDAO;

public class ProductListClassic extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<ChildProductVO> classicList = new ArrayList<>();
		
		InterProductDAO pdao = new ProductDAO();
		
		classicList = pdao.selectClassicProduct(); 
		
		
		request.setAttribute("classicList", classicList);
		
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/minji/productListClassic.jsp");
	}

}
