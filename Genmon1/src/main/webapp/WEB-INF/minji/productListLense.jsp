<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				text-decoration: none;
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

<script>

$(document).ready(function () {

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

		/* console.log(chk_array1);
		console.log(chk_array2);
		console.log(chk_array3); */
			
			
		var checked_filter1 = chk_array1.join();
		var checked_filter2 = chk_array2.join();
		var checked_filter3 = chk_array3.join();
			
		
		/* console.log(checked_filter1);
		console.log(checked_filter2);
		console.log(checked_filter3); */
		
		
		$.ajax({
			url:"<%= ctxPath%>/product/producListFilterJSON.sun",
	//	type: "GET", 
		async: true,						
		data: {"checked_filter1":checked_filter1,
		  	  "checked_filter2":checked_filter2,
			  "checked_filter3":checked_filter3},
	    dataType:"JSON",
	    success:function(json) {
	    	//$("div#original").hide();
	    	//console.log(json);
				//console.log(typeof json);
	    	let html = '';
	    	$("div#original").hide();
	    	if(json.length == 0){// 글이 없는경우.
	    		//$("div#original").html('');
				html += "<div style='text-align:center;font-size:20pt'>해당되는 상품이 없습니다.</div>";
		    	$("div#show").html(html);
			}
	    	
			else { // 데이터가 존재하는 경우   
				//alert("하하");
				$.each(json, function(index, item){  // each 는 파라미터가 2개 ( index, item )
					const price = Number(item.price).toLocaleString('en');
					const total = Number(item.price-( item.price * item.salePcnt/100 ) ).toLocaleString('en');
					const color = item.pcolor.substr(0,2).toUpperCase();
					html += '<div class="col-md-3 mt-3">'+
                              '<div style="width:340px;">';
                           if(Number(item.pqty) == 0){
                          	html+= '<a href="Genmon1/product/productDetail.sun?pnum='+item.pnum+'" class="pqty"><img style="width:340px;" src="<%= ctxPath %>/images/common/products/'+item.pimage1+'"></a>'+
                          			'<span class="grid-item-qty" style="display: inline-block; color: #449ce8;" class="grid-item-pqty"><i>out of stock</i></span>';
                           }    
                           else {
                          	html+= '<a href="Genmon1/product/productDetail.sun?pnum='+item.pnum+'" class="product"><img style="width:340px;" src="<%= ctxPath %>/images/common/products/'+item.pimage1+'"></a>';
                            }    

                            html += '<span class="grid-item-name">'+item.pname+' '+color+'"</span>';
                           	
                            if(Number(item.salePcnt) > 0){
                           	html+= '<span style="text-decoration:line-through; color:gray;" class="grid-item-price">'+price+'</span>'+
                                          '<span class="grid-item-price">'+total+'</span>';
                            }
                            else{
                                      html += '<span class="grid-item-price">'+price+'</span>';
                            }
                            
                            html +=  '<span class="grid-item-color" style="color: red;"></span><span>Colors</span>'+
                            		 '</div></div>';
					});// end of $.each -------------------------
			    	$("div#show").html(html);
					location.href("#none");
					//$("a.close").click();
		    	}
		    	
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		return false;
	}); // end of $("button#resultFilter()").click(()

	
			

}); // end of ready



// 위시리스트 추가 메소드 (AJAX)추가 하고 버튼 안에 하트를 빈 하트로 바꾸면 대지 않을가??? 
function addWish() {

	// 그리고 다시 누르면 제거 하는 것도 있어야 할듯....
}




</script>

<%-- 인덱스 시작 --%>

<!-- 아이템 카테고리 -->

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
	<div class="title" style="padding:0.5%;	margin-bottom:none; ">
		<div class="product-title" style="font-size: 13pt;">
			<span>선글라스</span>
			<span>/</span>
			<span>틴트렌즈</span>
		</div>

		<div class="product-filter" style="padding: 0% 1%;">
			<a href="<%=ctxPath %>/product/productListSimpleLense.sun"><button type="button" id="item-short"><i
						class="fa-thin fa-grid-4"></i>간략보기</button></a>
			<%-- 검색 필터 버튼 --%>
				<a href="#pop01"><button type="button" class="popup_btn"><i
							class="fa-thin fa-arrow-up-short-wide"></i>필터</button></a>
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
</div>
<%-- 아이템 카테고리 끝 --%>
<br>

<%-- 위에 필터 숨기고 아래 div로 결과값 보여주기 --%>
	<div class="row ml-auto" style="text-align: justify; margin-bottom: 2%;" ><div id="show">

	</div>
	</div>


	<!-- 상품목록 -->

	<div class="row ml-auto" style="text-align: justify; margin-bottom: 2%;" id="original" >
		<c:if test="${ not empty requestScope.lenseList}">
			<c:forEach var="pvo" items="${requestScope.lenseList }">
				<div class="col-md-3 mt-3">
					<div style="width:340px;">

						<c:choose>
							<c:when test="${pvo.pqty == 0}">
								<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${pvo.pnum}" class="pqty"><img
										style="width:340px;" src="<%= ctxPath %>/images/common/products/${pvo.pimage1}"></a>
							</c:when>

							<c:when test="${pvo.pqty != 0}">
								<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${pvo.pnum}" class="product"><img
										style="width:340px;" src="<%= ctxPath %>/images/common/products/${pvo.pimage1}"></a>
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

								<%-- <c:otherwise> 할인 없는 곳 공백 넣을까 말까???
									<span class="grid-item-price"> &nbsp; </span>
									</c:otherwise>--%>
							</c:choose>

							<span class="grid-item-color"><span class="color-count">+</span> Colors</span>
						</a>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>



	<%-- footer 하단bar 고정 

		<nav class="footer-navbar fixed-bottom navbar-light bg-light ml-auto ">
			<div class="container-fluid">
				<span class="footer-bar__btn" data-target-slide="recent-list" data-category="footer"
					data-action="footer_click" data-label="최근 본 상품">
					최근 본 상품 <span class="recent-count font—md">(3)</span>
				</span>
				<span class="footer-bar__btn" data-target-slide="wish-list" data-category="footer"
					data-action="footer_click" data-label="관심상품">
					관심상품 <span class="wish-count font—md">(0)</span>
				</span>
			</div>
		</nav>
		
	--%>

		<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />