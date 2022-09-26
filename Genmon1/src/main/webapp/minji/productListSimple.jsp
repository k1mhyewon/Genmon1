<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<style type="text/css">

		.item-category {
	        text-align: center;
		    margin-left: 10%;
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
	         width: 70%;
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
	          font-size: 3pt;
       }
       
        .grid-container {
			  display: grid;
			  grid-column-gap: 50px;
			  grid-row-gap: 50px;
			  background-color: none;
			  grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	 		  grid-template-rows: 1fr 1fr 1fr;
	 		  margin: 0 auto;
	 		  box-sizing : border-box;
	 	      padding: 2rem 2rem;
		}
		
		.grid-item-text {
			float: left;
			position: relative;
		}
        
		.grid-item-img * {
			  width: 100%;
			  bottom: 0%;
			  display: block;
			  margin: 0;
		}

        .button {
            cursor: pointer;
        }
		
		a, a:visited, a:hover, a:active { /* 클릭 후에도 색상 변경 없도록 함  */
 	 		color: inherit;
		}
		
        .product-list {
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
   
</style>


<%-- 인덱스 시작 --%>

 <!-- 아이템 카테고리 -->
 
    <div class="all-List-page">
 
    <ul class="item-category">
        <li><a href="#"><img src="images/2022컬렉션.jpg"><span class="category-font">2022년 컬렉션</span></a></li>
        <li><a href="#"><img src="images/셀리컬렉션.jpg"><span class="category-font">전체보기</span></a></li>
        <li><a href="#"><img src="images/베스트셀러.jpg"><span class="category-font">베스트셀러</span></a></li>
        <li><a href="#"><img src="images/클래식디자인.jpg"><span class="category-font">클래식디자인</span></a></li>
        <li><a href="#"><img src="images/선물추천.jpg"><span class="category-font">선물추천</span></a></li>
        <li><a href="#"><img src="images/틴트렌즈.jpg"><span class="category-font">틴트렌즈</span></a></li>
        <li class="item-category-next">
            <a class="category-link" href="#"><i class="fa-solid fa-circle-chevron-right"></i></a>
        </li>
    </ul>
    <br><br>

    <!-- 상품 타이틀과 필터 -->
    <div class="title" style="padding: 2rem 2.5rem;">
    	<div class="product-title" style ="display: inline-block;">  		
	        <span>선글라스/</span>
	        <span>전체보기</span>
	        <span>(304)</span>
        </div>
        <div class="product-filter" style="float:right">
	        <!-- <span class="col-filter"><i class="fa-solid fa-grid-4"></i><a class="filter" href="#">간략보기</a></span> -->
	        <span class="col-filter"><i class="fa-solid fa-grid-4"></i><a class="filter" href="#">사단보기</a></span>
	        <span class="item-filter"><i class="fa-solid fa-bars-sort"></i><a class="filter" href="#">필터</a></span>
        </div>
    </div>
    <br> 

    <!-- 상품목록 -->
    <div class="grid-container">
    	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/릴리트01(Y).jpg" ></a></div>
	  	</div>
		
		<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/디디온GRC1.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/디디온VC1.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/로지YC5.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/론디01(V).jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/르IBG1.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/르Ic1.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/르Iv1.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/르P1.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/밀IC1.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/밀Y2.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/크렐라01.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/크렐라S3.jpg" ></a></div>
	  	</div>
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/탐부W1.jpg" ></a></div>
	  	</div>	
	  	
	  	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/프리다BRC1.jpg" ></a></div>
	  	</div>	
	  	
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

<jsp:include page="footer.jsp" />