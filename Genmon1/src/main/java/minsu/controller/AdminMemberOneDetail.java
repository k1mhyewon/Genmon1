package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class AdminMemberOneDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(); // 로그인한 유저id를 알아야한다.
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); // loginuser이 object타입이므로 MemberVO로 형변환
		
		if(loginuser != null && "admin".equals(loginuser.getUserid()) ) {
		
			String userid = request.getParameter("userid");
		
			InterPersonDAO pdao = new PersonDAO();
			
			// 회원한명에 대한 정보를 알아오는 메소드
			MemberVO mvo = pdao.memberOneDetail(userid);
			
			request.setAttribute("mvo", mvo);
			System.out.println("확인용 mvo" + mvo);
			
			String goBackURL = request.getParameter("goBackURL");
			System.out.println("~~~ 확인용 goBackURL =>" + goBackURL);
			// ~~~ 확인용 goBackURL =>n1/admin/adminMemberList.sun

			request.setAttribute("goBackURL", goBackURL);
			
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/minsu/adminMemberOneDetail.jsp");
		
		}
		else {
			// 로그인을 안한 경우 또는 일반사용자로 로그인 했을 경우
			
				String message = "관리자만 접근가능합니다.!!";
		        String loc = "javascript:history.back()";
		            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
		            
	       //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/common/msg.jsp");
	
		}
	}
}
