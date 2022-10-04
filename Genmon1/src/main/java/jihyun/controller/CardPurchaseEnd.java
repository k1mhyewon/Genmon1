package jihyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.CartVO;
import common.model.MemberVO;
import common.model.OrderVO;
import common.model.PurchaseVO;
import jihyun.model.InterMemberDAO;
import jihyun.model.InterOrderDAO;
import jihyun.model.InterPurchaseDAO;
import jihyun.model.MemberDAO;
import jihyun.model.OrderDAO;
import jihyun.model.PurchaseDAO;

public class CardPurchaseEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		//if("post".equalsIgnoreCase(method)) {
			
			HttpSession session = request.getSession();
			
			OrderVO ovo = (OrderVO)session.getAttribute("ovo");
			InterOrderDAO odao = new OrderDAO();
			
			if(super.checkLogin(request)) { // 회원 주문 입력
				odao.insertOrderMember(ovo);
				
			} else { // 비회원 주문 입력
				odao.insertOrderGuest(ovo); 
			}
			
			List<CartVO> ordertList = (List<CartVO>) session.getAttribute("ordertList");
			String orderid = odao.findOrderid(); // 주문번호 알아오기
			int total = 0;
			
			// 상품 수량 만큼 주문상세 테이블에 추가해주기
			for(CartVO cvo : ordertList) {
				int qty = cvo.getQty();
				if(qty>1) {
					for(int i =0; i<qty ; i++) {
						odao.isertOrderDetail(cvo, orderid);
					}
				} else {
					odao.isertOrderDetail(cvo, orderid);
				}
				
				total += (cvo.getAllProdvo().getParentProvo().getPrice()*cvo.getQty())*(100-cvo.getAllProdvo().getSalePcnt())/100;
			} // end of for
			
			
			// 결제 테이블
			InterPurchaseDAO purdao = new PurchaseDAO();
			String str_usePoint = request.getParameter("usePoint");
			PurchaseVO purvo = new PurchaseVO();
			
			purvo.setFk_orderid(orderid);
			purvo.setPaymentAmount(total);
			
			// 포인트를 사용한경우 걸러주기 (비회원은 선택란이 없으니까 당연히 null 값임)
			if(str_usePoint != "" && Integer.parseInt(str_usePoint)!=0) { 
				
				MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
				InterMemberDAO mdao = new MemberDAO();
				
				int usePoint = Integer.parseInt(str_usePoint);
				int point = loginuser.getPoint();
				int Coin = loginuser.getCoin();
				
				if(usePoint == (point+Coin) ) { // 포인트와 적립금 전액 사용
					purvo.setUsedCoin(Coin);
					purvo.setUsedPoint(point);
					
					mdao.updateCoin(loginuser.getUserid(), 0, 0);
					
					loginuser.setPoint(0);
					loginuser.setCoin(0);
					
				} else if(usePoint>point) { // 포인트와 적립금 둘다 사용 but 전액 사용 X
					purvo.setUsedPoint(point);
					purvo.setUsedCoin(usePoint-point);
					
					mdao.updateCoin(loginuser.getUserid(), 0, Coin-usePoint+point);
					
					loginuser.setPoint(0);
					loginuser.setCoin(Coin-usePoint+point);
					
				} else if(usePoint<= point) { // 포인트만 사용
					purvo.setUsedPoint(usePoint);
					purvo.setUsedCoin(0);
					
					mdao.updateCoin(loginuser.getUserid(), point-usePoint, Coin);
					
					loginuser.setPoint(point-usePoint);
					loginuser.setCoin(Coin);
				}
				
				session.setAttribute("loginuser", loginuser);
				
			} else { // 포인트 사용 안했다면
				
				purvo.setUsedPoint(0);
				purvo.setUsedCoin(0);
			}
			
			int n = purdao.insertCardPurchase(purvo); // 결제테이블에 insert
			
			// System.out.println("결제 테이블 : "+ n);
			
			/*
			int fk_purchaseid = purdao.findPurchaseNum(orderid); // 결제 id 알아오기
			
			// 환불 테이블에 넣어줘야 함
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("fk_purchaseid", String.valueOf(fk_purchaseid)  );
			paraMap.put("refundbank", request.getParameter("refundbank"));
			paraMap.put("refundacc", request.getParameter("refundacc"));
			paraMap.put("accname", request.getParameter("accname"));

			int m = purdao.insertRefund(paraMap);
			
			// System.out.println("환불 테이블 :"+m);
			*/
			
			// 세션 다음 페이지에서 보여주고  버려줘야대 
			session.removeAttribute("ovo"); // 주문테이블
			session.removeAttribute("ordertList"); // 주문 상품목록
			
			request.setAttribute("orderid", orderid);
			
			super.setViewPage("/WEB-INF/jihyun/perchaseEnd.jsp");
		//}
	}

}
