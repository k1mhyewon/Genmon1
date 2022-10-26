<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath=request.getContextPath();%>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<jsp:include page="../common/header.jsp" />

<style type="text/css">

		.item-category {
	        text-align: center;
		    margin: 2% 0% 0% 10%;
		    padding: 0;
		}
		
   	   .item-category>li {
	        display: inline-block;
	        top: 10px;
	        text-align: center;
	        width: 10%;
        }

        .item-category>li>a {
		     display: block;
		     position: relative;
		     padding-bottom: 19px;
		     margin: 0 auto;
        }

        .item-category>li>a>img {
	         position: relative;
	         text-align: center;
	         width: 60%;
	         border-radius: 50%;
	         padding: 70;
        }
        
        .item-category>li>a>span {
	          position: absolute;
	          bottom: 0;
	          left: 53%;
	          color: #666;
	          line-height: 1.462em;
	          white-space: nowrap;
	          transform: translate(-50%, 0);
	          font-size: 9.5pt;
	          font-weight: bold;
	          margin-top: 7%;
       }
       
       
        .button {
            cursor: pointer;
        }
		
		a, a:visited, 
		a:hover, 
		a:active { /* 클릭 후에도 색상 변경 없도록 함  */
 	 		color: inherit;
		}
        
        .product-filter {
      		display:inline;
      		/* float:right; */
       		/* width: 100%; */
       		text-align: center;
        }
        
         /* footer-navbar 하단메뉴바 */
	    
	    .footer-navbar {
	    	 width: 20%;
	    	 height: auto;
	    	 background: #fff;
		     border-top: 1px solid #a1a1a1;
		     border-left: 1px solid #a1a1a1;
	    }
   	
	    .container-fluid {
	   		clear:both;
	 	    border: 1px black green;
	    	margin-top: 1%;
	    	text-align: center; 
	    	padding: 0;
	    }
	    
	    .footer-bar__btn {
	    	float: right; 
	    	cursor: pointer;
	    	margin-top: 4%;
	    	margin-bottom: 4%; 
	    	margin-right: 15%; 
	    	font-size: 11pt;
	    	font-weight: bold;

	    }
   
   		#item-short {
			background-color: white;
			border: none;
		}
		
		/* 팝업창 */

			.product-title {
				display: inline-block;
				font-weight: bold;
			}

			.product-filter {
				display: inline;
				float: right;
			}

			/* button#heart:hover {
			  background: tomato; 
			} */


			.popup_btn {
				display: inline-block;
				background-color: white;
				border: none;
			}

			.popup_btn a {
				clear: both;
				display: inline-block;
				background: #ffffff;
			}

			.overlay {
				position: fixed;
				top: 35%;
				bottom: 0;
				left: 0;
				right: 0;
				background: rgba(0, 0, 0, 0.7);
				/* transition: opacity 500ms; */
				visibility: hidden;
				opacity: 0;
				z-index: 900;
			}

			.overlay:target {
				visibility: visible;
				opacity: 1;
			}

			.popup {
				position: fixed;
				width: 100%;
				height: 40%;
				top: 55%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: white;
				/* "delay" the visibility transition */
				-webkit-transition: opacity 0s, visibility 0s linear 0s;
				transition: opacity 0s, visibility 0s linear 0s;
				z-index: 1;
			}

			.popup:target {
				position: fixed;
				visibility: visible;
				opacity: 1;
				/* cancel visibility transition delay */
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
			}

			.popup-close {
				position: absolute;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
			}

			.popup .close {
				position: absolute;
				right: 3%;
				color: gray;
				font-size: 20pt;
				font-weight: bold;
			}

			.popup .close:hover {
				color: gray;
			}

			.popupFrm {
				height: 100%;
				/* 	border: 1px yellow solid; */
			}

			.pop-content {
				height: 85%;
				/* 	border: 1x red solid;  */

				display: flex;
				justify-content: center;
			}

			.filter-title {
				float: left;
				text-align: left;
				margin: 0% 15% 5% 3%;
				font-weight: bold;
			}

			.filter-list {
				list-style: none;
				text-align: left;
				margin: 5% 0 0 0;
				padding: 0;
			}

			.filter-btn {
				float: right;
				top: -10%;
			}
		
		
		/* 체크박스 : 라디오 동그라미 모양으로 변경 시작 */
			input[type="checkbox"] {
				width: 1rem;
				height: 1rem;
				border-radius: 50%;
				border: 1px solid #999;
				appearance: none;
				cursor: pointer;
				transition: background 0.2s;
			}

			input[type="checkbox"]:checked {
				background: #000000;
				border: none;
			}

			input[type="radio"] {
				width: 1rem;
				height: 1rem;
				border-radius: 50%;
				border: 1px solid #999;
				appearance: none;
				cursor: pointer;
				transition: background 0.2s;
			}

			input[type="radio"]:checked {
				background: #000000;
				border: none;
			}
   			
</style>

<script type="text/javascript">


	let	lenDisplay = 12; 
	// 상품 스크롤 할 때 보여줄 상품의 개수(단위)크기
	
	let start = 1; // 아래서 문서로딩되자마자 호출되는 디폴트가 1이다.


	$(document).ready(function () {
			
			// HIT상품 게시물을 더보기 위하여 스크롤 이벤트에 대한 초기값 호출
		    // 즉, 맨처음에는 스크롤을 하지 않더라도 클릭한 것 처럼 8개의 HIT상품을 게시해주어야 한다는 말이다. 
			display(start); // 문서로딩 되자마자 이거 호출하면 아래 함수 start 는 1이 된다.
			
			$("span#totalHITCount").hide();  // 상품수 보여지는 건 숨기면 된다.
			$("span#countHIT").hide();
			
			// == 스크롤 이벤트 발생시키기 시작 === 
			$(window).scroll(function () {
				// 스크롤탑 위치값
				//  console.log("$(window).scrollTop() => " + $(window).scrollTop()) ;
				
				// 보여줘야할 문서 높이값(도보기 해주므로 append 되어져서 높이 계쏙 증가될 것이다.)
				// console.log( "$(document).height() =>" + $(document).height() );
				
				// 웹브라우저창의 높이값(디바이스마다 다르게 표현되는 고정값) 
		        // console.log( "$(window).height() => " + $(window).height() );
		        // 또는
		        // console.log( "web_browser_height => " + web_browser_height );
		        		
		        // 만약 위의 콘솔로그를 실행했을 때 개발자 도구 콘솔창에 스크롤 위치값 안나올 경우
		        // 아래는 이벤트가 발생되는 숫자를 만들기 위해서 스크롤탑의 위치값에 +1 을 더해서 보정해준 것이다.
		           console.log( "$(window).scrollTop() + 1  => " + ( $(window).scrollTop() + 1  ) );
		           console.log( "$(document).height() - $(window).height() => " + ( $(document).height() - $(window).height() ) );
		        // 또는 
		        // console.log( "$(document).height() - web_browser_height => " + ( $(document).height() - web_browser_height ) ); 		
		        
		        // if( $(window).scrollTop() == $(document).height() - $(window).height() ) {
		           // 만약 위의 콘솔로그를 실행했을 때 개발자 도구 콘솔창에 스크롤 값 차이나면 아래의 것으로 한다.(보정)
		           	  if( $(window).scrollTop() + 1 >= $(document).height() - $(window).height() ) {
		        	  //  alert("확인용");
		        	   
		        	   const totalHITCount = Number($("span#countHIT").text() );
		        	   const countHIT =  Number( $("span#totalHITCount").text() ); 
		        	   
		        	   if( totalHITCount != countHIT ) { // 같지 않다면 상품 더 보여줄 게 있다는 뜻이다.
		        		   start += lenDisplay;
		        	 	   display(start); // 9부터 또 더해라
		        	   }
		           }
		           
		           if( $(window).scrollTop() == 0 ) { // 상품 다 보여줬다면 위로 올라가야 한다 스크롤탑이 0, 처음으로 버튼의 end 는 초기화
		        		// 다시 처음부터 시작하도록 한다.   
		        		$("div#display").empty();
		        		$("span#end").empty();// 메세지도 삭제
		        		$("span#totalHITCount").text("0"); // 지금까지 보여진 것도 0으로
		        		
		        		start = 1;
		        		display(start);
		           }
		           
			});
					
			// == 스크롤 이벤트 발생시키기 끝 === 	
	}); // end of ready
	


		// Function Declaration

		function display(start) { 	 // start 가 1이라면 (페이징 처리 하는 것 rownum) 1~8까지 상품 8개 보여준다. 
									 // start 가 9이라면 (페이징 처리 하는 것 rownum) 9~16까지 상품 8개 보여준다. 	
									 // start 가 17이라면 (페이징 처리 하는 것 rownum) 17~24까지 상품 8개 보여준다. 	
									 // start 가 25이라면 (페이징 처리 하는 것 rownum) 25~32까지 상품 8개 보여준다. 	
									 // start 가 33이라면 (페이징 처리 하는 것 rownum) 33~36까지 나머지 상품 4개 보여준다.(마지막상품) 	
									 // 이게 로넘이다. 1~8    9~16,...
		
			$.ajax({
				url:"<%= request.getContextPath()%>/product/mallDisplayJSON.sun",
			//	type: "GET", 디폴트 겟방식
				data:{
					 "start":start // "1"   "9"   "17"   "25"   "33" 
					 ,"len":lenDisplay}, //  8	  8		8		8		8
				dataType:"JSON",
				success:function(json){
				
		        /*     console.log(json);
		               console.log(typeof json); // object
		             
		             
		               var str_json = JSON.stringify(json); // JSON 객체를 string 타입으로 변경시켜주는 것.
		                console.log(typeof str_json);  // string
		                console.log(str_json);
		                 
		         	
		                var obj_json = JSON.parse(str_json); // JSON 모양으로 되어진 string 을 실제  JSON 객체로 변경시켜주는 것.
		                console.log(typeof obj_json);  // object
		                console.log(obj_json);
		         */
		            
					let html = ""; // html에 꽂는 작업
					
					if(start == "1" && json.length == 0) {
						// 스타트 1인데 상품본 개수는 0
						// 처음부터 데이터가 존재하지 않는 경우
		                // !!! 주의 !!!
		                // if(json == null) 이 아님!!!
		                // if(json.length == 0) 으로 해야함!!
		                html += "현재 상품 준비중....";
		                
		                // HIT 상품 결과를 출력하기
		                $("div#display").html(html); // 덮어씌운다
					}
							
					else if(json.length > 0) {
						// 데이터가 존재하는 경우 
						$.each(json,function(index, item){
							
					 	html += '<div class="col-md-6 mt-3 p-2 col-lg-2">'+
									'<a href="<%= ctxPath %>/product/productDetail.sun?pnum='+item.pnum+'"><img src="../images/common/products/'+item.pimage1+'" class="card-img-top" style="width: 250px; heigh: 70px;" /></a>'+
										'<div class="card-body" style="padding: 5px;">'+
										'</div>'+
								'</div>';	 
							
						}); // end of $.each(json, function(index, item) foreach도 있고 그냥 each도 있다.
									
									
						// HIT 상품 결과 출력하기
						$("div#display").append(html); //append  prepend   html=append 보여주고 또 보여주고 ...
						
						// span#countHIT 에 지금까지 출력된 상품 개수 누적해서 기록한다.
						$("span#countHIT").text(Number($("span#countHIT").text()) + json.length); // 처음은 0 인데 타입이 문자다. 웹은 기본적으로 문자가 디폴트 문자열 결합은 숫자로 바꿔야 한다. parse int 또는 number 사용
																				// json 에서 지금까지 읽어온 상품 개수 알 수 있다. 8개씩 보여주다 맨마지막은 4개 더보기 버튼 옆 36 36이 된다.(오른쪽 36이 원래는 0 : 읽어온 개수 의미)
																				
						// 스크롤을 계속 움직여 countHIT 값과 totalHITCount 값 일치하는 경우 => 더보기버튼 없애고 처음으로 버튼 생성해준다.													
						if( $("span#countHIT").text() == $("span#totalHITCount").text()) {
							$("span#end").html("더이상 조회할 제품이 없습니다.");
						}
				
				} // end of  else if(json.lengh>0

				},
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		         }
		      
			});
								 
						 
		}//end of function display()---		

</script>			
		
<%-- 인덱스 시작 --%>

 <%-- 아이템 카테고리 --%>
 <div class="all-List-page">
 
    <ul class="item-category">
        <li><a href="#"><img src="<%= ctxPath %>/images/common/category/collection.jpg"><span class="category-font">2022 릴리즈</span></a></li>
        <li><a href="<%= ctxPath %>/product/productList.sun"><img src="<%= ctxPath %>/images/common/category/wholeSun.jpg"><span class="category-font">전체보기</span></a></li>
        <li><a href="<%= ctxPath %>/product/productListBestSeller.sun"><img src="<%= ctxPath %>/images/common/category/bestseller.jpg"><span class="category-font">베스트셀러</span></a></li>
        <li><a href="<%= ctxPath %>/product/productListClassic.sun"><img src="<%= ctxPath %>/images/common/category/classic.jpg"><span class="category-font">클래식디자인</span></a></li>
        <li><a href="<%= ctxPath %>/product/productListLense.sun"><img src="<%= ctxPath %>/images/common/category/tintedLense.jpg"><span class="category-font">틴트렌즈</span></a></li>
    </ul>
    <br><br>

    <%-- 상품 타이틀과 필터 --%>
    <div class="title" style="padding:0.7%;	margin-bottom:none; ">
    	<div class="product-title">  		
	        <span>선글라스/</span>  
	        <span>전체보기</span>
	        <span></span>
        </div>
        
        <div class="product-filter"  style="padding: 0% 1%;">
	       <a href="<%= ctxPath %>/product/productList.sun"><button type="button" id="item-short">사단보기</button></a>
		   <%-- 검색 필터 버튼 --%>    
		   <a href="#pop01"><button class="popup_btn">필터</button></a>
		</div>
		
	<%-- 검색 필터 팝업창 --%>
			<div id="pop01" class="overlay">
				<div class="popup">
					<a href="#none" class="close">&times;</a>
					<%-- 라디오 선택 폼태그 --%>
						<form class="popupFrm" method="get">
							<div class="pop-content">
								<div class="filter-title" style="display: inline-block;">프레임컬러
									<ul class="filter-list">
										<li><label><input type="checkbox" id="color" name="filter1" value="white" />화이트</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="black" />블랙</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="pink" />핑크</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="yellow" />옐로우</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="red" />레드</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="blue" />블루</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="clear" />클리어</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="ivory" />아이보리</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="green" />그린</label>
										</li>
										<li><label><input type="checkbox" id="color" name="filter1" value="brown" />브라운</label>
										</li>
									</ul>
								</div>
								<div class="filter-title">소재
									<ul class="filter-list">
										<li><label><input type="checkbox" id="material" name="filter2"
													value="acetate" />아세테이트</label></li>
										<li><label><input type="checkbox" id="material" name="filter2"
													value="metal" />메탈</label></li>
									</ul>
								</div>
								<div class="filter-title">정렬
									<ul class="filter-list">
										<li><label><input type="radio" id="order" name="filter3"
													value="1"  checked="checked"/>신상품순</label></li>
										<li><label><input type="radio" id="order" name="filter3"
													value="2" />낮은가격순</label></li>
										<li><label><input type="radio" id="order" name="filter3"
													value="3" />높은가격순</label></li>
									</ul>
								</div>
							</div>
							<%-- 검색 필터 초기화 및 상품보기버튼 --%>
								<div class="filter-btn">
									<button type="reset" class="btn btn-outline-dark mr-4" value="reset-btn">초기화</button>
									<button type="submit" class="btn btn-dark mr-4" value="submit-btn"
										id="resultFilter">상품보기</button>
								</div>
						</form>
						<%-- 폼태그 끝 --%>
				</div>
			</div>
			<%-- 검색 필터 팝업창 끝 --%>
		</div>
	</div> <%-- 아이템 카테고리 끝 --%>
 	<br>  




    <%-- 상품 리스트 이미지 나열 
    <div class="row" style="text-align: center; margin: 1% 1%;">
 		<c:if  test="${not empty requestScope.proSimple }">
 			<c:forEach var="simplevo" items="${requestScope.proSimple}">
 					<div class="col-md-8 mt-3 p-0 col-lg-2"  >
	 					<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${simplevo.pnum}">
	 						<img style="width: 200px; heigh: 70px;" src="<%= ctxPath %>/images/common/products/${simplevo.pimage1}">
	 					</a>
 					</div>
 			</c:forEach>
 		</c:if>
	</div>
	--%>	
		
	<%--  상품 모두 가져와서 디스플레이( 스크롤 방식으로 페이징 처리한 것) --%>
		<div >
			
			<div class="row" style="text-align: center; margin: 1% 1%;" id="display"></div>
			
			
			<div>
				<p class="text-center">
					<span id="end" style="display:block; margin:20px; font-size: 14pt; font-weight: bold; color: red;"></span>
			<span id="totalHITCount">${requestScope.totalHITCount}</span>
					<span id="countHIT">0</span>
				</p>
			</div>
		</div>	
	
	<%-- footer 하단bar 고정 
	
	<nav class="footer-navbar fixed-bottom navbar-light bg-light ml-auto ">
	  <div class="container-fluid">
	    <span class="footer-bar__btn" data-target-slide="recent-list" data-category="footer" data-action="footer_click" data-label="최근 본 상품">
			최근 본 상품 <span class="recent-count font--md">(3)</span>
		</span> 
		<span class="footer-bar__btn" data-target-slide="wish-list" data-category="footer" data-action="footer_click" data-label="관심상품">
			관심상품 <span class="wish-count font--md">(0)</span>
		</span>
	  </div>
	</nav>
	--%>

<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />