<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<link rel="stylesheet" type="text/css" href="productFilter.css">

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
       
       .category-link {
       		padding: 0%;
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
	 	     /*  opacity: 30%; */
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
		
		.grid-item-name {
			font-size: 10pt;
			font-weight: bold;
		}
		
		.grid-item-price {
			display: block;
			font-size: 8pt;
		}
		
		.grid-item-color {
			font-size: 8pt;
		}

		.item-wish-btn {
			border:none;
			float: right;
			
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
       		text-align: center;
        }
   
   		.filter-row {
 			box-sizing: border-box;
		}
		
		/* Create four equal columns that floats next to each other */
		.filter-column {
			float: left;
			width: 25%;
			padding: 0 2%;
			height: auto;
			border: 1px gray solid;
		  
		}
		
		/* Clear floats after the columns */
		.filter-row:after {
		  content: "";
		  display: table;
		  clear: both;
		}
	
</style>

<script type="text/javascript">

</script>


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
    <div class="title" style="padding: 0 2.5rem; margin-bottom:none; ">
    	<div class="product-title" style ="display: inline-block;">  		
	        <span>선글라스/</span>
	        <span>전체보기</span>
	        <span>(304)</span>
        </div>
        <div class="product-filter" style="float:right">
	        <button type="button" class="btn btn-default dropdown-toggle" id="item-short" data-bs-toggle="dropdown">필터</button>
	        <!--  <button id="item-col"><i class="fa-solid fa-grid-4">4단보기</i></button> -->
		    <button type="button" class="btn btn-default dropdown-toggle"  id="item-filter"  data-bs-toggle="dropdown">
		    <i class="fa-solid fa-bars-sort">필터</i></button>
		    <ul class="dropdown-menu">
		      <li><h5 class="dropdown-header">프레임컬러</h5></li>
		      <li><label><input type="radio"/>화이트</label></li>
		      <li><label><input type="radio"/>핑크</label></li>
		      <li><label><input type="radio"/>레드</label></li>
		      <li><label><input type="radio"/>클리어</label></li>
		      <li><label><input type="radio"/>골드</label></li>
		      <li><label><input type="radio"/>실버</label></li>
		      <li><label><input type="radio"/>기타</label></li>
		      
		      <li><h5 class="dropdown-header">렌즈컬러</h5></li>
		      <li><label><input type="radio"/>화이트</label></li>
		      <li><label><input type="radio"/>핑크</label></li>
		      <li><label><input type="radio"/>레드</label></li>
		      <li><label><input type="radio"/>클리어</label></li>
		      <li><label><input type="radio"/>골드</label></li>
		      <li><label><input type="radio"/>실버</label></li>
		      <li><label><input type="radio"/>기타</label></li>
		      
		      <li><h5 class="dropdown-header">소재</h5></li>
		      <li><label><input type="radio"/>아세테이트</label></li>
		      <li><label><input type="radio"/>메탈</label></li>
		      <li><label><input type="radio"/>콤비</label></li>
		      
		      <li><h5 class="dropdown-header">정렬</h5></li>
		      <li><label><input type="radio"/>신상품순</label></li>
		      <li><label><input type="radio"/>낮은가격순</label></li>
		      <li><label><input type="radio"/>높은가격순</label></li>
		    </ul>
		  </div>
  		 </div>
   	 <br> 
    

    <!-- 상품목록 -->
    <div class="grid-container">
    	<div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/릴리트01(Y).jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" onclick=""><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
		 <div class="grid-info">
		 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/디디온GRC1.jpg" ></a></div>
		  			<div class="grid-item-text" style="inline-block">
		  				<a href="#" class="product">
			 		 		<span class="grid-item-name">릴리트 01</span>
			 		 		<span class="grid-item-price">270,000원</span>
			 		 		<span class="grid-item-color"> +5 Colors</span>
		 		 		</a>
					 </div>
					 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
				</div>	
	  	
	 <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/디디온VC1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
			
	 <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/로지YC5.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
			
	  	
	 <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/론디01(V).jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/르IBG1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>				
			
	  	
	 <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/르Ic1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/르Iv1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
	  	
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/르P1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	 
			
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/밀IC1.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
	  	
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/밀Y2.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
			
			
	  	
	  <div class="grid-info">
	 		<div class="grid-item-img"><a href="#" class="product"><img src="images/전체보기/크렐라01.jpg" ></a></div>
	  			<div class="grid-item-text" style="inline-block">
	  				<a href="#" class="product">
		 		 		<span class="grid-item-name">릴리트 01</span>
		 		 		<span class="grid-item-price">270,000원</span>
		 		 		<span class="grid-item-color"> +5 Colors</span>
	 		 		</a>
				 </div>
				 <button class="item-wish-btn" style="border:none;"><i class="fa-regular fa-heart" ></i></button>
			</div>	
	</div>

</div>

	
	
<%-- 인덱스 끝 --%>

<jsp:include page="footer.jsp" />