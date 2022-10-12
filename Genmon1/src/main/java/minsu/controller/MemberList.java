package minsu.controller;

import java.util.*;
import javax.servlet.http.*;
import common.controller.AbstractController;
import common.model.MemberVO;
import common.util.MyUtil;
import minsu.model.InterPersonDAO;
import minsu.model.PersonDAO;

public class MemberList extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		// === 로그인을 하지 않은 상태라면 조회가 불가능하도록 한다. === //
		if(!super.checkLogin(request)) {
			
			String message = "먼저 로그인하세요.!!";
	        String loc = "javascript:history.back()";
	            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
	            
       //   super.setRedirect(false);
            super.setViewPage("/WEB-INF/common/msg.jsp");
        
		}
		else {
			
			HttpSession session = request.getSession(); // 로그인한 유저id를 알아야한다.
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); // loginuser이 object타입이므로 MemberVO로 형변환
			
			if(!"admin".equals(loginuser.getUserid()) ) {
				// === 관리자(admin)가 아닌 일반사용자로 로그인 했을때는 조회가 불가능하도록 한다. === //
				
				String message = "관리자 이외는 접근이 불가합니다.!!";
		        String loc = "javascript:history.back()";
		            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
		            
	       //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/common/msg.jsp");
				
			}
			else {
				// === 관리자(admin)로 로그인 했을때만 조회가 가능하도록 한다. === //
				
				InterPersonDAO pdao = new PersonDAO();
				
				
				// ============================ *** 페이징 처리를 한 모든 회원 또는 검색한 회원 목록 보여주기 *** ============================ //
				
				
				// === 회원검색 === //
				String searchType = request.getParameter("searchType");
				String searchWord = request.getParameter("searchWord");
				
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("searchType", searchType);
				paraMap.put("searchWord", searchWord);
				
				
				// === 한 페이지당 화면상에 보여줄 회원수 === //
				String sizePerPage = request.getParameter("sizePerPage");
		        // 메뉴에서 회원목록 만을 클릭했을 경우에는 sizePerPage 는 null 이 된다.
		        // sizePerPage 가 null 이라면 sizePerPage 를 10 으로 바꾸어야 한다.
				// select 해옴
		        // "10" or "5" or "3" 
			
				if(sizePerPage == null || !("3".equals(sizePerPage)||"5".equals(sizePerPage) ||"10".equals(sizePerPage)) ) {
					// null또는 3,5,10이 아니라면(3,5,10만가능) (끊어서 보여주는 것이므로 get방식을 사용한다. 폼태그에 담아 정보를 전달하는 post방식을 사용하지 않는다.)
					sizePerPage = "10"; // 회원이 null이라면 디폴트로 10으로 설정하겠다.
				}
				
				String currentShowPageNo = request.getParameter("currentShowPageNo");
				// currentShowPageNo 은 사용자가 보고자하는 페이지바의 페이지번호 이다.
		        // 메뉴에서 회원목록 만을 클릭했을 경우에는 currentShowPageNo 은 null 이 된다.
		        // currentShowPageNo 이 null 이라면 currentShowPageNo 을 1 페이지로 바꾸어야 한다.
				// get파라미터 해옴
				
				if(currentShowPageNo == null) {
					currentShowPageNo = "1"; // DB에 null이 넘어가면 안됨으로 기본으로 1페이로 설정한다.
				}
				
				
				// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에 숫자가 아닌 문자를 입력한 경우 또는 
				//	   currentShowPageNo 이 0 이하라면 currentShowPageNo 는 1 페이지로 만들도록 한다.  
				//     int 범위를 초과한 숫자를 입력한 경우라면 currentShowPageNo 는 1 페이지로 만들도록 한다.   ==== // 
				try {
					
					if(Integer.parseInt(currentShowPageNo) < 1) { // 0또는 음수라면,(currentShowPageNo은 String타입이므로 정수로 변환해야한다.)
						currentShowPageNo = "1";
					}
					
				} catch(NumberFormatException e) { // 장난으로 문자열을 쓰거나 없는 페이지를 쓰는경우. 꽝되면 무조건 1페이지 보여주기
					currentShowPageNo = "1";
				}

				
				
				// *** 페이지도 맵에 담기 ***// 
				paraMap.put("sizePerPage", sizePerPage );  			  // map에서 한페이지당 설정한 값(변수생성)만큼 잘라서 보여줄지 설정
				paraMap.put("currentShowPageNo", currentShowPageNo);  // 현재 내가 보고자하는 페이지.
				// ==> paraMap에는 searchType, searchWord, sizePerPage, currentShowPageNo 담겨있다.
				
				
				
				// === 페이지 처리를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기 === 
				int totalPage = pdao.getTotalPage(paraMap); // paraMap을 사용하여 보고싶은 정보만 꺼내와서 total페이지 구해오는 매소드 생성하기
				// System.out.println("확인용 totalPage => " + totalPage );
				// 검색어가 없을 시
				/*
				 	10명 확인용 totalPage => 21	 sizePerPage 가 10일때 totalPage는 21
					5명  확인용 totalPage => 41	 sizePerPage 가 10일때 totalPage는 41
					3명  확인용 totalPage => 68	 sizePerPage 가 10일때 totalPage는 68
				 */
					
				// 검색어가 있을 시(회원명에 '정'을 검색할때)
				/*
				 	sizePerPage 가 10일때 totalPage는 11
					sizePerPage 가 10일때 totalPage는 21
					sizePerPage 가 10일때 totalPage는 34
				 */
				
				// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo에 totalPage수보다 큰 값을 입력하여
				// 		장난친 경우에는 1페이지로 가게끔 막아주는 것 시작 										=== //
				if(Integer.parseInt(currentShowPageNo) > totalPage ) { 
					
					currentShowPageNo = "1";
				}
				// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo에 totalPage수보다 큰 값을 입력하여
				// 		장난친 경우에는 1페이지로 가게끔 막아주는 것 끝 										=== //
				
				
				List<MemberVO> memberList =  pdao.selectPagingMember(paraMap); // 리턴타입은 여려개가 나와야함으로 list이다
				
				/*
				  // === DAO에서 넘어왔는지 확인용 시작 === //
				   
				    if(memberList.size() > 0) { 
					    for(MemberVO mvo:memberList) { 
					    System.out.println(mvo.getUserid() + "" + mvo.getName()); } 
				    }end of if()--------------
				    
				  // === DAO에서 넘어왔는지 확인용 끝 === //
				 */				

				request.setAttribute("memberList", memberList);
				request.setAttribute("sizePerPage", sizePerPage);
				
				
				// ============================ ***** 페이지바 만들기 시작 *****============================ //
		
				String pageBar = "";
				
				int blockSize = 10;
				// blockSize는 블럭(토막)당 보여지는 페이지 번호의 개수이다. 
				// 위의 예시를 활용한 예) 전체가 42페이지에서 회원을10명씩 볼때  나뉘는 사이즈는 4
				
				int loop = 1;
				// loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도. 반복횟수
				
				
				// !!!!! 다음은 pageNo를 구하는 공식이다. !!!!!
				// pageNo  ==> ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1 
				int pageNo  = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
				// pageNo는 페이지바에서 보여지는 첫번째번호이다.
				
				
				/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				// null값이 들어오는 경우 
				if(searchType == null) {
					searchType = "";
				}
				
				if(searchWord == null) {
					searchWord = "";
				}
				
				// 검색한 대상과 검색어를 지우지 않고 머무르게 하기
				request.setAttribute("searchType", searchType);
				request.setAttribute("searchWord", searchWord);
				
				
				/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				
				
				
				// ===== ***** [맨처음][이전] 만들기 ***** ====== //
				
				if(pageNo != 1) { // 1페이지가 아니라면 
					 pageBar += "<li class='page-item'><a class='page-link' href='memberList.sun?sizePerPage="+sizePerPage+"&currentShowPageNo=1&searchType="+searchType+"&searchWord="+searchWord+"'>[맨처음]</a></li>"; 
					// 맨처음은 1페이지
					 pageBar += "<li class='page-item'><a class='page-link' href='memberList.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"&searchType="+searchType+"&searchWord="+searchWord+"'>[이전]</a></li>";
					// pageNo가 totalPage보다
				}
				
				// ==== 페이지바 출력하기 === //
				while(!(loop > blockSize || pageNo > totalPage) ) { // blockSize사이즈만큼 반복하고 사이즈가 넘어가면 loop문을 빠져나간다.
																    // 또는
																    // pageNo가 totalPage(21)보다 클때 loop문을 빠져나간다.
					
					if(pageNo == Integer.parseInt(currentShowPageNo) ) { // 내가 찍어주고자 하는 페이지 넘버가 내가 보고있는 페이지번호와 같냐
						pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; 
													  // active는 현재 내가 보고있는 페이지에 파란색으로 표시
					}
					else {
						 pageBar += "<li class='page-item'><a class='page-link' href='memberList.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&searchType="+searchType+"&searchWord="+searchWord+"'>"+pageNo+"</a></li>";   
									// 부트스트랩을 사용하여 get방식으로 페이지바 숫자 출력
									// currentShowPageNo는 현재 내가 보고 있는 페이지. pageNo 찍어주는 페이지 넘버
					
					}
					loop++;		// 1 2 3 4 5 6 7 8 9 10
					
					pageNo++;   //  1  2  3  4  5  6  7  8  9 10
								// 11 12 13 14 15 16 17 18 19 20
								// 21 
								// 위의 것은 sizePerPage가 10일때의 페이지바이다.
					
					
				}// end of while()------------------------------
				
				// ===== ***** [다음][마지막] 만들기 ***** ====== //
				// while문에서 빠져나올때 
				// 첫번째 블럭인 경우( 1  2  3  4  5  6  7  8  9 10)  pageNo 가 11이고 
				// 두번째 블럭인 경우( 11 12 13 14 15 16 17 18 19 20) pageNo 가 21이고 
				// 세번째 블럭인 경우(21) 							 pageNo 가 22가 된다. 
				
				if(pageNo <= totalPage) { // 페이지번호가 전체페이지 번호보다 작거나 같은 경우라면 [다음]출력
					  pageBar += "<li class='page-item'><a class='page-link' href='memberList.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&searchType="+searchType+"&searchWord="+searchWord+"'>[다음]</a></li>"; 
					// 글자는 [다음]지만 원래는 11페이지이다.
					  
					  pageBar += "<li class='page-item'><a class='page-link' href='memberList.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"&searchType="+searchType+"&searchWord="+searchWord+"'>[마지막]</a></li>";
				}
				
				request.setAttribute("pageBar", pageBar);
				
				
				
				
				// ============================ ***** 페이지바 만들기 끝 ***** ============================ //
				
				
				// ***** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기***** //
				String currentURL = MyUtil.getCurrentURL(request);
				// 회원조회를 했을시 현재 그 페이지 그대로 되돌아가기 위한 용도로 쓰인다.
				
				// System.out.println("currentURL => " + currentURL);
				// currentURL => /member/memberList.sun?sizePerPage=10&currentShowPageNo=10&searchType=name&searchWord=정

				currentURL = currentURL.replaceAll("&", " "); // &가 들어오면 " "으로 바꿔라
				// System.out.println("currentURL => " + currentURL);
				// /member/memberList.sun?sizePerPage=10 currentShowPageNo=10 searchType=name searchWord=정
				
				
				// *** 잘못된 방법 *** //
				request.setAttribute("goBackURL", currentURL);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/minsu/memberList.jsp"); // view단 페이지 보여주기
				
			}
			
		}
		
	} // end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception-------------------

}
