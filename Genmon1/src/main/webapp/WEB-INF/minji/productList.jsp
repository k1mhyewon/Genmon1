<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
       
        .grid-container {
			  display: grid;
			  grid-column-gap: 50px;
			  grid-row-gap: 50px;
			  background-color: none;
			  grid-template-columns: 1fr 1fr 1fr 1fr;
	 		  grid-template-rows: 1fr 1fr 1fr;
	 		  margin: 0 auto;
	 		  box-sizing : border-box;
	 	      padding: 2rem 2rem;
		}
		
		.grid-item-text {
			float: left;
			position: relative;
			margin-top: 5%;
		}
        
		.grid-item-img * {
			  width: 100%;
			  bottom: 0%;
			  display: block;
			  margin: 0;
		}
		
		.grid-item-name {
			font-size: 11pt;
			font-weight: bold;
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
		
		.item-wish-btn {
			border:none;
			float: right;
			margin-top: 4%;
		}

        .button {
            cursor: pointer;
        }
		
		a:link, a:visited, a:hover, a:active { /* 클릭 후에도 색상 변경 없도록 함  */
 	 		 color: inherit;
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


<%-- 인덱스 시작 --%>

 <!-- 아이템 카테고리 -->
 
 <div class="all-List-page">
 
    <ul class="item-category">
        <li><a href="#"><img src="<%= ctxPath %>/images/minji/2022컬렉션.jpg"><span class="category-font">2022년 컬렉션</span></a></li>
        <li><a href="<%= ctxPath %>/product/productList.sun"><img src="<%= ctxPath %>/images/minji/셀리컬렉션.jpg"><span class="category-font">전체보기</span></a></li>
        <li><a href="#"><img src="<%= ctxPath %>/images/minji/베스트셀러.jpg"><span class="category-font">베스트셀러</span></a></li>
        <li><a href="#"><img src="<%= ctxPath %>/images/minji/클래식디자인.jpg"><span class="category-font">클래식디자인</span></a></li>
        <li><a href="#"><img src="<%= ctxPath %>/images/minji/선물추천.jpg"><span class="category-font">선물추천</span></a></li>
        <li><a href="#"><img src="<%= ctxPath %>/images/minji/틴트렌즈.jpg"><span class="category-font">틴트렌즈</span></a></li>
        <li class="item-category-next">
            <a class="category-link" href="#"><i class="fa-solid fa-circle-chevron-right"></i></a>
        </li>
    </ul>
    <br><br>


    <%-- 상품 타이틀과 필터 --%>
    <div class="title" style="padding: 0 2.5rem; margin-bottom:none; ">
    	<div class="product-title">  		
	        <span>선글라스/</span>  
	        <span>전체보기</span>
	        <span>(304)</span>
        </div>
        
        <div class="product-filter">
	       <a href="<%=ctxPath %>/product/productListSimple.sun"><button type="button" id="item-short">간략보기</button></a>
		   <%-- 검색 필터 버튼 --%>    
		   <a href="#pop01"><button type="button" class="popup_btn">필터</button></a>
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
    <div class="grid-container">
    	<div class="grid-info">
	 		<div class="grid-item-img"><a href="<%= ctxPath %>/product/productDetail.sun" class="product" ><img src="<%= ctxPath %>/images/minji/전체보기/릴리트01(Y).jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="<%= ctxPath %>/product/productDetail.sun" class="product">
		 		 		<span class="grid-item-name">릴리트 01(BR)</span>
		 		 		<span class="grid-item-price">259,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span> Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" id="heart" onclick=""><i class="fa-regular fa-heart" ></i></button>
				 <!-- 버튼 호버 색 변경 안 됨 + 이모티콘 배경색상 none 안 됨  -->
			</div>	
			
		 <div class="grid-info">
		 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/디디온GRC1.jpg" ></a></div>
		  			<div class="grid-item-text" style="inline-block">
		  				<a href="#" class="product">
			 		 		<span class="grid-item-name">디디온 GRC1</span>
			 		 		<span class="grid-item-price">270,000원</span>
			 		 		<span class="grid-item-color"> +<span class="color-count">5</span> Colors</span>
		 		 		</a>
					 </div>
					 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
				</div>	
	  	
	 	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/디디온VC1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">디디온 VC1</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
			
	 <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/로지YC5.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">로지 YC5</span>
		 		 		<span class="grid-item-price">269,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
			
	  	
	 <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/론디01(V).jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">론디 01(V)</span>
		 		 		<span class="grid-item-price">259,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/르IBG1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">르 IBG1</span>
		 		 		<span class="grid-item-price">280,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn"><i class="fa-regular fa-heart" ></i></button>
			</div>				
			
	  	
	 <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/르Ic1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">르 Ic1</span>
		 		 		<span class="grid-item-price">280,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/르Iv1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">르 Iv1</span>
		 		 		<span class="grid-item-price">280,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
	  	
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/르P1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">르 P1</span>
		 		 		<span class="grid-item-price">280,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	 
			
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/밀IC1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">밀 IC1</span>
		 		 		<span class="grid-item-price">249,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
	  	
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/밀 Y2.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">밀 Y2</span>
		 		 		<span class="grid-item-price">249,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
			
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="<%= ctxPath %>/images/minji/전체보기/로티 IC1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">로티 IC1</span>
		 		 		<span class="grid-item-price">280,000원</span>
		 		 		<span class="grid-item-color"> +<span class="color-count">5</span>  Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
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