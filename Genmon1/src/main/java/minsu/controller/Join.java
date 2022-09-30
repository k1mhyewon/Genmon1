package minsu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import common.model.MemberVO;

public class Join extends AbstractController {
	


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();// get방식이라면 웹페이지를 보이고 post방식이라면 정보를 DB에 넘겨야한다.
		
		if("GET".equalsIgnoreCase(method)) { // get방식이라면(홈페이지가입 페이지로 이동)
		
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/minsu/join.jsp"); // 회원가입을 위한 form태그 페이지가 나와야한다
			
		}
		else { // post방식이라면(즉, 회원가입버튼을 클릭한 경우)
			   // memberRegister에 넣은 정보를 받아온다
			
			 String name = request.getParameter("name"); 
	         String userid = request.getParameter("userid"); 
	         String pwd = request.getParameter("pwd"); 
	         String email = request.getParameter("email"); 
	         String hp1 = request.getParameter("hp1"); 
	         String hp2 = request.getParameter("hp2"); 
	         String hp3 = request.getParameter("hp3"); 
	         String postcode = request.getParameter("postcode");
	         String address = request.getParameter("address"); 
	         String detailAddress = request.getParameter("detailAddress"); 
	         String extraAddress = request.getParameter("extraAddress"); 
	         String gender = request.getParameter("gender"); 
	         String birthyyyy = request.getParameter("birthyyyy"); 
	         String birthmm = request.getParameter("birthmm"); 
	         String birthdd = request.getParameter("birthdd");
			
	         // VO(==DTO)에서 받아온 휴대폰 3개를 DB컬럼과 같은 이름으로 하나의 휴대전화번호로 합친다
	         String mobile = hp1 + hp2 + hp3; // "01081092728"
	     
	         // VO(==DTO)에서 받아온 생년월일 3개를 DB컬럼과 같은 이름으로 하나의 생년월일로 합친다
	         String birthday = birthyyyy + "-" +birthmm + "-" + birthdd; // "1998-12-12"
	         
	        
		
		
		try {
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/minsu/join.jsp");
			} catch(Exception e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.sun");
			}
		
	}


	}
	
}
	
