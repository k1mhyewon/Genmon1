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

public class GuestGoContact extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			String method  = request.getMethod();
			HttpSession session = request.getSession();
			
			if( "POST".equalsIgnoreCase(method) ) { // 작성폼을 작성했을경
				String orderid = request.getParameter("orderid");
				if( orderid != null ) {
					String email = request.getParameter("email");
					System.out.println(orderid);
					request.setAttribute("orderid", orderid);
					request.setAttribute("email", email);
					//		super.setRedirect(false); 
					super.setViewPage("/WEB-INF/jieun/guestContactForm.jsp");

				}
				else {
					
					// 파일 
					MultipartRequest mtrequest = null;
					ServletContext svlCtx = session.getServletContext();
					String uploadFileDir = svlCtx.getRealPath("/images/contact");
//					System.out.println("=== 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> " + uploadFileDir);
	
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
	//						String file = mtrequest.getFilesystemName("file");
					
					// 파일 다운받는거
					String Contactfile_systemFileName =  mtrequest.getFilesystemName("file"); // 실제로 업로드된파일명(중복되면 파일명 뒤에 숫자가 붙음 )
//					System.out.println("~~ Contactfile_systemFileName  : "+ Contactfile_systemFileName  );
					// 제품설명서 파일명(파일서버에 업로드 되어진 실제파일명)  
					// 제품설명서 파일명 입력은 선택사항이므로 NULL 이 될 수 있다.
					// 파일 보여지는거
					String Contactfile_orginFileName =  mtrequest.getOriginalFileName("file"); // 원래 파일명 
//					System.out.println("~~ Contactfile_orginFileName  : "+ Contactfile_orginFileName ); 
					// 웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 제품설명서 파일명
					// 제품설명서 파일명 입력은 선택사항이므로 NULL 이 될 수 있다.
					// 첨부파일들 중 이것만 파일다운로드를 해주기 때문에 getOriginalFileName(String name) 메소드를 사용한다. 
					
					
	//						String name = mtrequest.getParameter("name");
					String email = mtrequest.getParameter("email");
					String ctype = mtrequest.getParameter("type");
	//						String order = mtrequest.getParameter("order");
	
					// !!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드) 작성하기 !!!! // 
		            String contents = mtrequest.getParameter("contents");
		            orderid = mtrequest.getParameter("orderid");
		            
		            contents = contents.replaceAll("<", "&lt;");
		            contents = contents.replaceAll(">", "&gt;");
	 	            // 입력한 내용에서 엔터는 <br> 로 변환시키기
		            //contents = contents.replaceAll("\r\n", "<br>");
			           
					String password = mtrequest.getParameter("password");
					
					ContactVO cvo = new ContactVO();
					cvo.setEmail(email);
					cvo.setCtype(ctype);
					cvo.setContents(contents);
					cvo.setPwd(password);
					cvo.setContactfile_orginFileName(Contactfile_orginFileName);
					cvo.setContactfile_systemFileName(Contactfile_systemFileName);
					cvo.setFk_orderid( orderid );
					
					String message = "";
			        String loc = "";
			           
					InterContactDAO cdao = new ContactDAO();
					
					try { 
						// 멤버문의글 insert
						cdao.insertGuestContact(cvo);
						message = "문의글 등록 성공!!";
				        loc = request.getContextPath()+"/customerCare/contact.sun";
			        }catch(SQLException e) {
			        	e.printStackTrace();
			        	message = "문의글 등록 실패!";
			        	loc = request.getContextPath()+"/customerCare/contact/guestGoContact.sun";
			        }
					request.setAttribute("message", message);
			        request.setAttribute("loc", loc);
			        
	//				    	super.setRedirect(false); 
			        super.setViewPage("/WEB-INF/common/msg.jsp");
		        
				}
			}
			
			else { // get 방식 일때
				//		super.setRedirect(false); 
				super.setViewPage("/WEB-INF/jieun/guestContactForm.jsp");
				
			}// get 방식 일때------------------------------
				
		
			
		
		
	}
}
