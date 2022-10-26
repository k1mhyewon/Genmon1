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
		  transition: opacity 500ms;
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
		/* 체크박스 : 라디오 동그라미 모양으로 변경 끝 */
   			
</style>

<script type="text/javascript">


	}); // end of ready
	


		

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
    	<div class="product-title" style="font-size: 13pt;">  		
	        <span>선글라스</span>  
	        <span>/</span>  
	        <span>베스트셀러</span>
        </div>
        
        <div class="product-filter"  style="padding: 0% 1%;">
	       <a href="<%= ctxPath %>/product/productListBestSeller.sun"><button type="button" id="item-short">사단보기</button></a>
		   <%-- 검색 필터 버튼 --%>    
		   <a href="#pop01"><button class="popup_btn">필터</button></a>
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




    <%-- 상품 리스트 이미지 나열 --%>
    <div class="row" style="text-align: center; margin: 1% 1%;">
 		<c:if  test="${not empty requestScope.bestSimple }">
 			<c:forEach var="simplevo" items="${requestScope.bestSimple}">
 					<div class="col-md-8 mt-3 p-0 col-lg-2"  >
	 					<a href="<%= ctxPath %>/product/productDetail.sun?pnum=${simplevo.pnum}">
	 						<img style="width: 200px; heigh: 70px;" src="<%= ctxPath %>/images/common/products/${simplevo.pimage1}">
	 					</a>
 					</div>
 			</c:forEach>
 		</c:if>
	</div>
		
		
	<%--  상품 모두 가져와서 디스플레이( 스크롤 방식으로 페이징 처리한 것) 
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
	--%>
	
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