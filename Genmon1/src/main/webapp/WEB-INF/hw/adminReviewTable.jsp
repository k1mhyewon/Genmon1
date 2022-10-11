<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/adminSidebar.jsp" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet" href="../css/bootstrap-datepicker.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
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
.under:hover{
	text-decoration:underline;
	cursor: pointer;
}
</style>
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datepicker.js" type="text/javascript"></script>
<script  type="text/javascript">

let type;
$(document).ready(function () {
	
 	
 	/* 행호버효과 */
 	$(document).on("mouseover", "tr.tr_data", function(){
 		//$(this).children().addClass('MYhover');
    	//$(this).children().siblings().addClass('MYhover');
    	// alert($(this).html());
    	// $(this).css({'color':'blue', 'background-color':'red'});
 		$(this).children('td').css({'background-color':'#f4f4f4'});
    });  
    $(document).on("mouseout", "tr.tr_data", function(){
    	// $(this).children().removeClass('MYhover');
    	// $(this).children().siblings().removeClass('MYhover');
    	$(this).children('td').css({'background-color':'#fff'});
    });   
	/* 행호버효과 */

    
 	
 	
 	
 	// 문서가 로딩되자마자 전체 목록이 보여져야 하므로 
 	$("a#all").addClass("active");
 	displayTypeTab("전체");
 	
 	
 	// ----탭분류를 클릭했을때----- 
 	$("a.nav-link").click(function(){
 		$("a").removeClass("active");
 		$(this).addClass("active");
 		$("tbody#contactList").html("");
 		type = $(this).text();
 		// alert(ctype);
 		
 		// 목록불러오는 함수 
 		displayTypeTab(type);
 	});
 	// ----탭분류를 클릭했을때----- 
 	
 	
 	 // 제품번호의 모든 체크박스가 체크가 되었다가 그 중 하나만 이라도 체크를 해제하면 전체선택 체크박스에도 체크를 해제하도록 한다.
      $(".chkbox").click(function(){
         var bFlag = false;
         $(".chkbox").each(function(){
            var bChecked = $(this).prop("checked");
            if(!bChecked) { // 체크해제했다면 
               $("#allCheckOrNone").prop("checked",false);
               bFlag = true;
               return false;
            }
         });
         if(!bFlag) {
            $("#allCheckOrNone").prop("checked",true);
         }
      });
 	
 	
 	
 	
 	
 	
 	
 	$(document).on("click", ".under", function(e){
 		const orderDetailId = $(this).parent().children(".orderDetailId").text();
		goAnswerForm(orderDetailId, type);
 	});
	
});
		 
	// 모두 체크되는 체크박스가 체크되었을떄 모두 체크되고 체크해제되면 모두 체크해제되도록  
	function allCheckBox() {
	    var bool = $("#allCheckOrNone").is(":checked");
	    /*
	       $("#allCheckOrNone").is(":checked"); 은
	         선택자 $("#allCheckOrNone") 이 체크되어지면 true를 나타내고,
	         선택자 $("#allCheckOrNone") 이 체크가 해제되어지면 false를 나타내어주는 것이다.
	    */
	    $(".chkbox").prop("checked", bool);
	 }// end of function allCheckBox()-------------------------
	
	
	// === 답변폼창 나오기 === //
	function goAnswerForm(orderDetailId, type){
		
		const url = "<%= request.getContextPath()%>/admin/adminReplyAnswer.sun?orderDetailId="+orderDetailId+"&type="+type;
		
		// 너비 800, 높이 600 인 팝업창을 화면 가운데 위치시키기
		const pop_width = 800;
		const pop_height = 650;
		const pop_left = 500; /* 정수로만듦 */
		const pop_top = 50;/* 정수로만듦 */
		
						// 팝업창이름(아무것도안써도상관없음)
		window.open(url, "goAnswerForm",
				   	"left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
						
	}// end of function goAnswerForm(ctid){}----
	

	
	
	
	// 선택한 탭에 따른 다른 타입 나오기 
	function displayTypeTab(type){
		$.ajax({
			url:"<%= request.getContextPath()%>/admin/reviewDisplayJSON.sun",
			data:{"type":type},
			dataType:"JSON",
			success:function(json){
				let html = "";
				if(json.length == 0){// 글이 없는경우.
					
					html += "등록된 리뷰가 없습니다.";
				
				}
				else if( json.length > 0 ){ // 데이터가 존재하는 경우   
					
					$.each(json, function(index, item){  // each 는 파라미터가 2개 ( index, item )
						let content = item.content.substr(0,20)+"...";
						html += '<tr scope="row" class="tr_data">'+
									'<td scope="row" >'+
										'<label class="control control--checkbox">'+
											'<input type="checkbox" class="chkbox">'+
											'<div class="control__indicator"><i class="fa fa-check" style="color:#fff; font-size: 8pt; display: block;"></i></div>'+
										'</label>'+
									'</td>'+
									'<td class="under orderDetailId">'+item.orderDetailId+'</td>'+
									'<td>'+
//										'<p class="fw-bold mb-1">'+item.name+'</p>'+
										'<p class="text-muted mb-0" style="font-weight:normal;">'+item.userid+'</p>'+
									'</td>'+
									'<td class="under" >'+
										'<p class=" text-muted mb-0">'+item.content.substr(0,20)+'</p>'+
									'</td>'+
									'<td>'+item.uploaddate+'</td>'+
									'<td>&nbsp;<p href="#" style="display: inline-block"><i class="fas fa-envelope-square"></i></p>&nbsp;&nbsp;'+
										'<a href="#" style="display: inline-block; color: #dc3545;"><i class="fas fa fa-close"></i></a></td>'+
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
		
	}

	
</script>
<%-- 인덱스 시작 --%>



 <body style="background: #f4f4f4;">   
<section class="py-4 px-2 " style="width:90%; margin:0 auto; ">
 
 &nbsp;&nbsp; <h3 style="color:#404040; font-size: 16pt; font-weight: bolder; margin: 0 0 3% 10%;">Contact</h3> 
<!-- Tabs navs -->
<ul class="nav nav-tabs mb-5" id="ex1" role="tablist" style="margin:auto;">
  <li class="nav-item" role="presentation">
    <a class="nav-link active" id="all tab-1" aria-controls="tabs-1" href="#tabs-1" role="tab">전체</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="product tab-2" aria-controls="tabs-2" href="#tabs-2" role="tab">미답변</a
    >
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="delivery tab-3" aria-controls="tabs-3" href="#tabs-3" role="tab" >답변</a
    >
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
    <!-- 전체문의 -->
  </div>
  <div class="tab-pane fade" id="tabs-2" role="tabpanel" aria-labelledby="tab-2">
    <!-- 상품문의 -->
  </div>
  <div class="tab-pane fade" id="tabs-3" role="tabpanel" aria-labelledby="tab-3">
    <!-- 배송문의 -->
  </div>
</div> 
<!-- Tabs content -->




    
    <!-- 테이블필터 -->

    <div class="table-responsive custom-table-responsive" style="width:80%; margin:auto;">
    	<!-- <h3 style="color:#212121; font-size: 15pt; font-weight: normal;">Q&A</h3> -->
	    	<div class="input-group mb-4">
			  <input type="text" class="form-control" id="advanced-search-input" placeholder="검색하고 싶은 회원의 전화번호,이메일,이름을 입력해주세요." />
			  <button class="btn btn-primary" id="advanced-search-button" type="button" style="border:none; background-color: #45494c">
			    <i class="fa fa-search"></i>
			  </button>
			</div>

		<table class="table custom-table ">
		<thead>
			<tr style="overflow: hidden; color:#212121;" class="fixed">
				<th scope="col">
				<label class="control control--checkbox">
					<input type="checkbox" class="js-check-all chkbox" id="allCheckOrNone">
					<div class="control__indicator"><i class="fa fa-check" style="color:#f4f4f4; font-size: 8pt; display: block;"></i></div>
				</label>
				</th>
				<th scope="col">no</th>
				<th scope="col">Userid</th>
				<th scope="col">Contents</th>
				<th scope="col">Date</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody id="contactList"></tbody>
		</table>
</div>
</section>



  
</body>
<script>

</script>

<%-- 인덱스 끝 --%>

