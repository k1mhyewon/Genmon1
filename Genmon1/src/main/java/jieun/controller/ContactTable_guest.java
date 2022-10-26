package jieun.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.ContactVO;
import common.model.MemberVO;
import jieun.model.ContactDAO;
import jieun.model.InterContactDAO;

public class ContactTable_guest extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
			
		if("GET".equalsIgnoreCase(method)) {
			
			// 로그인을 안 했으면
	         String message = "잘못된 접근입니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	      //   super.setRedirect(false);
	         super.setViewPage("/WEB-INF/common/msg.jsp");
	         
		}
		else {
		//  POST
					InterContactDAO cdao = new ContactDAO();
					String email = request.getParameter("email");
					String pwd = request.getParameter("pwd");
					
					Map<String, String> paraMap = new HashMap<>();
					paraMap.put("email", email);
					paraMap.put("pwd", pwd);
					
					// 이메일과 패스워드가 맞는리스트ㅡ의 ㅋ크기가ㅏ 0이ㅣ상일때 
					//List<ContactVO> contactList= cdao.guestContactList(paraMap);
					 
					String sizePerPage = request.getParameter("sizePerPage");
					// 한 페이지당 화면상에 보여줄 물품의 개수
					// 메뉴에서 회원목록 만을 클릭했을 경우에는 sizePerPage 는 null 이 된다.
					// sizePerPage 가 null 이라면 sizePerPage 를 10 으로 바꾸어야 한다.
					// "10" or "5" or "3"
					
//							post방식은 폼태그에 담아줘야하는 보안적으로 해야하지만 페이징처리는 그저 보여주는양을 나눠서보여주므로 get이다.! 
//							하지만 사용자가 url에 치고들어올수있기때문에 따져줘야함. 보여주는 페이지수는 정해저잇기에(3, 5, 10)

				   if( sizePerPage == null || 
					   !("3".equals(sizePerPage) || "5".equals(sizePerPage) || "10".equals(sizePerPage)) ) { 
					   sizePerPage = "10";
				   }

				    String currentShowPageNo = request.getParameter("currentShowPageNo");
					// currentShowPageNo 은 사용자가 보고자하는 페이지바의 페이지번호 이다.
			        // 메뉴에서 회원목록 만을 클릭했을 경우에는 currentShowPageNo 은 null 이 된다.!!!
			        // currentShowPageNo 이 null 이라면 currentShowPageNo 을 1 페이지로 바꾸어야 한다.
					
					if(currentShowPageNo== null) {
						currentShowPageNo = "1";
					}

					try {
						if(Integer.parseInt(currentShowPageNo)<1) { 
							currentShowPageNo="1";// url에 0 또는 음수 을 쳤을경우 인트가 되엇지만 1보다 작기에 
						}
					}catch (NumberFormatException e) {
						currentShowPageNo = "1";
					}
					
					paraMap.put("sizePerPage", sizePerPage); // 한 페이지에나오는 상품갯수 
					paraMap.put("currentShowPageNo", currentShowPageNo); // 몇번째 페이지 
					
					 // 페이징 처리를 위한 검색이 있는 또는 검색이 없는  전체회원에 대한 총페이지 알아오기 
					 int totalPage = cdao.getGuestTotalPage(paraMap); // 맵에 들어와잇으면 검색잇고 없으면 검색없는
//						System.out.println("~~ totalPage=>"+totalPage);
					 if(totalPage == 0) { // 해당하는 정보가 없을경우 

						String message = "해당하는 정보에 대한 문의내용은 없습니다.";
						String loc = "javascript:history.back()";
						
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/msg.jsp");
						 
					 	}
					 else {// 해당하는 정보가 있을경우 
						 // === GET 방식이므로 사용자가 웹브라우저 주소창에 currentShowPageNo 에
						 //     토탈 페이지수보다 큰 값을 입력하여 장난친 경우에는 1펭지로 가게끔 막아주는 것 시작 ===
						 // totalPage 보다 장난으로 url에 더 많이 쳐온경우
						 if( Integer.parseInt(currentShowPageNo) > totalPage) {
							 currentShowPageNo = "1";
							 paraMap.put("currentShowPageNo", currentShowPageNo ); // 몇번째 페이지
						 }
						 // === GET 방식이므로 사용자가 웹브라우저 주소창에 currentShowPageNo 에
						 //     토탈 페이지수보다 큰 값을 입력하여 장난친 경우에는 1펭지로 가게끔 막아주는 것 끝 ===
						 
						 List<ContactVO> contactList = cdao.selectGuestMyContact(paraMap);
						 
						 request.setAttribute("contactList", contactList);
						 request.setAttribute("sizePerPage", sizePerPage); // 객체생성
						 
						 
						 String pageBar="";
						 
						 int blockSize = 10;
						 // blockSize 는 블럭(토막)당 보여지는 페이지 번호의 갯수이다. 1~11 12~20 ..
						 
						 int loop = 1;
						 // loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지만 증가하는 용도이다. -> 1부터 10번반복하여 ~11까지
						 
						 // !!! 다음은 pageNo 를 구하는 공식이다.!!! //
						 int pageNo  = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
						 // pageNo 는 페이지바에서 보여지는 첫번째 번호 이다.
						 
						 /////////////////////////////////////////
						 // **** [맨처음][이전] 만들기 **** //
						 if(pageNo != 1) {
							 pageBar += "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo=1'>[맨처음]</a></li>"; 
							 pageBar += "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
						 }
						 
						 while( !(loop > blockSize || pageNo > totalPage) ){
							 if( pageNo == Integer.parseInt(currentShowPageNo)) {// 볼려고하는 페이지가ㅏ 페이지바의번호와 같다면
								 pageBar+= "<li class='page-item active'><a class='links' href='#'>"+pageNo+"</a></li>"; // 자기가자기한테가야하기에 href=#
							 }
							 else {
								 pageBar+= "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
							 }
							 
							 loop++;	// 1	2	3	4	5	6	7	8	9	10
							 
							 pageNo++;	// 1	2	3	4	5	6	7	8	9	10
						 }// end of while------------
						 
						 if( pageNo <= totalPage) {
							 pageBar+= "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
							 pageBar+= "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
						 }
						 request.setAttribute("pageBar", pageBar);
						 // **** ===== 페이지바 만들기 끝 ==== **** //
//							super.setRedirect(false); 
						 super.setViewPage("/WEB-INF/jieun/contactTable_guest.jsp");
					 }
					 
					 
					 
					
			
			
			
			
		}
		
		
		
		}



	}

