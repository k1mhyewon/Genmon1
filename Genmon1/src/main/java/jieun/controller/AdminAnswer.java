package jieun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.ContactVO;
import common.model.MemberVO;
import jieun.model.ContactDAO;
import jieun.model.InterContactDAO;

public class AdminAnswer extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// == 관리자로 로그인 했을때만 조회가 가능하도록
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser"); // 여기서 loginuser  는 절대 null 이 아님
		
		if( loginuser  != null && "admin".equals(loginuser.getUserid())) {
			// 관리자로 로그인을 했을때 
			
			String method = request.getMethod();
			
			if("GET".equalsIgnoreCase(method)) { // 클릭한 회원이 작성한 문의글을 보여줄때 
				String contactid = request.getParameter("contactid");
				System.out.println(contactid);
				InterContactDAO cdao = new ContactDAO();
				ContactVO cvo= cdao.contactOneDetail(contactid);
				System.out.println("contents=> "+cvo.getEmail()+" "+ cvo.getContents());
				request.setAttribute("cvo", cvo);
				
//				super.setRedirect(false); 
				super.setViewPage("/WEB-INF/jieun/admin_contactAnswer.jsp"); //
			}
			else { // 문의글에 대한 답변내용(form)을 insert 
				
			}
			
			
			// ** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 ** // 
//			String goBackURL = request.getParameter("goBackURL");
//			System.out.println("~~~ 확인용 goBackURL =>"+goBackURL);
			
//			request.setAttribute("goBackURL", goBackURL);


			
		}
		else {
			// 관리자로 로그인을 안했을때 
			String message = "관리자만 접근이 가능합니다!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/msg.jsp");
		}
		
				 
		
	}
	

}