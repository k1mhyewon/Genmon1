<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		a:link, a:visited, a:hover, a:active { /* 클릭 후에도 색상 변경 없도록 함  */
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
      		display:inline;
       		float:right;
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
		  top: 0.5%;
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
		/* 체크박스 : 라디오 동그라미
</style>

<script>
	$(document).ready(function(){
		
		
		
	}); // end of ready
	
	
	// 위시리스트 추가 메소드 (AJAX)추가 하고 버튼 안에 하트를 빈 하트로 바꾸면 대지 않을가???  ~~~ KHW 화이팅팅팅탱탱탱 룰루랄라~~~~ 
	function addWish(){
		
		// 그리고 다시 누르면 제거 하는 것도 있어야 할듯.... ~~~ 넌 할 수 있어!!! ~~~
	}

</script>

<%-- 인덱스 시작 --%>

 <!-- 아이템 카테고리 -->
 
 <div class="all-List-page">
 
    <ul class="item-category">
        <li><a href="#"><img src="<%= ctxPath %>/images/common/category/2022컬렉션.jpg"><span class="category-font">2022년 컬렉션</span></a></li>
        <li><a href="<%= ctxPath %>/product/productList.sun"><img src="<%= ctxPath %>/images/minji/전체보기.jpg"><span class="category-font">전체보기</span></a></li>
        <li><a href="#"><img src="<%= ctxPath %>/images/common/category/베스트셀러.jpg"><span class="category-font">베스트셀러</span></a></li>
        <li><a href="#"><img src="<%= ctxPath %>/images/common/category/클래식디자인.jpg"><span class="category-font">클래식디자인</span></a></li>
        <li><a href="#"><img src="<%= ctxPath %>/images/common/category/선물추천.jpg"><span class="category-font">선물추천</span></a></li>
        <li><a href="#"><img src="<%= ctxPath %>/images/common/category/틴트렌즈.jpg"><span class="category-font">틴트렌즈</span></a></li>
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
	       <a href="<%=ctxPath %>/product/productListSimple.sun"><button type="button" id="item-short"><i class="fa-thin fa-grid-4"></i>간략보기</button></a>
		   <%-- 검색 필터 버튼 --%>    
		   <a href="#pop01"><button type="button" class="popup_btn"><i class="fa-thin fa-arrow-up-short-wide"></i>필터</button></a>
		</div>
		
				<%-- 검색 필터 팝업창  --%>  
				<div id="pop01" class="overlay">
				  <div class="popup">
				    <a href="#none" class="close">&times;</a>
				    	<%-- 라디오 선택 폼태그 --%>
					    <form class="popupFrm" action="#">
					    	<div class="pop-content">
						    	<div class="filter-title">프레임컬러
						    	  <ul class="filter-list">
								      <li><label for="frame-color"><input type="checkbox" id="frame-color" name="filter"/>화이트</label></li>
								      <li><label for="frame-color"><input type="checkbox" id="frame-color" name="filter" />핑크</label></li>
								      <li><label for="frame-color"><input type="checkbox" id="frame-color" name="filter"/>레드</label></li>
								      <li><label for="frame-color"><input type="checkbox" id="frame-color" name="filter"/>클리어</label></li>
								      <li><label for="frame-color"><input type="checkbox" id="frame-color" name="filter"/>골드</label></li>
								      <li><label for="frame-color"><input type="checkbox" id="frame-color" name="filter"/>실버</label></li>
								      <li><label for="frame-color"><input type="checkbox" id="frame-color" name="filter"/>기타</label></li>
								  </ul>
								</div>
								<div class="filter-title">렌즈 컬러
									<ul class="filter-list">  
								      <li><label for="lense-color"><input type="checkbox" id="lense-color" name="filter"/>화이트</label></li>
								      <li><label for="lense-color"><input type="checkbox" id="lense-color" name="filter"/>핑크</label></li>
								      <li><label for="lense-color"><input type="checkbox" id="lense-color" name="filter"/>레드</label></li>
								      <li><label for="lense-color"><input type="checkbox" id="lense-color" name="filter"/>클리어</label></li>
								      <li><label for="lense-color"><input type="checkbox" id="lense-color" name="filter"/>골드</label></li>
								      <li><label for="lense-color"><input type="checkbox" id="lense-color" name="filter"/>실버</label></li>
								      <li><label for="lense-color"><input type="checkbox" id="lense-color" name="filter"/>기타</label></li>
								    </ul> 
								 </div>    
								 <div class="filter-title">소재
								 	<ul class="filter-list">   
								      <li><label for="material"><input type="checkbox" id="material" name="filter"/>아세테이트</label></li>
								      <li><label for="material"><input type="checkbox" id="material" name="filter"/>메탈</label></li>
								      <li><label for="material"><input type="checkbox" id="material" name="filter"/>콤비</label></li>
								    </ul>
								  </div>    
								  <div class="filter-title">정렬
								 	<ul class="filter-list">
								      <li><label for="order"><input type="checkbox" id="order" name="filter"/>신상품순</label></li>
								      <li><label for="order"><input type="checkbox" id="order" name="filter"/>낮은가격순</label></li>
								      <li><label for="order"><input type="checkbox" id="order" name="filter"/>높은가격순</label></li>
							       </ul>
							 	 </div>  
					  	 	</div>
					  	 	 <%-- 검색 필터 초기화 및 상품보기버튼 --%>
					  	 	 <div class="filter-btn">
					  	 	 	 <button type="reset" class="btn btn-outline-dark mr-4" value="reset-btn">초기화</button>
					  	 	   	 <button type="submit" class="btn btn-dark mr-4" value="submit-btn">상품보기</button>
					  	 	 </div>
					  </form> <%-- 폼태그 끝 --%>
				 	</div>
			  	</div> <%-- 검색 필터 팝업창 끝 --%>
		</div>
	</div> <%-- 아이템 카테고리 끝 --%>
  <br>  

    

    <!-- 상품목록 -->
    
    <div class="row ml-auto" style="text-align: justify; margin-bottom: 2%; ">
	   	<c:if test="${ not empty requestScope.proList}">
	   		<c:forEach var="pvo" items="${requestScope.proList }">
		   		<div class="col-md-3 mt-3">
		   			 <div style="width:340px;">
		   			 
		   			 	<c:choose>
		   			 		<c:when test="${pvo.pqty == 0}">
			 				<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${pvo.pnum}" class="pqty"><img style="width:340px;" src="<%= ctxPath %>/images/common/products/${pvo.pimage1}" ></a>
			 				</c:when>
			 				
			 				<c:when test="${pvo.pqty != 0}">
			 				<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${pvo.pnum}" class="product"><img style="width:340px;" src="<%= ctxPath %>/images/common/products/${pvo.pimage1}" ></a>
			 				</c:when>
			 			</c:choose>
			 			
			  				<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${pvo.pnum}" class="product">
				 		 		
			 		 		<c:if test="${pvo.pqty == 0}">
			 		 		<span class="grid-item-qty" style="display: inline-block; color: #449ce8;"  class="grid-item-pqty"><i>out of stock</i></span>
							</c:if>	
			 		 		
			 		 		<span class="grid-item-name">${pvo.parentProvo.pname } ${pvo.colorName }</span>
								 		 		
			 		 		<c:choose>
			 		 			<c:when test="${pvo.salePcnt > 0}">
			 		 				<span style="text-decoration:line-through; color:gray;" class="grid-item-price"><fmt:formatNumber value="${pvo.parentProvo.price}" pattern="#,###" /></span>
			 		 			</c:when>
			 		 			
		 		 				<c:when test="${pvo.salePcnt <= 0}">
		 		 					<span class="grid-item-price"><fmt:formatNumber value="${pvo.parentProvo.price}" pattern="#,###" /></span>
		 		 				</c:when>
			 		 		</c:choose>
			 		 		
			 		 		<c:choose>
				 		 		<c:when test="${pvo.salePcnt > 0}">
				 		 			<span class="grid-item-price"><fmt:formatNumber value="${pvo.parentProvo.price - (((pvo.parentProvo.price) * pvo.salePcnt)/100) }" pattern="#,###" /></span>
				 		 		</c:when>
				 		 		
				 		 	<%-- <c:otherwise>  할인 없는 곳 공백 넣을까 말까???  
				 		 			<span class="grid-item-price"> &nbsp; </span>
				 		 		</c:otherwise>--%>
			 		 		</c:choose>
			 		 			
			 		 		<span class="grid-item-color"> +<span class="color-count">5</span> Colors</span>
		 		 	 	</a>
		 		 	 	
						<button class="item-wish-btn" style="border:none; background-color: white; float: right; display: inline-block;" onclick="addWish()">	&#10084;</button>
				 </div>	
			</div>
   		</c:forEach>
   	</c:if>
   </div>
    
    
	
	<%-- footer 하단bar 고정 --%>
	
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
	

<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />