package jihyun.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import common.model.OrderDetailVO;
import common.model.OrderVO;
import jihyun.model.InterOrderDAO;
import jihyun.model.InterPurchaseDAO;
import jihyun.model.OrderDAO;
import jihyun.model.PurchaseDAO;

public class MyInfoOrderDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		// 겟방식이라면 회원이 마이인포 조회
		if(!"post".equalsIgnoreCase(method)) {
			
			if(super.checkLogin(request)) {
				
				String orderid = request.getParameter("orderid");
				
				HttpSession session =  request.getSession(); 
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				
				// 일단 조회하기
				InterOrderDAO odao = new OrderDAO();
				
				try {
					
					// 주문조회 먼저하자... 조인으로 다가져올지... 따로 따로 가져올지... 일단 따로
					OrderVO odervo = odao.selectOneOrder(Long.valueOf(orderid));
					 
					if(loginuser.getUserid().equals(odervo.getFk_userid()) ) { // 로그인 한 회원의 주문일때
						
						// 주문번호로 주문상세 전부 가져오기
						List<OrderDetailVO> orddtailList = odao.selectOneOrderDetail(Long.valueOf(orderid) );
						
						// 주문 상세 모두 조회해서 주문 상태 정하기
						int total_status = 0;
						int totalqty = orddtailList.size();
						
						for(int i=0 ;i<totalqty; i++) {
							if(orddtailList.get(i).getOrder_status()== 2 || orddtailList.get(i).getOrder_status()== 3) {
								total_status = orddtailList.get(i).getOrder_status();
								return;
								
							} else {
								total_status = orddtailList.get(i).getOrder_status();
							}
						}
						
						// 주문번호로 결제 내역 가져오기 
						InterPurchaseDAO pdao = new PurchaseDAO();
						HashMap<String, Object> purvomap = pdao.SelectOnePurch(orderid);
						
						request.setAttribute("purvomap", purvomap);
						request.setAttribute("orddtailList", orddtailList);
						request.setAttribute("odervo", odervo);
						request.setAttribute("totalqty",totalqty); 
						request.setAttribute("total_status",total_status);
						
						super.setViewPage("/WEB-INF/jihyun/myinfo_orderDetail.jsp");
						
						
					} else { // 본인의 주문이 아닐때
						request.setAttribute("message", "비정상적인 접근입니다");
						request.setAttribute("loc", "javascript:history.back()");
						
						super.setViewPage("/WEB-INF/common/msg.jsp");
						return;
					}
					
				} catch (NumberFormatException e) { // 주문번호를 문자로 장난친거
					request.setAttribute("message", "주문번호는 숫자만 들어올 수 있습니다.");
					request.setAttribute("loc", "javascript:history.back()");
					
					super.setViewPage("/WEB-INF/common/msg.jsp");
					return;
					
				} catch (Exception e) {
					request.setAttribute("message", "비정상적인 접근입니다");
					request.setAttribute("loc", "javascript:history.back()");
					
					super.setViewPage("/WEB-INF/common/msg.jsp");
					return;
				}
			
			}else { // 겟방식인데 비회원
				
				request.setAttribute("message", "비정상적인 접근입니다");
				request.setAttribute("loc", "javascript:history.back()");
				
				super.setViewPage("/WEB-INF/common/msg.jsp");
				return;
				
			}
			
			
			
		} else { // post 방식이라면 비회원이 주문조회
				
				String orderid = request.getParameter("orderid");
				
				
				
				InterOrderDAO odao = new OrderDAO();
				
				// 주문번호 가져왔고 나중에 뭐라도 해야대 알지
				// 주문조회 먼저하자... 조인으로 다가져올지... 따로 따로 가져올지... 일단 따로
				OrderVO odervo = odao.selectOneOrder(Long.valueOf(orderid));
				 
					
				// 주문번호로 주문상세 전부 가져오기
				List<OrderDetailVO> orddtailList = odao.selectOneOrderDetail(Long.valueOf(orderid) );
				
				// 주문 상세 모두 조회해서 주문 상태 정하기
				int total_status = 0;
				int totalqty = orddtailList.size();
				
				for(int i=0 ;i<totalqty; i++) {
					if(orddtailList.get(i).getOrder_status()== 2 || orddtailList.get(i).getOrder_status()== 3) {
						total_status = orddtailList.get(i).getOrder_status();
						return;
						
					} else {
						total_status = orddtailList.get(i).getOrder_status();
					}
				}
				
				// 주문번호로 결제 내역 가져오기 
				InterPurchaseDAO pdao = new PurchaseDAO();
				HashMap<String, Object> purvomap = pdao.SelectOnePurch(orderid);
				
				request.setAttribute("purvomap", purvomap);
				request.setAttribute("orddtailList", orddtailList);
				request.setAttribute("odervo", odervo);
				request.setAttribute("totalqty",totalqty); 
				request.setAttribute("total_status",total_status);
				
				
				
				
				System.out.println("진입성공함");
				System.out.println(orderid);
				
				
				super.setViewPage("/WEB-INF/jihyun/guestOrderDetail.jsp");
				return;
			
		} // end of 비회원 주문조회
		
		
		
		
			
			
		
		
		
	}

}
