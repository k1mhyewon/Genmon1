package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class InfoUpdate extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/minsu/infoUpdate.jsp");
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		
		
	}
}

/*
 * 
 * if(!super.checkLogin(request)) {
 * 
 * // 로그인 안했으면 String message = "회원정보를 수정하려면 먼저 로그인을 하세요.!!"; String loc =
 * "javascript:history.back()";
 * 
 * request.setAttribute("message", message); request.setAttribute("loc", loc);
 * 
 * // super.setRedirect(false); super.setViewPage("/WEB-INF/msg.jsp"); return; }
 * else { // 로그인 했으면
 * 
 * HttpSession session = request.getSession(); MemberVO loginuser =
 * (MemberVO)session.getAttribute("loginuser"); String userid =
 * request.getParameter("userid"); // login.jsp에서 userid를 받아온다
 * 
 * if(loginuser.getUserid() != userid) { // 세션에 들어온 아이디와 로그인한 아이디가 다른경우
 * 
 * String message = "다른사용자의 정보변경은 불가합니다.!!"; String loc =
 * "javascript:history.back()";
 * 
 * request.setAttribute("message", message); request.setAttribute("loc", loc);
 * 
 * // super.setRedirect(false); super.setViewPage("/WEB-INF/msg.jsp"); return; }
 * else {
 * 
 * InterPersonDAO pdao = new PersonDAO();
 * 
 * 
 * 
 * 
 * }
 */
	   