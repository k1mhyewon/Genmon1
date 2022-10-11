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

public class ContactTable extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		if( !super.checkLogin(request)) {
			
			// 로그인을 안 했으면
	         String message = "잘못된 접근입니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	      //   super.setRedirect(false);
	         super.setViewPage("/WEB-INF/common/msg.jsp");
	         
		}
		
		else {
			
		HttpSession session =  request.getSession(); 
		  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		// System.out.println("확인용 loginuser.userid : " + loginuser.getUserid());
		
		String userid = request.getParameter("userid");
		// System.out.println("확인용 userid_request : " + userid_request);
		
		if(loginuser.getUserid().equals(userid)) {
			InterContactDAO cdao = new ContactDAO();
			Map<String, String> paraMap = new HashMap<>();
			String sizePerPage = request.getParameter("sizePerPage");
			// 한 페이지당 화면상에 보여줄 물품의 개수
			// 메뉴에서 회원목록 만을 클릭했을 경우에는 sizePerPage 는 null 이 된다.
			// sizePerPage 가 null 이라면 sizePerPage 를 10 으로 바꾸어야 한다.
			// "10" or "5" or "3"
			
//				post방식은 폼태그에 담아줘야하는 보안적으로 해야하지만 페이징처리는 그저 보여주는양을 나눠서보여주므로 get이다.! 
//				하지만 사용자가 url에 치고들어올수있기때문에 따져줘야함. 보여주는 페이지수는 정해저잇기에(3, 5, 10)

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
//				currentShowPageNo = currentShowPageNo== null? "1":currentShowPageNo;
			// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에 숫자가 아닌 문자를 입력한 경우 또는 
	        //     int 범위를 초과한 숫자를 입력한 경우라면 currentShowPageNo 는 1 페이지로 만들도록 한다.  
			// 	   currentShowPageNo 이 0 이하이면  currentShowPageNo 는 1 페이지로 만들도록 한다. ==== //
//				장난으로 url 에 ?몇억페이지 를 치고들어올수있기때문에 인트 범위를 벗어나면 안되는 경우의수
			try {
				if(Integer.parseInt(currentShowPageNo)<1) { 
					currentShowPageNo="1";// url에 0 또는 음수 을 쳤을경우 인트가 되엇지만 1보다 작기에 
				}
			}catch (NumberFormatException e) {
				currentShowPageNo = "1";
			}
			
			
			paraMap.put("sizePerPage", sizePerPage); // 한 페이지에나오는 상품갯수 
			paraMap.put("currentShowPageNo", currentShowPageNo); // 몇번째 페이지 
			paraMap.put("userid", userid);  
			
			 // 페이징 처리를 위한 검색이 있는 또는 검색이 없는  전체회원에 대한 총페이지 알아오기 
			 int totalPage = cdao.getTotalPage(paraMap); // 맵에 들어와잇으면 검색잇고 없으면 검색없는
//			System.out.println("~~ totalPage=>"+totalPage);

			 // === GET 방식이므로 사용자가 웹브라우저 주소창에 currentShowPageNo 에
			  //     토탈 페이지수보다 큰 값을 입력하여 장난친 경우에는 1펭지로 가게끔 막아주는 것 시작 ===
			  // totalPage 보다 장난으로 url에 더 많이 쳐온경우
			  if( Integer.parseInt(currentShowPageNo) > totalPage) {
				  currentShowPageNo = "1";
				  paraMap.put("currentShowPageNo", currentShowPageNo ); // 몇번째 페이지
			  }
			  // === GET 방식이므로 사용자가 웹브라우저 주소창에 currentShowPageNo 에
			  //     토탈 페이지수보다 큰 값을 입력하여 장난친 경우에는 1펭지로 가게끔 막아주는 것 끝 ===
			  
			List<ContactVO> contactList = cdao.selectAllMyContact(paraMap);
			
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
			  // 검색하는게 없으면 url에 그대로 null 글자가 들어가므로 조건을 넣어준다.
//			  if(searchType ==null) {
//				  searchType="";
//			  }
//			  if(searchWord ==null) {
//				  searchWord="";
//			  }

			  /////////////////////////////////////////
			   // **** [맨처음][이전] 만들기 **** //
			   if(pageNo != 1) {
				   pageBar += "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo=1'>[맨처음]</a></li>"; 
				   pageBar += "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
			   }
			   
			// 1부터 10번 반복, 11부터 10번반복, 21부터 10번반복..
			  //     10번을 찍어주지만 마지막페이지는 전체페이지수에 맞게찍어준다.
			 while( !(loop > blockSize || pageNo > totalPage) ){
				  if( pageNo == Integer.parseInt(currentShowPageNo)) {// 볼려고하는 페이지가ㅏ 페이지바의번호와 같다면
					  pageBar+= "<li class='page-item active'><a class='links' href='#'>"+pageNo+"</a></li>"; // 자기가자기한테가야하기에 href=#
				  }
				  else {
					  pageBar+= "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
				  }
				 
				 loop++;	// 1	2	3	4	5	6	7	8	9	10
				 
				 pageNo++;	// 1	2	3	4	5	6	7	8	9	10
				 			// 11	12	13	14	15	16	17	18	19	20
							// 21	
				 			// 위의 것은 sizePerPage 가 10 일때 페이지바이다.
			 }// end of while------------
			
			 // *** [다음][마지막] 만들기
			 // 첫번째 블럭(1	2	3	4	5	6	7	8	9	10)인 경우 pageNo 11 이고
			 // 두번째 블럭(11 12	13	14	15	16	17	18	19	20)인 경우 pageNo 21 이고
			 // 세번째 블럭인 경우 pageNo 22 가 된다.
			 if( pageNo <= totalPage) {
				 pageBar+= "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
				 pageBar+= "<li class='page-item'><a class='links' href='contactTable.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
			 }
//			 request.setAttribute("searchType", searchType);
//			 request.setAttribute("searchWord", searchWord);
			  request.setAttribute("pageBar", pageBar);
			  // **** ===== 페이지바 만들기 끝 ==== **** //
			
//			super.setRedirect(false); 
			super.setViewPage("/WEB-INF/jieun/contactTable.jsp"); //

			
		}
		else {
			// 로그인한 사용자가 다른 사용자의 문의내역 보기를 시도하는 경우
			String message = "다른 사용자의 my page 로는 접근 불가합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		
		}



	}

}
