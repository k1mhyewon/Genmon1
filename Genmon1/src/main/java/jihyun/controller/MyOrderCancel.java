package jihyun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jihyun.model.InterOrderDAO;
import jihyun.model.OrderDAO;

public class MyOrderCancel extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 나중에 환불 메소드랑 구분 헤줄거야 지금은 그냥 해
		
		String method = request.getMethod();
		
		if("post".equalsIgnoreCase(method)) {
			
			String orderid = request.getParameter("orderid");
			String arrjoin = request.getParameter("arrjoin");
			
			InterOrderDAO odao = new OrderDAO();
			
			// 주문 취소
			if(arrjoin==null) {
				
				odao.myinfoCancelOrder(orderid);
				
				
			} else { // 환불 
				
				String rev_content = request.getParameter("rev_content");
				
				 // !!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드) 작성하기 !!!! // 
				rev_content = rev_content.replaceAll("<", "&lt;");
				rev_content = rev_content.replaceAll(">", "&gt;");
		        
		        // 입력한 내용에서 엔터는 <br> 로 변환하기 
				rev_content = rev_content.replaceAll("\r\n", "<br>");
				
				/*
				System.out.println(rev_content);
				System.out.println(arrjoin);
				
				String [] arr = arrjoin.split(",");
				
				for(int i =0; i<arr.length; i++) {
					System.out.println(arr[i]);
				}
				*/
				
				int n = odao.myinfoRefundOrder(rev_content, arrjoin,orderid);
				
				System.out.println(n);
				
			}
			
			
			
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/jsonview.jsp");
			
		}
		
	}

}
