<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat(" yyyy년MM월dd일  a hh:mm:ss");
%>
<% String ctxPath = request.getContextPath(); %>

    
<jsp:include page="../common/adminSidebar.jsp" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 폰트 -->
<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">

<link rel="stylesheet" href="../css/bootstrap-datepicker.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<!-- Style -->
  <link rel="stylesheet" href="../css/style.css">
<style>

* {font-family: 'Pretendard', sans-serif; !important}

.form-outline {
    position: relative;
}
.form-outline .form-control~.form-label {
    /* position: absolute; */
    top: 0;
    max-width: 50%;
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
.nav {
	padding-left: 100px;
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
    color:#161616;
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
.custom-table tbody tr td , .custom-table tbody tr th {
    background-color: #fff;
    border: none;
}

.custom-table tbody th, .custom-table tbody td {
    color: #777;
     font-weight: 400; 
    padding-bottom: 20px;
    padding-top: 20px;
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
.table td > p {
    padding-top: 0;
    margin: auto;
}

.link_tag{
		font-size: 10pt;
		color: gray;
		text-decoration: underline;
		cursor: pointer;
	}
	
</style>
<script src="../../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="../../js/bootstrap-datepicker.js" type="text/javascript"></script>
<script  type="text/javascript">
$(document).ready(function () {
	
 	
 	/* 행호버효과 */
 	$(document).on("mouseover", "tr.tr_data", function(){
 		//$(this).children().addClass('MYhover');
    	//$(this).children().siblings().addClass('MYhover');
    	// alert($(this).html());
    	// $(this).css({'color':'blue', 'background-color':'red'});
 		$(this).children('td').css({'background-color':'#f4f4f4'});
 		$(this).css({'cursor':'pointer'});
    });  
    $(document).on("mouseout", "tr.tr_data", function(){
    	// $(this).children().removeClass('MYhover');
    	// $(this).children().siblings().removeClass('MYhover');
    	$(this).children('td').css({'background-color':'#fff'});
    });   
	/* 행호버효과 */

    
 	 
 	// 문서가 로딩되자마자 전체 목록이 보여져야 하므로 
 	// $("a#all").addClass("active");
 	// displayTypeTab("전체");
 	dislayOrderTab('주문');
 	
 	
 	// ----탭분류를 클릭했을때----- 
 	$("a.nav-link").click(function(){
 		$("a").removeClass("active");
 		$(this).addClass("active");
 		$("tbody#contactList").html("");
 		const ctype = $(this).text();
 		// alert(ctype);
 		
 		// 목록불러오는 함수 
 		
 		dislayOrderTab(ctype);
 		
 		
 	});
 	// ----탭분류를 클릭했을때----- 
 	
 	
 	
 	
}); // end of ready

	
	// 각 행을 클릭하면 주문 상세로 보여주는 이벤트
	function goPopUp(classname, status, orderid){
		
		// classname == 주문(입금대기, 결제완료,배송완료)
		// 주문완료 (구매확정) // 취소 (미입금취소, 주문취소, 주문취소 환불완료)
		// 환불(환불신청,환불수거완료,환불완료)
		
		//alert(classname);
		//alert(status);
		//alert(orderid);
		
		//팝업창을 화면 가운데 위치시키기
		const pop_width = 600;
		const pop_height = 800;
		const pop_left = Math.ceil((window.screen.width-pop_width)/2);
		const pop_top = Math.ceil((window.screen.height-pop_height)/2);
		
		
		if(classname == '주문' || classname == '주문완료'){
			
			window.open("<%=ctxPath%>/admin/adminOrderDetail.sun?orderid="+orderid , "MyPopup" // 팝업창 안에 들어갈 내용물 // 직접쓰던가 파일네임
		            , "left="+pop_left+"px, top="+pop_top+"px, width="+pop_width+"px, height="+pop_height+"px"); 
			
		} else if(classname == '취소'){
			window.open("<%=ctxPath%>/admin/adminCancleDetail.sun?orderid="+orderid , "MyPopup" // 팝업창 안에 들어갈 내용물 // 직접쓰던가 파일네임
		            , "left="+pop_left+"px, top="+pop_top+"px, width="+pop_width+"px, height="+pop_height+"px"); 
			
		} else if(classname == '환불'){
			window.open("<%=ctxPath%>/admin/adminRefundDetail.sun?orderid="+orderid , "MyPopup" // 팝업창 안에 들어갈 내용물 // 직접쓰던가 파일네임
		            , "left="+pop_left+"px, top="+pop_top+"px, width="+pop_width+"px, height="+pop_height+"px"); 
		} 
		
	} // end of각 행을 클릭하면 주문 상세로 보여주는 이벤트




		 
	
	// 주문 탭 눌렀을때
	function dislayOrderTab(ctype){
		$.ajax({
			url:"<%= request.getContextPath()%>/admin/adminOrderManageJSON.sun",
			data:{"ctype":ctype
			},
			dataType:"JSON",
			success:function(json){
//				console.log(json);
// 				console.log(typeof json); // object     ** json의 타입은 object(객체)모양임 
				let html = "";
				if(json.length == 0){// 글이 없는경우.
					// !!! 주의 !!!
	                // if(json == null) 이 아님!!!
	                // if(json.length == 0) 으로 해야함!!
					html += "조회내역이 없습니다.";
				
					// $("div#displayHIT").html(html);
				}
				else if( json.length > 0 ){ // 데이터가 존재하는 경우   
					
					$.each(json, function(index, item){  // each 는 파라미터가 2개 ( index, item )
						html += '<tr scope="row" class="tr_data" onclick="goPopUp(\''+item.classname+'\',\''+item.status+'\',\''+item.orderid+'\')">'+
									'<td  style="padding-left: 20px;"> '+item.classname+'</td>'+
									'<td>'+item.status+'</td>'+
									'<td>'+
//										'<p class="fw-bold mb-1">'+item.name+'</p>'+
										'<p class="text-muted mb-0" style="font-weight:normal;">'+item.orderid+'</p>'+
									'</td>'+
									'<td>'+item.order_detail_id+'</td>'+
									'<td >'+
										'<p class="fw-normal mb-1" style="font-weight:bold;">'+item.name+'</p>'+
										'<p class=" text-muted mb-0">'+'</p>'+
									'</td>'+
									'<td>'+item.pname+'</td>'+
									'<td>'+item.date+'</td>'+
								'</tr>'+
								'<tr class="spacer"><td colspan="100"></td></tr>';
								
					});// end of $.each -------------------------
					$("tbody#contactList").html(html); 
				}				
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	}// 주문 탭 눌렀을때
	
	
	
	// 배송지 일괄등록페이지로 넘어가기
	function click_event(){
		location.href = "<%=ctxPath%>/admin/adminRegisterTracking.sun";
	}
	
</script>
<%-- 인덱스 시작 --%>



 <body style="background: #f4f4f4;">   
<section class="py-4 px-2 " style="width:90%; margin:0 auto; ">
 
 &nbsp;&nbsp; <h3 style="color:#404040; font-size: 16pt; font-weight: bolder; margin: 0 0 3% 6%;">Order</h3> 
<!-- Tabs navs -->
<ul class="nav nav-tabs mb-5" id="ex1" role="tablist" style="margin:auto;">
  <li class="nav-item" role="presentation">
    <a class="nav-link active" id="all tab-1" aria-controls="tabs-1" href="#tabs-1" role="tab">주문</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="product tab-2" aria-controls="tabs-2" href="#tabs-2" role="tab">취소</a
    >
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="delivery tab-3" aria-controls="tabs-3" href="#tabs-3" role="tab" >환불</a
    >
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="refund tab-4" aria-controls="tabs-4" href="#tabs-4" role="tab">완료</a>
  </li>
</ul>
<!-- Tabs navs -->

<!-- Tabs content -->
<div class="tab-content" id="ex1-content">
  <div
    class="tab-pane fade show active"
    id="tabs-1"
    role="tabpanel"
    aria-labelledby="tab-1"
  >
    <!-- 주문 -->
  </div>
  <div class="tab-pane fade" id="tabs-2" role="tabpanel" aria-labelledby="tab-2">
    <!-- 취소 -->
  </div>
  <div class="tab-pane fade" id="tabs-3" role="tabpanel" aria-labelledby="tab-3">
    <!-- 환불 -->
  </div>
  <div class="tab-pane fade" id="tabs-3" role="tabpanel" aria-labelledby="tab-4">
    <!-- 완료 -->
  </div>
</div> 
<!-- Tabs content -->




    
    <!-- 테이블필터 -->

    <div class="table-responsive custom-table-responsive" style="width:80%; margin:auto;">
    	<!-- <h3 style="color:#212121; font-size: 15pt; font-weight: normal;">Q&A</h3> -->
    		<span class="link_tag" onclick="javascript:window.location.reload()">업데이트 <%= sf.format(nowTime) %></span>
	    	<div class="input-group mb-4 mt-3">
	    	  <button type="button" class="btn btn-dark" id="btn_deli" onclick="click_event()">운송장 일괄등록</button>
	    	  <select class="selectpicker" style="width: 200px; margin-left: 30px; text-indent: 65px; border-radius: 0.3rem;">
			    <option>주문번호</option>
			    <option>주문자명</option>
			  </select>
			  <input type="text" class="form-control" id="advanced-search-input" placeholder="주문번호, 고객명으로 검색가능합니다." />
			  <button class="btn btn-primary" id="advanced-search-button" type="button" style="border:none; background-color: #45494c">
			    <i class="fa fa-search"></i>
			  </button>
			</div>

		<table class="table custom-table ">
		<thead>
			<tr style="overflow: hidden; color:#212121;" class="fixed">
				<th scope="col" style="padding-left: 20px;width: 100px;">Class</th>
				<th scope="col" style="width: 110px;">Status</th>
				<th scope="col">No</th>
				<th scope="col">DetailNo</th>
				<th scope="col" style="width: 100px;">Name</th>
				<th scope="col">Products</th>
				<th scope="col" style="width: 200px;">Date</th>
			</tr>
		</thead>
		<tbody id="contactList"></tbody>
		</table>
</div>
</section>



  
</body>
<script>

</script>

