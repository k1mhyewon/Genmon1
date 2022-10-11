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
		
		String pnum = request.getParameter("pnum");
		
		List<ChildProductVO> proList = new ArrayList<>();
		
		InterProductDAO pdao = new ProductDAO();
		
		proList = pdao.selectAllProduct(); 
		
		//ajax 를 통해 스크롤 방식으로 페이징 처리
		int totalHITCount = pdao.totalPspecCount(pnum); // 상품 전체 개수 알아온다.
		
		request.setAttribute("proList", proList);
		
		// 상품 전체 개수 알아온다.
		request.setAttribute("totalHITCount", totalHITCount);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/minji/productList.jsp");
	}

}
