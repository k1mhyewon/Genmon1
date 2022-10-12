<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath=request.getContextPath();%>
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
		
		.grid-item-img * {
			width: 100%;
			bottom: 0%;
			display: block;
			margin: 0;
		}
		
		.grid-item-qty {
			/* position: relative; */
			display: block;
		}
		
		.grid-item-name {
			font-size: 11pt;
			font-weight: bold;
			display: block;
		}
		
		.grid-item-price {
			display: block;
			font-size: 10pt;
		}
		
		.grid-item-color {
			font-size: 9pt;
			margin-top: 2%;
		}
		
		.color-count {
			color: rgba(181, 41, 41, 0.78);
		}
		
		.button {
			cursor: pointer;
		}
		
		a:link,
		a:visited,
		a:hover,
		a:active {
			/* 클릭 후에도 색상 변경 없도록 함  */
			color: inherit;
		}
		
		.pqty {
			-webkit-filter: blur(5px);
			filter: blur(4px);
		}
		
		.product-list {
			clear: right;
			width: 1000px;
			margin-left: auto;
			margin-right: auto;
		}
		
		.product-name {
			margin-top: 20px;
			margin-bottom: 4px;
		}
		
		.product-filter {
			display: inline;
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
			clear: both;
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
			top: 40%;
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
			height: 50%;
			top: 65%;
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
			margin-top: 10px;
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
		
		/* 체크박스 : 라디오 동그라미
		</style>
		
		<script>
		
		$(document).ready(function () {
			
			<%-- 
			let	lenDisplay = 8; 
			// 상품 스크롤 할 때 보여줄 상품의 개수(단위)크기
		
			let start = 1; // 아래서 문서로딩되자마자 호출되는 디폴트가 1이다.
			
			// HIT상품 게시물을 더보기 위하여 스크롤 이벤트에 대한 초기값 호출
		    // 즉, 맨처음에는 스크롤을 하지 않더라도 클릭한 것 처럼 8개의 HIT상품을 게시해주어야 한다는 말이다. 
			display(start); // 문서로딩 되자마자 이거 호출하면 아래 함수 start 는 1이 된다.
			
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
			--%>
			
			/////////////////////////////////////////////////
	
			
			// 필터 검색 기능
			$("button#resultFilter").click(() => {
				
				var chk_array1 = [];
				var chk_array2 = [];
				var chk_array3 = [];
		
				if ($("input:checkbox[name='filter1']:checked").length > 0) {
		
		
					$("input[name='filter1']:checked").each(function () {
		
						var colorVal = $(this).val();
						// console.log(colorVal);
		
						chk_array1.push(colorVal);
		
					}); // end of $("input[name='filter1']:checked").each(function()  : color 필터
		
				} // end of if($("input:checkbox[name='filter1']:checked").length >0)
		
		
				if ($("input:checkbox[name='filter2']:checked").length > 0) {
		
		
					$("input[name='filter2']:checked").each(function () {
		
						var material = $(this).val();
		
						chk_array2.push(material);
		
					}); // end of  $("input[name='filter2']:checked").each(function() : material 필터
		
				} // end of if($("input:checkbox[name='filter2']:checked").length >0)
		
		
				if ($("input:radio[name='filter3']:checked").length > 0) {
		
		
					$("input[name='filter3']:checked").each(function () {
		
						var order = $(this).val();
		
						chk_array3.push(order);
		
					}); // end of  $("input[name='filter3']:checked").each(function() : order 필터
		
				} // end of if($("input:checkbox[name='filter3']:checked").length >0)
		
				console.log(chk_array1);
				console.log(chk_array2);
				console.log(chk_array3);
					
					
				var checked_filter1 = chk_array1.join();
				var checked_filter2 = chk_array2.join();
				var checked_filter3 = chk_array3.join();
					
				
				console.log(checked_filter1);
				console.log(checked_filter2);
				console.log(checked_filter3);
				
				
				$.ajax({
					url:"<%= ctxPath%>/product/producListFilterJSON.sun",
				//	type: "GET",  
					data: {"checked_filter1":checked_filter1,
					  	   "checked_filter2":checked_filter2,
						   "checked_filter3":checked_filter3},
				    dataType:"JSON",
				    success:function(json) {
				    //	alert("하하");
				    //	console.log(json);
		 			//	console.log(typeof json);
		 				
				    	let html = '';
	
				    	
				    	if(json.length == 0){// 상품이 없는경우.
							// !!! 주의 !!!
			                // if(json == null) 이 아님!!!
			                // if(json.length == 0) 으로 해야함!!
							html += " &nbsp; 해당되는 상품이 없습니다.";
						
						}
						else if( json.length > 0) { // 해당되는 상품이 존재하는 경우   
							
							$.each(json, function(index, item){  // each 는 파라미터가 2개 ( index, item )
								
							html += '<div class="row ml-auto" style="text-align: justify; margin-bottom: 2%;">'+
										'<div class="col-md-3 mt-3">'+
											'<div style="width:340px;">';
					
											
													'<a href="Genmon1/product/productDetail.sun?pnum='+item.pnum+'" class="product"></a>'+
												'<span class=\"grid-item-color\" style=\"color: red;\"> +  </span><span>Colors</span>'+
										'</div>'+
									'</div>'+
								'</div>';	
			
							});// end of $.each -------------------------
				    	}
				    	
				    	
				    	$("div#pop01").hide();
				    	$("div#display").html('');
				    	$("div#show").html(html);
				    	
				    },
				    error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						$("div#pop01").hide();
					}
				});
		
				
			}); // end of $("button#resultFilter()").click(()
		
		}); // end of ready
		
						
		<%-- 
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
				data:{"panmaestate": "1"
					,"start":start // "1"   "9"   "17"   "25"   "33" 
					 ,"len":lenDisplay}, //  8	  8		8		8		8
				dataType:"JSON",
				success:function(json){
				
		               console.log(json);
		               console.log(typeof json); // object
		             
		             /*
		                var str_json = JSON.stringify(json); // JSON 객체를 string 타입으로 변경시켜주는 것.
		                console.log(typeof str_json);  // string
		                console.log(str_json);
		            */     
		         	/*
		                var obj_json = JSON.parse(str_json); // JSON 모양으로 되어진 string 을 실제  JSON 객체로 변경시켜주는 것.
		                console.log(typeof obj_json);  // object
		                console.log(obj_json);
		             */
		             <%--         
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
							
					 	html += "<div class='row ml-auto' style='text-align: justify; margin-bottom: 2%;' >"+
									"<div class='card mb-3'>"+
									"<img src='/images/common/products"+item.pimage1+"' class='card-img-top' style='width: 100%' />" +
										"<div class='card-body' style='padding: 0; font-size: 11pt;'>"+
											"<ul class='list-unstyled mt-3 pl-3'>"+
												"<li><label class='prodInfo'></label>"+item.pname+"</li>"+
												"<li><label class='prodInfo'></label><span style=\"color: red; text-decoration: line-through;\">"+(item.price).toLocaleString('en')+" 원</span></li>"+
												"<li><label class='prodInfo'>할인율</label><span style=\"color: blue; \">["+(item.salePcnt).toLocaleString('en')+"&] 할인</span></li>"+
												"<li class='text-center'><a href='/product/productList.sun?pnum="+item.pnum+"' class='stretched-link btn btn-outline-dark btn-sm' role='button'>자세히보기</a></li>"+
											"</ul>"+	
									"</div>"+
								"</div>"+
							"</div>"; ";	 
							
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
		--%>				
		
		
		//////////////////////////////////////////////				
		
		// 위시리스트 추가 메소드 (AJAX)추가 하고 버튼 안에 하트를 빈 하트로 바꾸면 대지 않을가??? 
		function addWish() {
		
			// 그리고 다시 누르면 제거 하는 것도 있어야 할듯....
		}
		
		
		
		
		</script>
		
		<%-- 인덱스 시작 --%>
		
		<!-- 아이템 카테고리 -->
		
		<div class="all-List-page">
		
			<ul class="item-category">
				<li><a href="#"><img src="<%= ctxPath %>/images/common/category/collection.jpg"><span
					class="category-font">2022년 컬렉션</span></a></li>
		<li><a href="<%= ctxPath %>/product/productList.sun"><img
			src="<%= ctxPath %>/images/common/category/wholeSun.jpg"><span class="category-font">전체보기</span></a>
		</li>
		<li><a href="#"><img src="<%= ctxPath %>/images/common/category/bestseller.jpg"><span
					class="category-font">베스트셀러</span></a></li>
		<li><a href="#"><img src="<%= ctxPath %>/images/common/category/classic.jpg"><span
					class="category-font">클래식디자인</span></a></li>
		<li><a href="#"><img src="<%= ctxPath %>/images/common/category/classic.jpg"><span
					class="category-font">선물추천</span></a></li>
		<li><a href="#"><img src="<%= ctxPath %>/images/common/category/tintedLense.jpg"><span
						class="category-font">틴트렌즈</span></a></li>
			<li class="item-category-next">
				<a class="category-link" href="#"><i class="fa-solid fa-circle-chevron-right"></i></a>
			</li>
		</ul>
		<br><br>
		
		
		<%-- 상품 타이틀과 필터 --%>
		<div class="title" style="padding:0.5%;	margin-bottom:none; ">
		<div class="product-title">
			<span>선글라스/</span>
			<span>전체보기</span>
			<span>(27)</span>
		</div>
		
		<div class="product-filter" style="padding: 0% 1%;">
		<a href="<%=ctxPath %>/product/productListSimple.sun"><button type="button" id="item-short"><i
					class="fa-thin fa-grid-4"></i>간략보기</button></a>
		<%-- 검색 필터 버튼 --%>
				<a href="#pop01"><button type="button" class="popup_btn" id="filter-btn"><i
							class="fa-thin fa-arrow-up-short-wide"></i>필터</button></a>
		</div>
		
		<%-- 검색 필터 팝업창 --%>
		<div id="pop01" class="overlay">
			<div class="popup">
				<a href="#none" class="close">&times;</a>
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
				</div>
		</div>
		<%-- 검색 필터 팝업창 끝 --%>
				</div>
		</div>
		<%-- 아이템 카테고리 끝 --%>
		<br>
		
		<%-- 위에 필터 숨기고 아래 div로 필터 검색 결과값 보여주기 --%>
		<div id="show">
		
		</div>
		
	
		<!-- 상품목록 -->
		
		<div class="row ml-auto" style="text-align: justify; margin-bottom: 2%;" id="display">
		<c:if test="${ not empty requestScope.proList}">
		<c:forEach var="pvo" items="${requestScope.proList }">
			<div class="col-md-3 mt-3">
				<div style="width:340px;">
		
					<c:choose>
						<c:when test="${pvo.pqty == 0}">
							<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${pvo.pnum}" class="pqty">
							<img id="image1"  style="width:340px;" src="<%= ctxPath %>/images/common/products/${pvo.pimage1}"></a>
						</c:when>
		
						<c:when test="${pvo.pqty != 0}">
							<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${pvo.pnum}" class="product"><img
									id="image1" style="width:340px;" src="<%= ctxPath %>/images/common/products/${pvo.pimage1}"></a>
						</c:when>
					</c:choose>
		
					<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${pvo.pnum}" class="product">
		
						<c:if test="${pvo.pqty == 0}">
							<span class="grid-item-qty" style="display: inline-block; color: #449ce8;"
								class="grid-item-pqty"><i>out of stock</i></span>
						</c:if>
		
						<span class="grid-item-name">${pvo.parentProvo.pname } ${pvo.colorName }</span>
		
						<c:choose>
							<c:when test="${pvo.salePcnt > 0}">
								<span style="text-decoration:line-through; color:gray;" class="grid-item-price">
									<fmt:formatNumber value="${pvo.parentProvo.price}" pattern="#,###" />
								</span>
							</c:when>
		
							<c:when test="${pvo.salePcnt <= 0}">
								<span class="grid-item-price">
									<fmt:formatNumber value="${pvo.parentProvo.price}" pattern="#,###" />
								</span>
							</c:when>
						</c:choose>
		
						<c:choose>
							<c:when test="${pvo.salePcnt > 0}">
								<span class="grid-item-price">
									<fmt:formatNumber
										value="${pvo.parentProvo.price - (((pvo.parentProvo.price) * pvo.salePcnt)/100) }"
										pattern="#,###" />
								</span>
							</c:when>
							</c:choose>
		
						<span class="grid-item-color"><span style="color: red;"> + </span> Colors</span>
					</a>
				</div>
			</div>
		</c:forEach>
		</c:if>
		</div>
				
		
		
		<%--  상품 모두 가져와서 디스플레이( 스크롤 방식으로 페이징 처리한 것) --%>
		<div>
			<p class="h3 my-3 text-center">- 전체 상품 -</p>
			
			<div class="row ml-auto" style="text-align: justify; margin-bottom: 2%;" id="display"></div>
			
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
				<span class="footer-bar__btn" data-target-slide="recent-list" data-category="footer"
					data-action="footer_click" data-label="최근 본 상품">
					최근 본 상품 <span class="recent-count font--md">(3)</span>
				</span>
				<span class="footer-bar__btn" data-target-slide="wish-list" data-category="footer"
					data-action="footer_click" data-label="관심상품">
					관심상품 <span class="wish-count font--md">(0)</span>
				</span>
			</div>
		</nav>
		--%>
		
		
		<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />