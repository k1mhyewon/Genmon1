package jieun.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import common.model.ContactVO;
import jieun.model.ContactDAO;
import jieun.model.InterContactDAO;

public class MemberGoContact extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.goBackURL(request);// 로그인 또는 로그아웃을 하면 시작페이지로 가는 것이 아니라 방금 보았던 그 페이지로 그대로 가기 위한 것임. 
		// 로그인을 하지 않은 상태에서 특정제품을 조회한 후 "장바구니 담기"나 "바로주문하기" 할때와 "제품후기쓰기" 를 할때 
	    // 로그인 하라는 메시지를 받은 후 로그인 하면 시작페이지로 가는 것이 아니라 방금 조회한 특정제품 페이지로 돌아가기 위한 것임.
		
		
		// === 로그인을 하지 않은 상태라면 불가능하도록 한다. === //
		if( !super.checkLogin(request) ) {
			
			String message = "먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/msg.jsp");
			
		}
		else { // 로그인 했을때 
			String method  = request.getMethod();
			HttpSession session = request.getSession();
			
			if( "POST".equalsIgnoreCase(method) ) { // 작성폼을 작성했을경
				
				// 파일 
				MultipartRequest mtrequest = null;
				ServletContext svlCtx = session.getServletContext();
				String uploadFileDir = svlCtx.getRealPath("/images");
				System.out.println("=== 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> " + uploadFileDir);

				// === 파일을 업로드 해준다. === // 
				try {
					mtrequest = new MultipartRequest(request, uploadFileDir , 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());    
				} catch (IOException e) {// 업로드 파일 크기의 최대크기를 초과하는 경우
					request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
	                request.setAttribute("loc", request.getContextPath()+"/customerCare/contact/memberGoContact.sun"); 
	              
	                super.setViewPage("/WEB-INF/common/msg.jsp");
	                return; // 종료
				}
				
				// === 첨부 이미지 파일을 올렸으니 그 다음으로 제품정보를 (제품명, 정가, 제품수량,...) DB의 tbl_product 테이블에 insert 를 해주어야 한다.  ===
				
				// 새로운 제품 등록시 form 태그에서 입력한 값들을 얻어오기 // 파일이 정상적으로 올려졋을경우
				
				// 업로드되어진 시스템의 첨부파일 이름(파일서버에 업로드 되어진 실제파일명)을 얻어 올때는 
				// cos.jar 라이브러리에서 제공하는 MultipartRequest 객체의 getFilesystemName("form에서의 첨부파일 name명") 메소드를 사용 한다. 
				// 이때 업로드 된 파일이 없는 경우에는 null을 반환한다.  
//				String file = mtrequest.getFilesystemName("file");
				
				// 파일 다운받는거
				String confile_systemFileName =  mtrequest.getFilesystemName("file"); // 실제로 업로드된파일명(중복되면 파일명 뒤에 숫자가 붙음 )
				System.out.println("~~ confile_systemFileName  : "+ confile_systemFileName );
				// 제품설명서 파일명(파일서버에 업로드 되어진 실제파일명)  
				// 제품설명서 파일명 입력은 선택사항이므로 NULL 이 될 수 있다.
				// 파일 보여지는거
				String confile_orginFileName =  mtrequest.getOriginalFileName("file"); // 원래 파일명 
				System.out.println("~~ confile_orginFileName : "+ confile_orginFileName); 
				// 웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 제품설명서 파일명
				// 제품설명서 파일명 입력은 선택사항이므로 NULL 이 될 수 있다.
				// 첨부파일들 중 이것만 파일다운로드를 해주기 때문에 getOriginalFileName(String name) 메소드를 사용한다. 
				
				
//				String name = mtrequest.getParameter("name");
				String email = mtrequest.getParameter("email");
				String ctype = mtrequest.getParameter("type");
//				String order = mtrequest.getParameter("order");

				// !!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드) 작성하기 !!!! // 
	            String contents = mtrequest.getParameter("contents");
	            
	            contents = contents.replaceAll("<", "&lt;");
	            contents = contents.replaceAll(">", "&gt;");
 	            // 입력한 내용에서 엔터는 <br> 로 변환시키기
	            contents = contents.replaceAll("\r\n", "<br>");
		           
				String password = mtrequest.getParameter("password");
				String fk_userid = mtrequest.getParameter("userid");
				
				ContactVO cvo = new ContactVO();
				cvo.setFk_userid(fk_userid);
				cvo.setEmail(email);
				cvo.setCtype(ctype);
				cvo.setContents(contents);
				cvo.setPwd(password);

				String message = "";
		        String loc = "";
		           
				InterContactDAO cdao = new ContactDAO();
				
				try {
					// 멤버문의글 insert
					cdao.insertMemberContact(cvo);
					message = "문의글 등록 성공!!";
			        loc = request.getContextPath()+"/customerCare/contact.sun";
		        }catch(SQLException e) {
		        	e.printStackTrace();
		        	message = "문의글 등록 실패!";
		        	loc = request.getContextPath()+"/customerCare/contact/memberGoContact.sun";
		        }
				request.setAttribute("message", message);
		        request.setAttribute("loc", loc);
		        
//		    	super.setRedirect(false); 
		        super.setViewPage("/WEB-INF/common/msg.jsp");
			}
			
			else { // get 방식 일때
				//		super.setRedirect(false); 
				super.setViewPage("/WEB-INF/jieun/memberContactForm.jsp");
				
			}// get 방식 일때------------------------------
		
		}
		
		
		
	}
}
