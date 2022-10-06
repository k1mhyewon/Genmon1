package hw.controller;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hw.model.CartDAO;
import hw.model.InterCartDAO;
import hw.model.InterMemberDAO;
import hw.model.MemberDAO;
import common.model.CartVO;
import common.model.MemberVO;


public class Login extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			String method = request.getMethod(); // "GET" or "POST"
			// System.out.println("method => " + method);
			
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			
			// System.out.println("확인용 userid : "+ userid);
			// System.out.println("확인용 pwd : "+ pwd);
			
			// ============================================================= //
			// [비회원 장바구니 시작]
			
			String all_pnum = request.getParameter("all_pnum");
			String all_qty = request.getParameter("all_qty");
			
			System.out.println("확인용 all_pnum : "+ all_pnum);
			System.out.println("확인용 all_qty : "+ all_qty);
			
			if(all_pnum != null && all_qty != null) {
				
				String[] arr_pnum = all_pnum.split(",");
				String[] arr_qty = all_qty.split(",");
				
				
				InterCartDAO cdao = new CartDAO();
				
				for(int i=0;i<arr_pnum.length;i++) {
					// System.out.println(arr_pnum[i]);
					
					System.out.println("for 문 확인용 all_pnum"+i+" : "+ arr_pnum[i]);
					System.out.println("for 문 확인용 all_qty"+i+" : "+ arr_qty[i]);
					
					try {
					
						CartVO cart = new CartVO(userid, Integer.parseInt(arr_pnum[i]), Integer.parseInt(arr_qty[i]));
						
						int isCartExist = cdao.isCartExist(userid, Integer.parseInt(arr_pnum[i]));
						
						if(isCartExist == 0) { // 해당 상품이 장바구니에 없다면
							
				        	int n = cdao.cartInsert(cart); // insert 하기
				        	
						}
						else { // 해당 상품이 장바구니에 있다면
							
							int updateQty = Integer.parseInt(arr_qty[i]) + isCartExist;
							
							int n2 = cdao.cartUpdate(userid, Integer.parseInt(arr_pnum[i]), updateQty); // update 하기
							
						}
				
					} catch(NumberFormatException e) {
						e.printStackTrace();
					}
					
				} // end of for(int i=0;i<arr_pnum.length;i++) --------------------------------------
				
				
			} // end of if(all_pnum != null && all_qty != null) ---------------------------------------------------
			
			
			// [비회원 장바구니 끝]
			// ============================================================= //
			
			
			
			
			
			if(!"POST".equalsIgnoreCase(method)) {
				 // GET 방식으로 넘어온 것이라면 
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/login.jsp");
				
			}
			else {
				 // POST 방식으로 넘어온 것이라면 
				
				

				
				
				
				
				
				
				
				// ===> 웹클라이언트의 IP 주소를 알아오는 것 <==== //
				String clientip = request.getRemoteAddr();
				// C:\NCS\workspace(jsp)\MyMVC\src\main\webapp\JSP 파일을 실행시켰을 때 IP 주소가 제대로 출력되기위한 방법.txt 참조할 것!! 
				
				// System.out.println("clientip => " + clientip);
				// clientip => 127.0.0.1
				
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("userid", userid);
				paraMap.put("pwd", pwd);
				paraMap.put("clientip", clientip);
				
				InterMemberDAO mdao = new MemberDAO();
				
				MemberVO loginuser = mdao.selectOneMember(paraMap);
				
				if(loginuser != null) {
					// 로그인 성공
					
					if(loginuser.getIdle() == 1) {
						String message = "로그인을 한지 1년이 지나서 휴면상태로 되었습니다. 관리자에게 문의 바랍니다."; 
						String loc = request.getContextPath()+"/index.up";
						// 원래는 위와같이 index.up 이 아니라 휴면인 계정을 풀어주는 페이지로 잡아주어야 한다. 
						
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/msg.jsp");
						
						return; // 메소드 종료
					}
					
					HttpSession session =  request.getSession(); 
					  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
					  
					session.setAttribute("loginuser", loginuser);
					  
					
					if( loginuser.isRequirePwdChange() ) { // 리턴타입이 boolean 이면 set 이 아니고 is 로 불러온다.
						  
						  
						  String message = "비밀번호를 변경하신지 3개월이 지났습니다. 비밀번호를 변경하세요."; 
						  String loc = request.getContextPath()+"/index.up";
						  // 원래는 위와같이 index.up 이 아니라 휴면인 계정을 풀어주는 페이지로 잡아주어야 한다. 
							
						  request.setAttribute("message", message);
						  request.setAttribute("loc", loc);
							
						  super.setRedirect(false);
						  super.setViewPage("/WEB-INF/msg.jsp");
							
						  return; // 메소드 종료
						  
					  }
					else {
						// 비밀번호를 변경한지 3개월 미만인 경우
						// System.out.println("확인용 loginuser.userid : " + loginuser.getUserid());
						// System.out.println("확인용 loginuser.pwd : " + loginuser.getPwd());
						
						super.setRedirect(true); // setRedirect 방식으로 페이지를 이동시키는 것이다.
						super.setViewPage(request.getContextPath()+"/index.sun"); // 시작홈페이지로 이동
					}
					
					
				}
				else {
					// 로그인 실패
					
					request.setAttribute("isLogined", "false");
					// System.out.println("로그인 실패");
					
					/*
					String message = "로그인 실패";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					*/
				}
				
				
			}
			
			
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
		}
	
	}


}
