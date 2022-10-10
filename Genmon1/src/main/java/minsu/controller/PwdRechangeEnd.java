package minsu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import hw.model.InterMemberDAO;
import hw.model.MemberDAO;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class PwdRechangeEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!super.checkLogin(request)) {
			// 로그인 안했으면 
		    String message = "로그인을 하세요.!!";
            String loc = "javascript:history.back()";
            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
            
      //   super.setRedirect(false);
           super.setViewPage("/WEB-INF/common/msg.jsp");
           return;
		}
		else {
			
			String method = request.getContextPath();
			
			if("GET".equalsIgnoreCase(method)) {
				  String message = "회원정보 수정이 불가합니다.!!";
		          String loc = "javascript:history.back()";
		            
		            request.setAttribute("message", message);
		            request.setAttribute("loc", loc);
		            
		      //   super.setRedirect(false);
		           super.setViewPage("/WEB-INF/common/msg.jsp");
		           return;
			}
			else {
				 System.out.println("아뮤거나");
				 
					HttpSession session = request.getSession();
					MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
					
					String userid = loginuser.getUserid();
					String pwd = request.getParameter("pwd");
					
					
					System.out.println("~~~~~~~~~~~~~~~~ userid : "+userid);
					System.out.println("~~~~~~~~~~~~~~~~ pwd : "+pwd);
					
				
					Map<String, String> paraMap = new HashMap<>();
					paraMap.put("pwd", pwd);
					paraMap.put("userid", userid);
					
					
					InterPersonDAO pdao = new PersonDAO();
					// 비밀번호를 변경해주는 메소드
					int passwdUpdate = pdao.passwdUpdate(paraMap);
					
					  String message = "";
			          String loc = "";
			          
			          
					if(passwdUpdate == 1) {
						
						request.setAttribute("passwdUpdate", passwdUpdate);
						System.out.println("passwdUpdate : "+passwdUpdate);
						
						
						 message = "비밀번호가 변경되었습니다.";
						 loc = request.getContextPath() + "/infoUpdate.sun";
						 
						 super.setViewPage("/WEB-INF/common/msg.jsp");
				         return;
						
					}
					/*else {*/
						message = "비밀번호가 다릅니다.!!";
						loc = "javascript:history.back()";
						 
					   request.setAttribute("message", message);
					   request.setAttribute("loc", loc);
					   
					   super.setViewPage("/WEB-INF/common/msg.jsp");
			           return;
						/*
						 * }
						 */
			}
		}
		
		}
	}	
	
