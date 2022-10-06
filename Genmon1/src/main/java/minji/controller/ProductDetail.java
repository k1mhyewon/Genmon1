package minji.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.*;
import minji.model.*;

public class ProductDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pnum = request.getParameter("pnum");

		InterProductDAO pdao = new ProductDAO();

		// 상품을 가져오고
		ChildProductVO pvo = pdao.selectOneDetail(pnum);
		request.setAttribute("pvo", pvo);

		// 같은 제품 애들을 가져와야댐(리스트)
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_pid", pvo.getFk_pid());
		paraMap.put("pnum", pnum);

		List<ChildProductVO> proList = pdao.SelectSameProduct(paraMap);
		request.setAttribute("proList", proList);

		// 사진테이블에서 추가사진 가져와야댐
		InterImageDAO idao = new ImageDAO();
		List<AddImgVO> imgList = idao.selectAllImages(pnum);
		request.setAttribute("imgList", imgList);
	
		// color와 material이 동일한 추천제품 가져오기 
		Map<String,String> map = new HashMap<>();   
		
		map.put("pcolor", pvo.getPcolor());
		map.put("pmaterial", pvo.getParentProvo().getPmaterial());
		map.put("fk_pid", pvo.getFk_pid());
		  
		List<ChildProductVO> recommendList = pdao.recommendProduct(map);
		
	//	System.out.println(recommendList.size());
	//	request.setAttribute("recommendList", recommendList);
		
	//	System.out.println(pvo.getPcolor());
	//	System.out.println(pvo.getParentProvo().getPmaterial());
	//	System.out.println(pvo.getFk_pid());
		

		// super.setRedirect(false);          
		super.setViewPage("/WEB-INF/minji/productDetail.jsp");
	}

}
