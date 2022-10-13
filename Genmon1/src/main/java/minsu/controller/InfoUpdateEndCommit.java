package minsu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

// 개인정보 수정을 완전 변경하는 페이지
public class InfoUpdateEndCommit extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser  = (MemberVO)session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		/* System.out.println("개인정보 수정 확인용 userid" + userid); */
		
		if(!super.checkLogin(request)) {
			// 로그인 안했으면 
		    String message = " 먼저 로그인을 하세요.!!";
            String loc = "javascript:history.back()";
            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
            
      //   super.setRedirect(false);
           super.setViewPage("/WEB-INF/common/msg.jsp");
           return;
		}
		else {
			String method = request.getContextPath();
			
			if("get".equals(method)) {
				  String message = "회원정보 수정이 불가합니다.!!";
		          String loc = "javascript:history.back()";
		            
		            request.setAttribute("message", message);
		            request.setAttribute("loc", loc);
		            
		      //   super.setRedirect(false);
		           super.setViewPage("/WEB-INF/common/msg.jsp");
		           return;
			}
			else {
				// 개인정보를 변경하는 값을 알아와야한다.
				

				String gender = request.getParameter("gender");
				String name = request.getParameter("name");
				String hp1 = request.getParameter("hp1"); 
		        String hp2 = request.getParameter("hp2"); 
		        String hp3 = request.getParameter("hp3"); 
		        String birthyyyy = request.getParameter("birthyyyy"); 
		        String birthmm = request.getParameter("birthmm"); 
		        String birthdd = request.getParameter("birthdd");
		         
				String mobile = hp1 + hp2 + hp3;
				String birthday = birthyyyy+"-"+birthmm+"-"+birthdd;  
				
				System.out.println("개인정보 수정 확인용 name" + name);
				System.out.println("개인정보 수정 확인용 gender" + gender);
				System.out.println("개인정보 수정 확인용 mobile" + mobile);
				
				Map<String,String> paraMap = new HashMap<>();
				
				paraMap.put("userid", userid);
				paraMap.put("gender", gender);
				paraMap.put("name", name);
				paraMap.put("mobile", mobile);
				paraMap.put("birthday", birthday);
				
				InterPersonDAO pdao = new PersonDAO();
				// 정보변경 메소드
				int n =  pdao.myinfoUpdate(paraMap);
				
				System.out.println("##### 개인정보 변경 성공 ###");
				if(n == 1) {
					// 변경 성공한 경우
					
					 loginuser.setName(name);
					 loginuser.setGender(gender);
					 loginuser.setMobile(mobile);
					 
			/*		 
	        		String message = "개인정보 변경되었습니다.";
			        String loc = "myinfo/infoUpdate.sun";
			            
		            request.setAttribute("message", message);
		            request.setAttribute("loc", loc);
			            
		       //   super.setRedirect(false);
		            super.setViewPage("/WEB-INF/common/msg.jsp");
		        */
		        	 
		         // super.setRedirect(false);
		 			super.setViewPage("/WEB-INF/minsu/infoUpdate.jsp");
				}
				else {
					
					String message = "개인정보 변경 실패하였습니다.";
			        String loc = "javascript:history.back()";
			            
		            request.setAttribute("message", message);
		            request.setAttribute("loc", loc);
		
				//	super.setRedirect(false);
					super.setViewPage("/WEB-INF/common/msg.jsp");
					
				}
			
				
			}
		}
		
		
	}

}
