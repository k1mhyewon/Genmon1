package jihyun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.CartVO;
import common.model.OrderVO;

public class Purchase extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session =  request.getSession(); 
		
		OrderVO ovo = (OrderVO)session.getAttribute("ovo");
		List<CartVO> ordertList = (List<CartVO>) session.getAttribute("ordertList");
		
		String purchaseMoney = request.getParameter("result");
		String productName = "";
		
		for ( int i =0 ; i < ordertList.size(); i++) {
			String comma = i==0 ? "": ", ";
			productName += comma +ordertList.get(i).getAllProdvo().getParentProvo().getPname() + ordertList.get(i).getAllProdvo().getColorName();
		}
		if(productName.length()>16) {
			productName = productName.substring(0,14) + "..";
		}
		
		request.setAttribute("productName", productName);
		request.setAttribute("purchaseMoney", purchaseMoney);
		request.setAttribute("buyer_email", ovo.getEmail());
		request.setAttribute("buyer_name", ovo.getName());
		request.setAttribute("buyer_tel", ovo.getMobile());
		request.setAttribute("buyer_addr", ovo.getAddress()+ovo.getDetailaddress()+ovo.getExtraaddress());
		request.setAttribute("buyer_postcode", ovo.getPostcode());
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jihyun/paymentGateway.jsp");
		
	}

}
