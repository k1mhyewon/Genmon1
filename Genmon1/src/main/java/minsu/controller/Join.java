package minsu.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.MemberVO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class Join extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();

		if ("GET".equalsIgnoreCase(method)) {
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/minsu/join.jsp");

		} else {
			// "Post"방식(회원가입버튼을 클릭한 경우)
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String hp1 = request.getParameter("hp1");
			String hp2 = request.getParameter("hp2");
			String hp3 = request.getParameter("hp3");
			String gender = request.getParameter("gender");
			String birthyyyy = request.getParameter("birthyyyy");
			String birthmm = request.getParameter("birthmm");
			String birthdd = request.getParameter("birthdd");

			// VO(==DTO)에서 받아온 휴대폰 3개를 DB컬럼과 같은 이름으로 하나의 휴대전화번호로 합친다
			String mobile = hp1 + hp2 + hp3; // "01081092728"

			// VO(==DTO)에서 받아온 생년월일 3개를 DB컬럼과 같은 이름으로 하나의 생년월일로 합친다
			String birthday = birthyyyy + "-" + birthmm + "-" + birthdd; // "1998-12-12"

			// 폼태그에서 전송되져 나온것을 MemberVO에서 담아온것이다
			
			  MemberVO member = new MemberVO(userid, pwd, name, email, mobile, gender,birthday);
			

			InterPersonDAO pdao = new PersonDAO();

			try {
				
				int n = pdao.registerMember(member); // 멤버를 넣는다. 리턴타입은 int가 나온다
	
				if (n == 1) {
	
					String message = "회원가입 성공";
					String loc = request.getContextPath() + "/index.up"; // 위치이동은 시작페이지로 이동한다.
	
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
	
					// super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp"); // 성공메세지창을 띄워주는 파일(view단)
				}
	
			} catch (SQLException e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath() + "/error.up");
			}

		/*
		 * try {
		 * 
		 * List<MemberVO> personList = pdao.joinMember(); // super.setRedirect(false);
		 * super.setViewPage("/WEB-INF/minsu/join.jsp"); } catch(Exception e) {
		 * e.printStackTrace(); super.setRedirect(true);
		 * super.setViewPage(request.getContextPath()+"/error.sun"); }
		 */
	}

	}
	
}
