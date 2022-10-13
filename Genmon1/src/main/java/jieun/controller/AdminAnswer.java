package jieun.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

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
			
			if("GET".equalsIgnoreCase(method)) { // 클릭한 작성한 문의글을 보여줄때 
				String contactid = request.getParameter("contactid");
				System.out.println(contactid);
				InterContactDAO cdao = new ContactDAO();
				ContactVO cvo= cdao.contactOneDetail(contactid);
				//System.out.println("contents=> "+cvo.getEmail()+" "+ cvo.getContents()+" "+ cvo.getAcontents()+" "+ cvo.getContactfile_orginFileName());
				request.setAttribute("cvo", cvo);
				
//				super.setRedirect(false); 
				super.setViewPage("/WEB-INF/jieun/admin_contactAnswer.jsp"); //
			}
			else { // 문의글에 대한 답변내용(form)을 insert 

				String name = request.getParameter("name");
				String contactid = request.getParameter("contactid");
				String contents = request.getParameter("contents");

				// 입력한 내용에서 엔터는 <br> 로 변환시키기
				contents = contents.replaceAll("\r\n", "<br>");
				
//				System.out.println(contactid +" "+ name +" "+ email + " " + contents);
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("contactid", contactid);
				paraMap.put("contents", contents);
				
				InterContactDAO cdao = new ContactDAO();
				int result = 0;
										// 회원문의일경우 						// 비회원문의일경우 
				result = name != "" ? cdao.insertMemberAnswer(paraMap) : cdao.insertGuestAnswer(paraMap);
				
				String message = result==1? "문의답변입력이 성공되었습니다!" : "문의답변입력이 실패되었습니다!";
				
				// JSONObject => {}
				JSONObject jsonObj = new JSONObject(); // {}  ==> simple로 import 하면 안됨!!! (import org.json.simple.JSONObject;)
//						contactid, fk_userid, email, ctype, contents
				jsonObj.put("message", message );
				
				String json = jsonObj.toString(); // 문자열로 변환  // "[{},{},{},{},{} ... ,{}]"
//					System.out.println("~~~ 확인용 json =>"+json);
				request.setAttribute("json", json);
				
//					super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/jsonview.jsp");
				
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