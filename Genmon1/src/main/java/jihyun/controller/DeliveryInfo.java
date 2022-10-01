package jihyun.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import hw.model.InterMemberDAO;
import hw.model.MemberDAO;

public class DeliveryInfo extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		// get으로 넘어오면 비회원 post로 넘어오면 회원
		try {
			String method = request.getMethod(); // "GET" or "POST"
			
			// System.out.println("method => " + method);
			/*
			if(!"POST".equalsIgnoreCase(method)) {
				 // GET 방식으로 넘어온 것이라면 
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/hw/login.jsp");
				
			}
			*/
			if("POST".equalsIgnoreCase(method)) {
				 // POST 방식으로 넘어온 것이라면 
				
				String userid = request.getParameter("userid");
				String pwd = request.getParameter("pwd");
				
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
					
					request.setAttribute("email", loginuser.getEmail());
					request.setAttribute("name", loginuser.getName());
					request.setAttribute("mobile", loginuser.getMobile());
					request.setAttribute("postcode", loginuser.getPostcode());
					request.setAttribute("address", loginuser.getAddress());
					request.setAttribute("detailAddress", loginuser.getDetailaddress());
					request.setAttribute("extraAddress", loginuser.getExtraaddress());
					  
					
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
					else { // 찐 로그인 성공이라면
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/jihyun/deliveryInfo.jsp");
					}
					
					
				} else {
					// 로그인 실패
					
					request.setAttribute("isLogined", "false");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/jihyun/checkLogin.jsp");
					
					return;
					
					
					//String message = "로그인 실패";
					//String loc = "javascript:history.back()";
					
					//super.setRedirect(false);
					//super.setViewPage("/WEB-INF/common/msg.jsp");
					
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
			/*
			else { // get 방식으로 넘어왔다면 아마 필요 없지 않을가...
				
				if(super.checkLogin(request)) { // 로그인을 했다면 // 나중에 아이디 비교도 해야대
					
					HttpSession session =  request.getSession(); 
					MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
					
					request.setAttribute("email", loginuser.getEmail());
					request.setAttribute("name", loginuser.getName());
					request.setAttribute("mobile", loginuser.getMobile());
					request.setAttribute("postcode", loginuser.getPostcode());
					request.setAttribute("address", loginuser.getAddress());
					request.setAttribute("detailAddress", loginuser.getDetailaddress());
					request.setAttribute("extraAddress", loginuser.getExtraaddress());
					
				}
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jihyun/deliveryInfo.jsp");
				
			}*/
			
			
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
		}
		
		
		
		
		
		
		
	}

}
