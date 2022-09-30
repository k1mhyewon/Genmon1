package minji.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.ChildProductVO;
import minji.model.InterProductDAO;
import minji.model.ProductDAO;

public class ProductList extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		List<ChildProductVO> proList = new ArrayList<>();
		
		InterProductDAO pdao = new ProductDAO();
		
		proList = pdao.selectAllProduct();
		
		request.setAttribute("proList", proList);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/minji/productList.jsp");
	}

}
