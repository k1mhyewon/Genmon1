<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<jsp:include page="<%= ctxPath%>/common/adminSidebar.jsp" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/modules/b4bca5d779777cff9d5c51553952a0a1.min.css" >
<link rel="stylesheet" href="<%= ctxPath%>/css/bootstrap.min.css" type="text/css">
<!-- Style -->
  <link rel="stylesheet" href="../css/style.css">
<style>
.form-outline {
    position: relative;
}
.form-outline .form-control~.form-label {
    /* position: absolute; */
    top: 0;
    max-width: 90%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    left: 0.75rem;
    padding-top: 0.37rem;
    pointer-events: none;
    transform-origin: 0 0;
    transition: all .2s ease-out;
    color: rgba(0,0,0,.6);
    margin-bottom: 0;
}
.form-outline .form-control~.form-notch {
    display: flex;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    max-width: 100%;
    height: 100%;
    text-align: left;
    pointer-events: none;
}
.btn-group-sm>.btn, .btn-sm {
	padding: -.3125rem 1rem -.3125rem;
    line-height: 1.5;
}



.custom-table tbody tr.active {
    opacity: .4;
}


.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #495057;
    background-color: transparent; 
    border-color: transparent transparent #6eacef transparent;
	border-bottom-width: 2px;
}
a.nav-link{
 color: #495057;
}
.nav-tabs{
}



/* 테이블 */
    
.custom-table thead tr, .custom-table thead th {
	border-top: none;
	border-bottom: none!important;
}
.table thead tr th {
    /* vertical-align: bottom; */
    border-bottom: 2px solid #dee2e6;
    font-weight: normal;
    color:#5c5c5c;
}
.control {
    display: block;
    position: relative;
    margin-bottom: 25px;
    cursor: pointer;
    font-size: 18px;
}
.custom-table tbody tr th:last-child, .custom-table tbody tr td:last-child {
    border-top-right-radius: 7px;
    border-bottom-right-radius: 7px;
}
.custom-table tbody tr th:first-child, .custom-table tbody tr td:first-child {
    border-top-left-radius: 7px;
    border-bottom-left-radius: 7px;
}
.custom-table tbody tr th, .custom-table tbody tr td {
    background-color: #fff;
    border: none;
}

.custom-table tbody th, .custom-table tbody td {
    color: #777;
     font-weight: 400; 
    padding-bottom: 15px;
    padding-top: 15px;
    /* font-weight: 300; */
}
.custom-table tbody td small, .custom-table tbody tr td:nth-child(5), .custom-table tbody tr td:nth-child(2), .custom-table tbody tr td:nth-child(3){
	color: #777;
    /* font-weight: 400; */
	/* font-weight: 300; */
}
.custom-table tbody td a{
	color: #777;
}
.custom-table tbody tr.spacer td {
    padding: 0 !important;
    height: 10px;
    border-radius: 0 !important;
    background: transparent !important;
}

.control input {
    position: absolute;
    z-index: -1;
    opacity: 0;
}
.control--checkbox .control__indicator:after {
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -52%);
    -ms-transform: translate(-50%, -52%);
    transform: translate(-50%, -52%);
}
.control__indicator:after {
    font-family: 'icomoon';
    content: '\e5ca';
    position: absolute;
    display: none;
}
.control input:checked ~ .control__indicator {
    border: 2px solid #007bff;
    background: #007bff;
}
.control__indicator {
    position: absolute;
    top: 7px;
    left: 0;
    height: 15px;
    width: 15px;
    border-radius: 3px;
    border: 2px solid #ccc;
    background: transparent;
}
.custom-table tbody tr th:before, .custom-table tbody tr th:after, .custom-table tbody tr td:before, .custom-table tbody tr td:after {
    -webkit-transition: .3s all ease;
    -o-transition: .3s all ease;
    transition: .3s all ease;
    content: "";
    left: 0;
    right: 0;
    position: absolute;
    height: 1px;
    background: #007bff;
    width: 100%;
    opacity: 0;
    visibility: hidden;
}
/* 테이블 끝*/

p{
	font-weight: 350;
}
th{
	font-weight: 300;
}
thover{
    background-color: #f4f4f4;
    border: none;
    cursor: pointer;
}
.fa, .fas {
    font-weight: 550;
}
tr.addPrd:hover{
	cursor: pointer;
}

a{
	opacity: .5; 
}
a:hover{
	opacity: 1; 
}

</style>
<script src="../js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script  type="text/javascript">
$(document).ready(function () {
	
	/* 행호버효과 */
	$("tr[scope='row']>td").hover(function() {
		/* $(this).addclass('thover'); */
		$(this).css('background-color','transparent');
		$(this).siblings().css('background-color','transparent');
	},function(){
		$(this).css('background-color','#fff');
		$(this).siblings().css('background-color','#fff');
		
	});
	
 	$("tr.addPrd").click(function() {
 		goAddProduct();
 	});

 	$("tr[scope='row']").click(function() {
 		if(!$(this).hasClass("addPrd")){
	 		goEditProduct();
 		}
	});
 
 	
 	const searchButton = document.getElementById('search-button');
 	const searchInput = document.getElementById('search-input');
 	
 	searchButton.addEventListener('click', () => {
 	  const inputValue = searchInput.value;
 	  alert(inputValue);
 	});
 	
});// end of $(document).ready(function () {}--------------------------
		
	// === 제품 수정하기 === //
	function goEditProduct(){

		const url = "<%= request.getContextPath()%>/jieun/manager_editProduct.jsp";
		
		// 너비 800, 높이 600 인 팝업창을 화면 가운데 위치시키기
		const pop_width = 800;
		const pop_height = 600;
		const pop_left = Math.ceil((window.screen.width - pop_width)/2); /* 정수로만듦 */
		const pop_top = Math.ceil((window.screen.height - pop_height)/2);/* 정수로만듦 */

		window.open(url, "goEditProduct",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
						
	}// end of function function goAnswerForm(){}
	
	// === 제품 추가하기 === //
	function goAddProduct(){

		const url = "<%= request.getContextPath()%>/jieun/manager_addProduct.jsp";
		
		// 너비 800, 높이 600 인 팝업창을 화면 가운데 위치시키기
		const pop_width = 800;
		const pop_height = 600;
		const pop_left = Math.ceil((window.screen.width - pop_width)/2); /* 정수로만듦 */
		const pop_top = Math.ceil((window.screen.height - pop_height)/2);/* 정수로만듦 */
		
						// 팝업창이름(아무것도안써도상관없음)
		window.open(url, "goAddProduct",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
						
	}// end of function function goAnswerForm(){}
	
</script>
<%-- 인덱스 시작 --%>



 <body style="background: #f4f4f4;">   
<section class="py-4 px-2 " style="width:95%; margin:0 auto; ">
 
 &nbsp;&nbsp; <h3 style="color:#404040; font-size: 16pt; font-weight: bolder; margin: 0 0 5% 10%;">Product</h3> 


    <div class="table-responsive custom-table-responsive" style="width:80%; margin:auto;">
		<table class="table custom-table datatable ">
		<thead>
			<tr style="overflow: hidden; color:#212121;" class="fixed">
				<th scope="col">
				<label class="control control--checkbox">
					<input type="checkbox" class="js-check-all">
					<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
				</th>
				<th scope="col" style="margin-left: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Image</th>
				<th scope="col">Name</th>
				<th scope="col">Product Code</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price(₩)</th>
				<th scope="col">Total Sales</th>
				<th scope="col">Status</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
		<tr scope="row" class="hover addPrd">
			<td colspan="100"><p href="#" style="display:inline-block; margin: 0 auto; padding-left: 50%;">
								<i class="fas icon-plus" style="margin: auto;"></i></p></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td >
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px; border-radius: 2;"
              class="rounded-circle"
              />
				</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-primary rounded-pill d-inline">Enable</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">Yel</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-warning rounded-pill d-inline">Disenable</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-success rounded-pill d-inline">Waiting</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-success rounded-pill d-inline">Waiting</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-primary rounded-pill d-inline">Enable</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-success rounded-pill d-inline">Waiting</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-primary rounded-pill d-inline">Enable</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-primary rounded-pill d-inline">Enable</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-primary rounded-pill d-inline">Enable</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-warning rounded-pill d-inline">Disenable</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		<tr scope="row" class="hover">
			<th scope="row">
				<label class="control control--checkbox">
				<input type="checkbox">
				<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
			</th>
			<td>
				<img
              src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_LILIT_01_Y_1_4.jpg"
              alt=""
              style="width: 60px; height: 60px; margin-left: 20px;"
              class="rounded-circle"
              />
			</td>
			<td>
			 <p class="fw-bold mb-1">릴리트 01</p>
             <!-- <p class="text-muted mb-0">john.doe@gmail.com</p> -->
			</td>
			<td>
				<p class="fw-normal mb-1">RILE-YEL</p>
        		<!-- <p class="text-muted mb-0">배송 언제시작할까요?</p> -->
			</td>
			<td>232</td>
			<td>259,000</td>
			<td>19</td>
			<td><span class="badge badge-success rounded-pill d-inline">Waiting</span></td>
			<td>&nbsp;<a href="#" style="display: inline-block;color:#4e4e4e;"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;
			<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>
		</tr>
		<tr class="spacer"><td colspan="100"></td></tr>
		</tbody>
		</table>
</div>
</section>



  
</body>

<%-- 인덱스 끝 --%>

