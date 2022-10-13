<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String ctxPath = request.getContextPath(); %>
<jsp:include page="../common/adminSidebar.jsp" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/modules/b4bca5d779777cff9d5c51553952a0a1.min.css" >
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
<!-- Style -->
  <link rel="stylesheet" href="<%= ctxPath%>/css/style.css">
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

.fa:hover{
	cursor:pointer;
}

tr.spacer > td {
	height: 50px;
}


</style>
<script src="<%= ctxPath%>/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
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

 	/* $("tr[scope='row']").click(function() {
 		if(!$(this).hasClass("addPrd")){
	 		goEditProduct();
 		}
	}); */
 
 	
 	const searchButton = document.getElementById('search-button');
 	const searchInput = document.getElementById('search-input');
 	
 	/* searchButton.addEventListener('click', () => {
 	  const inputValue = searchInput.value;
 	  alert(inputValue);
 	}); */

 	
	// *** select 태그에 대한 이벤트는 click이 아닌 change이다. ***//
	// 페이지당 회원명수 선택 함수 생성하기
	$("select#sizePerPage").bind('change',function(){
		goSearch(); 
	});// end of $("select#sizePerPage").bind('change',function()------------------------------
		
			
			
	// === 검색어가 존재할때 검색을 하고 나서도 검색한 기록 남기기 === //
	if("${requestScope.searchWord}" != "") { // 넘겨받은 검색어 값이 ""이 아닌경우
											 // (처음 로딩할때 검색타입이 나올 수 있게 if문 사용)
		$("select#searchType").val("${requestScope.searchType}");
	    $("input#searchWord").val("${requestScope.searchWord}"); 
	}
	
			
	if( ${requestScope.sizePerPage} != null ) { // 문서가 로딩되고 넘겨받은 값이 있다면 넣어라. 
												// 또는 "${requestScope.sizePerPage}" != "" ==> 문자열이기 때문에 null이 아닌 같은 문자열인 ""으로 들어와야한다.
		$("select#sizePerPage").val("${requestScope.sizePerPage}");
		
	}
	
	// === 검색하기위해 엔터를 누르면 === //	
	$("input#searchWord").bind("keyup",(e) =>{
		
		if(e.keyCode == 13) { // 검색어에서 엔터를 치면 검색하러 가도록한다.
			goSearch();
		}
		
	});	// end of $("input#searchWord").bind("keyup"

	
	// === 검색어가 존재할때 검색을 하고 나서도 검색한 기록 남기기 === //
	if("${requestScope.searchWord}" != "") { // 넘겨받은 검색어 값이 ""이 아닌경우
											 // (처음 로딩할때 검색타입이 나올 수 있게 if문 사용)
		$("select#searchType").val("${requestScope.searchType}");
	    $("input#searchWord").val("${requestScope.searchWord}"); 
	}
	
			
	if( ${requestScope.sizePerPage} != null ) { // 문서가 로딩되고 넘겨받은 값이 있다면 넣어라. 
												// 또는 "${requestScope.sizePerPage}" != "" ==> 문자열이기 때문에 null이 아닌 같은 문자열인 ""으로 들어와야한다.
		$("select#sizePerPage").val("${requestScope.sizePerPage}");
		
	}
	
	// === 특정회원을 클릭하면 그 회원의 상세정보를 보여주도록 한다.=== //
      $("tr.memberInfo").click( (e)=>{
         const $target = $(e.target);// 실제 클릭한 곳은 tr이 아닌 td이다.
 		
      // alert($target.parent().html());// tr의미
      
      // 	한사람의 정보가 있는 여러곳을 눌러도 한사람의 정보를 알수 있는 userid값만 출력되게 해야한다.
         const userid = $target.parent().children(".userid").text();
      // alert(userid);
     
         location.href="<%= ctxPath%>/admin/adminMemberOneDetail.sun?userid="+userid +"&goBackURL=${requestScope.goBackURL}" ;  // 한사람에 대한 상세정보를 보여주는 페이지
         // 																	  &goBackURL= 은  /admin/adminMemberOneDetail.sun?sizePerPage=10&currentShowPageNo=10&searchType=name&searchWord=정
      	// &은 데이터 구분자이다. goBackURL은 &앞까지만 잡아온다.
      	// 																		  &goBackURL=/admin/adminMemberOneDetail.sun?sizePerPage=10&currentShowPageNo=10 searchType=name searchWord=정
      });
 	
 	
 	
 	
});// end of $(document).ready(function () {}--------------------------
		
//Function Decleration
// === 페이지당 회원명수 선택 함수 생성하기 ===
function goSearch() {
	
	 const frm = document.memberFrm;
	   frm.action = "adminMemberList.sun";  //자기자신으로 넘어간다. 상대경로로 설정
	   frm.method = "GET";
	   frm.submit();
	
} // end of function goSearch()------------------

		
	
	
</script>
<%-- 인덱스 시작 --%>



 <body style="background: #f4f4f4;">   
<section class="py-4 px-2 " style="width:95%; margin:0 auto; ">
 
 &nbsp;&nbsp; <h3 style="color:#404040; font-size: 16pt; font-weight: bolder; margin: 0 0 5% 10%;">Member List</h3> 
		
	<form name="memberFrm">
	    <div class="table-responsive custom-table-responsive" style="width:80%; margin:auto;">
	      
	      <!-- <button type="button" class="btn btn-secondary" onclick="goSearch();" style="margin-right: 30px;">검색</button> -->
	      
	    	<div class="input-group mb-4">
		    	<select id="searchType" name ="searchType" style="border: none; color: gray;">
			    	<option value="name">회원명</option>
			    	<option value="userid">아이디</option>
			    	<option value="email">이메일</option>
		    	</select>
				  <input type="text" name="searchWord" class="form-control" id="searchWord" placeholder="검색하고 싶은 회원의 전화번호,이메일,이름을 입력해주세요." />
				  <%-- form 태그내에서 전송해야할 input 태그가 만약에 1개 밖에 없을 경우에는 유효성검사가 있더라도 
	               유효성 검사를 거치지 않고 막바로 submit()을 하는 경우가 발생한다.
	               이것을 막아주는 방법은 input 태그를 하나 더 만들어 주면 된다. 
	               그래서 아래와 같이 style="display: none;" 해서 1개 더 만든 것이다. 
	       			--%>
			      <input type="text" style="display: none;" id="searchWord"/> <%-- 조심할 것은 type="hidden" 이 아니다. --%> 
				  <button class="btn" id="advanced-search-button" onclick="goSearch();" type="button" style="border:none; ">
				    <i class="fa fa-search"></i>
				  </button>
				  
	      
			</div>
				    
	    
			<table class="table custom-table datatable ">
			<thead>
				<tr style="overflow: hidden; color:#212121;" class="fixed">
					<th scope="col" >
						<label class="control control--checkbox mr-3" >
							<input type="checkbox">
							<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
						</label>
					</th>
					<th scope="col" class= "col-md-2" name="userid">ID</th> 
					<th scope="col" class= "col-md-2" name="name">Name</th>
					<th scope="col" class= "col-md-3" name="email">Email</th> 
					<th scope="col" class= "col-md-2" name="gender">Gender</th>
					<th scope="col" class= "col-md-1" name="age">age</th>
					<th scope="col" >
						<nav>
						 	<span style="display:flex; ">
								<select id="sizePerPage" name="sizePerPage" style="border: none; background-color:#f4f4f4; ">
							       <ul class="pagination" >${requestScope.sizePerPage}</ul>
							        <option value="5">5</option>
							       <option value="10">10</option>
							       <option value="20">20</option>
							       <option value="30">30</option>
							    </select>
						 	</span>
				 		</nav> 
			 		</th>
				</tr>
				
				
			</thead>
			<tbody>
		
			<tr class="spacer"><td colspan="100"></td></tr>
			
	 		<c:forEach var="mvo" items="${requestScope.memberList}">
				
				<tr class="spacer"><td colspan="100"></td></tr>
				
				<tr scope="row" class="hover memberInfo" >
					<th scope="row">
						<label class="control control--checkbox">
							<input type="checkbox">
							<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
						</label>
					</th>
	    			<td><p class="fw-bold mb-1">${mvo.userid}</p></td>
	    			<td>${mvo.name}</td>
	    			<td>${mvo.email}</td>
	    			<td>
	    				<c:choose>
		    				<c:when test="${mvo.gender eq '1'}">남</c:when>
		    				<c:otherwise>여</c:otherwise>
	    				</c:choose>
	    			</td>
	    			
	    			<td>${requestScope.mvo.age}</td> <%-- 나이에서 오류 남 원래mvo.age임 --%>
	    				
	    			<td>
		   				<c:choose>
		   					<c:when test="${cpvo.panmaestate eq '0'}"><span class="badge badge-warning rounded-pill d-inline">Disenable</span></c:when>
		   					<c:when test="${cpvo.panmaestate eq '1'}"><span class="badge badge-primary rounded-pill d-inline">Enable</span></c:when>
		   					<c:when test="${cpvo.panmaestate eq '2'}"><span class="badge badge-success rounded-pill d-inline">Waiting</span></c:when>
		   					<%-- <c:otherwise><span class="badge badge-success rounded-pill d-inline">Waiting</span></c:otherwise> --%>
		   				</c:choose>
	    			</td> 
					
	    		</tr>
	    	</c:forEach> 
	    	
	    
	
			</tbody>
			</table>
			
			<%-- 페이지바 시작 --%>
			<nav class="my-5">
				<div style="display: flex; width: 80%;">
					<ul class="pagination" style="margin: auto">${requestScope.pageBar}</ul>
				 </div>
			  </nav>
			<%-- 페이지바 끝 --%>
		</div>
	</form>
</section>
  
</body>







<%-- 인덱스 끝 --%>

