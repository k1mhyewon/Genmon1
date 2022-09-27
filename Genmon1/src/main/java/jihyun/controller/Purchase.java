package jihyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Purchase extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String productName = "결제테스트 젠몬 썬구리";
		String purchaseMoney = "305000";
		
		request.setAttribute("productName", productName);
		request.setAttribute("purchaseMoney", purchaseMoney);
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/jihyun/paymentGateway.jsp");
		
	}

}
