package jieun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.*;
import jieun.model.*;
import jieun.model.ChildProductVO;

public class AdminProduct extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// === 로그인을 하지 않은 상태라면 조회가 불가능하도록 한다. === //
			if( !super.checkLogin(request) ) {
				String message = "먼저 로그인을 하세요!!";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/msg.jsp");
				
			}
			
			else { // 로그인을 한경우 
				HttpSession session = request.getSession();
				MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
				
				if(!"admin".equals(loginuser.getUserid())) {
					// === 관리자(admin)가 아닌 일반사용자로 로그인 했을 때는 조회가 불가능하도록 한다. === //
					String message = "관리자만 접근가능합니다!!";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
				//	super.setRedirect(false);
					super.setViewPage("/WEB-INF/common/msg.jsp");
				}
				else {
					// === 관리자(admin)로 로그인 했을 때만 조회가 가능하도록 한다. === //
					
					InterProductDAO pdao = new ProductDAO();
					
					// *** 페이징 처리를 한 모든 회원 또는 검색한 회원 목록 보여주기 *** //
//					String searchType = request.getParameter("searchType");
//					String searchWord = request.getParameter("searchWord");
					
					Map<String, String> paraMap = new HashMap<>();
//					paraMap.put("searchType", searchType);
//					paraMap.put("searchWord", searchWord);
					
					String sizePerPage = request.getParameter("sizePerPage");
					// 한 페이지당 화면상에 보여줄 물품의 개수
					// 메뉴에서 회원목록 만을 클릭했을 경우에는 sizePerPage 는 null 이 된다.
					// sizePerPage 가 null 이라면 sizePerPage 를 10 으로 바꾸어야 한다.
					// "10" or "5" or "3"
					
//						post방식은 폼태그에 담아줘야하는 보안적으로 해야하지만 페이징처리는 그저 보여주는양을 나눠서보여주므로 get이다.! 
//						하지만 사용자가 url에 치고들어올수있기때문에 따져줘야함. 보여주는 페이지수는 정해저잇기에(3, 5, 10)

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
//						currentShowPageNo = currentShowPageNo== null? "1":currentShowPageNo;
					// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에 숫자가 아닌 문자를 입력한 경우 또는 
			        //     int 범위를 초과한 숫자를 입력한 경우라면 currentShowPageNo 는 1 페이지로 만들도록 한다.  
					// 	   currentShowPageNo 이 0 이하이면  currentShowPageNo 는 1 페이지로 만들도록 한다. ==== //
//						장난으로 url 에 ?몇억페이지 를 치고들어올수있기때문에 인트 범위를 벗어나면 안되는 경우의수
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
					 int totalPage = pdao.getTotalPage(paraMap); // 맵에 들어와잇으면 검색잇고 없으면 검색없는
//					System.out.println("~~ totalPage=>"+totalPage);

					 // === GET 방식이므로 사용자가 웹브라우저 주소창에 currentShowPageNo 에
					  //     토탈 페이지수보다 큰 값을 입력하여 장난친 경우에는 1펭지로 가게끔 막아주는 것 시작 ===
					  // totalPage 보다 장난으로 url에 더 많이 쳐온경우
					  if( Integer.parseInt(currentShowPageNo) > totalPage) {
						  currentShowPageNo = "1";
						  paraMap.put("currentShowPageNo", currentShowPageNo ); // 몇번째 페이지
					  }
					  // === GET 방식이므로 사용자가 웹브라우저 주소창에 currentShowPageNo 에
					  //     토탈 페이지수보다 큰 값을 입력하여 장난친 경우에는 1펭지로 가게끔 막아주는 것 끝 ===
					  
					  
					  
					List<ChildProductVO> productList= pdao.selectPagingProduct(paraMap);
					
					// == 확인용 시작== //
					   
					if( productList.size() > 0) { // memberList는 dao 에서 초기값을 new 해왓기때문에 null 일수없다
						for(ChildProductVO cpvo : productList) { 
							System.out.println(cpvo.getParentProvo().getPname()+ "  "+cpvo.getColorName()+ "  "+cpvo.getPsales());
						}
					}
					// == 확인용 끝== //
					
				
				  request.setAttribute("sizePerPage", sizePerPage); // 객체생성
				  request.setAttribute("productList", productList);

				  
				  // **** ===== 페이지바 만들기 시작 ==== **** //
				  /*
		             1개 블럭당 10개씩 잘라서 페이지 만든다.
		             1개 페이지당 3개행 또는 5개행 또는  10개행을 보여주는데
		                 만약에 1개 페이지당 5개행을 보여준다라면 
		                 총 몇개 블럭이 나와야 할까? 
		                 총 회원수가 207명 이고, 1개 페이지당 보여줄 회원수가 5 이라면
		             207/5 = 41.4 ==> 42(totalPage)        
		                 
		             1블럭               1 2 3 4 5 6 7 8 9 10 [다음][마지막]
		             2블럭   [맨처음][이전] 11 12 13 14 15 16 17 18 19 20 [다음][마지막]
		             3블럭   [맨처음][이전] 21 22 23 24 25 26 27 28 29 30 [다음][마지막]
		             4블럭   [맨처음][이전] 31 32 33 34 35 36 37 38 39 40 [다음][마지막]
		             5블럭   [맨처음][이전] 41 42 
		          */
		         
		         // ==== !!! pageNo 구하는 공식 !!! ==== // 
		      /*
		          1  2  3  4  5  6  7  8  9  10  -- 첫번째 블럭의 페이지번호 시작값(pageNo)은  1 이다.
		          11 12 13 14 15 16 17 18 19 20  -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.   
		          21 22 23 24 25 26 27 28 29 30  -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
		          
		           currentShowPageNo        pageNo  ==> ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1 
		          ---------------------------------------------------------------------------------------------
		                 1                   1 = ( (1 - 1)/10 ) * 10 + 1 
		                 2                   1 = ( (2 - 1)/10 ) * 10 + 1 
		                 3                   1 = ( (3 - 1)/10 ) * 10 + 1 
		                 4                   1 = ( (4 - 1)/10 ) * 10 + 1  
		                 5                   1 = ( (5 - 1)/10 ) * 10 + 1 
		                 6                   1 = ( (6 - 1)/10 ) * 10 + 1 
		                 7                   1 = ( (7 - 1)/10 ) * 10 + 1 
		                 8                   1 = ( (8 - 1)/10 ) * 10 + 1 
		                 9                   1 = ( (9 - 1)/10 ) * 10 + 1 
		                10                   1 = ( (10 - 1)/10 ) * 10 + 1 
		                 
		                11                  11 = ( (11 - 1)/10 ) * 10 + 1 
		                12                  11 = ( (12 - 1)/10 ) * 10 + 1
		                13                  11 = ( (13 - 1)/10 ) * 10 + 1
		                14                  11 = ( (14 - 1)/10 ) * 10 + 1
		                15                  11 = ( (15 - 1)/10 ) * 10 + 1
		                16                  11 = ( (16 - 1)/10 ) * 10 + 1
		                17                  11 = ( (17 - 1)/10 ) * 10 + 1
		                18                  11 = ( (18 - 1)/10 ) * 10 + 1 
		                19                  11 = ( (19 - 1)/10 ) * 10 + 1
		                20                  11 = ( (20 - 1)/10 ) * 10 + 1
		                 
		                21                  21 = ( (21 - 1)/10 ) * 10 + 1 
		                22                  21 = ( (22 - 1)/10 ) * 10 + 1
		                23                  21 = ( (23 - 1)/10 ) * 10 + 1
		                24                  21 = ( (24 - 1)/10 ) * 10 + 1
		                25                  21 = ( (25 - 1)/10 ) * 10 + 1
		                26                  21 = ( (26 - 1)/10 ) * 10 + 1
		                27                  21 = ( (27 - 1)/10 ) * 10 + 1
		                28                  21 = ( (28 - 1)/10 ) * 10 + 1 
		                29                  21 = ( (29 - 1)/10 ) * 10 + 1
		                30                  21 = ( (30 - 1)/10 ) * 10 + 1                    

		       */
				  
				  
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
//				  if(searchType ==null) {
//					  searchType="";
//				  }
//				  if(searchWord ==null) {
//					  searchWord="";
//				  }

				  /////////////////////////////////////////
				   // **** [맨처음][이전] 만들기 **** //
				   if(pageNo != 1) {
					   pageBar += "<li class='page-item'><a class='page-link' href='adminProduct.sun?sizePerPage="+sizePerPage+"&currentShowPageNo=1'>[맨처음]</a></li>"; 
					   pageBar += "<li class='page-item'><a class='page-link' href='adminProduct.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
				   }
				   
				// 1부터 10번 반복, 11부터 10번반복, 21부터 10번반복..
				  //     10번을 찍어주지만 마지막페이지는 전체페이지수에 맞게찍어준다.
				 while( !(loop > blockSize || pageNo > totalPage) ){
					  if( pageNo == Integer.parseInt(currentShowPageNo)) {// 볼려고하는 페이지가ㅏ 페이지바의번호와 같다면
						  pageBar+= "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; // 자기가자기한테가야하기에 href=#
					  }
					  else {
						  pageBar+= "<li class='page-item'><a class='page-link' href='adminProduct.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
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
					 pageBar+= "<li class='page-item'><a class='page-link' href='adminProduct.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
					 pageBar+= "<li class='page-item'><a class='page-link' href='adminProduct.sun?sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>"; // 자기가자기한테가야하기에 상대경로로 getㅂㅇ식
				 }
//
//				 request.setAttribute("searchType", searchType);
//				 request.setAttribute("searchWord", searchWord);
				  request.setAttribute("pageBar", pageBar);
				  // **** ===== 페이지바 만들기 끝 ==== **** //
				  
				  
				  
				// **** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 **** //
//		            String currentURL = MyUtil.getCurrentURL(request);
		            // 회원조회를 했을시 현재 그 페이지로 그대로 되돌아가기 위한 용도로 쓰임.
		            
		         //  System.out.println("currentURL => " + currentURL);
		         //  /member/memberList.up?sizePerPage=10&currentShowPageNo=8&searchType=name&searchWord=%EC%A0%95 
		          
//		            currentURL = currentURL.replaceAll("&", " ");
		         //  System.out.println("currentURL => " + currentURL);      
		         //  /member/memberList.up?sizePerPage=10 currentShowPageNo=8 searchType=name searchWord=%EC%A0%95   
		            
//		            request.setAttribute("goBackURL", currentURL);
				  
//					super.setRedirect(false); 
					super.setViewPage("/WEB-INF/jieun/admin_productTable.jsp"); // 
					
				}
				
				
				
			}
		
		
		
		
		//		super.setRedirect(false); 
			super.setViewPage("/WEB-INF/jieun/admin_productTable.jsp"); // 
	
			
	}

}
