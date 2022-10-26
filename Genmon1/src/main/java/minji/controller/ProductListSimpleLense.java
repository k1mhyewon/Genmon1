package minji.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.ChildProductVO;
import minji.model.InterProductDAO;
import minji.model.ProductDAO;

public class ProductListSimpleLense extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 틴트렌즈 리스트 페이지에서 간략보기 누르면 전체 상품의 이미지들만 나오는 상픔심플리스트 메소드 
				
		List<ChildProductVO> lenseSimple = new ArrayList<>();
				
		InterProductDAO pdao = new ProductDAO();
		
		lenseSimple = pdao.simpleLenseProduct();
		
		request.setAttribute("lenseSimple", lenseSimple);
		
	
		
	//		super.setRedirect(false);
			super.setViewPage("/WEB-INF/minji/productListSimpleLense.jsp");
	}

}
