package minsu.controller;

import java.util.*;
import javax.servlet.http.*;
import common.controller.AbstractController;
import common.model.*;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class CoinUpdateLoginuser extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); //"GET" "POST"
		
		if("post".equalsIgnoreCase(method)) { // "POST" 방식이라면
			
			String userid = request.getParameter("userid");
			String coinmoney = request.getParameter("coinmoney");
			
			
			System.out.println("확인용 userid" + userid + ",coinmoney " + coinmoney);
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("coinmoney", coinmoney);
			
			InterPersonDAO pdao = new PersonDAO();
			int n = pdao.coinUpdate(paraMap); // DB에 코인 및 포인트 증가하기(MemberDAO에 sql 오버라이딩하기)
			
			String message = "";
			String loc = "";
			
			if(n==1) { // DB에서 올바르게 넘어온 경우
				
				HttpSession session = request.getSession();
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser"); // 로그인 했을때의 포인트 및 코인 값
				
				// >>> !!!  세션값 변경하기(로그인했을때의 값에서 코인을 충전하고 난 후의 금액으로 바로 변경) !!! <<< // 
				loginuser.setCoin(loginuser.getCoin() + Integer.parseInt(coinmoney));
				loginuser.setPoint(loginuser.getPoint() + (int)(Integer.parseInt(coinmoney) * 0.01)); // int로 변환하여 소수분 절삭
				
				
				message = loginuser.getName()+"님의 "+coinmoney+"원 결제가 되었습니다.";
				loc = request.getContextPath()+"/myinfo/myinfoDetail.sun";
				
			}
			else {
				message = "코인액 결제가 실패되었습니다.";
				loc = "javascript:history.back()";
			}
			
			// 성공이든 실패든 메세지를 띄워야함으로 정보를 담는다.
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/msg.jsp");
			
			
		}
		else { // "POST" 방식이 아니라면
			
			String message="비정상적인 경로로 들어왔습니다.!!";
			String loc = "javascript:history.back()"; // 이전페이지로 이동
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/msg.jsp");
			
			
		}
	}

}
