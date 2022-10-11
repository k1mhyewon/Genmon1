<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat(" yyyy년MM월dd일  a hh:mm:ss");
%>
    
<jsp:include page="../common/adminSidebar.jsp" />

<!-- 폰트 -->
<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">


<style>
	
	* {font-family: 'Pretendard', sans-serif; !important}
	
	table{
		background-color: white;
	}
	
	div#order_nav{
		width: 40%;
		margin: auto;
	}
	
	nav > ul {
	    /* border: solid 1px blue; */
	
	    display: flex;
	    list-style-type: none;
	    padding: 0;
	    height: 90px;
	    position: relative;
	    top: 9px;
	}
	
	nav > ul > li {
	    /* border: solid 1px red; */
	    width: 15%;
	    
	    /* text-align: center; */
	
	    /* 안먹어 그니까 테이블셋이나 플렉스를 조야댐 */
	    /* vertical-align: middle;  */
	    margin: auto;
	}
	
	nav > ul > li > a {
	    /* border: solid 1px green; */
	
	    text-decoration: none;
	    color: black;
	    font-size: 13pt;
	    font-weight: bold;
	    padding: 3%;
	}
	
	nav > ul > li > a:hover{
	    color: gray;
	}
	
	/* 상단바 끝 */
	
	div#container{
		width: 70%;
		margin: 40px auto;
	}
	
	span.boldtxt{
		display: inline-block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	span.puretxt{
		display: block;
		font-size: 10pt;
	}
	
	ul{
		padding-bottom :15px;
		font-size: 10pt;
		list-style-type: none;
	}
	
	label.li_lb{
		width: 100px;
		margin-left: 25px;
	}
	
	label.click:hover{
		cursor: pointer;
		color : gray; 
	}
	
	.link_tag{
		font-size: 10pt;
		color: gray;
		text-decoration: underline;
		cursor: pointer;
	}
	
	select#sort{
		margin-bottom: 20px;
		width: 120px;
		height: 35px;
		border: 1px solid gray;
		font-size: 10pt;
		text-indent: 12px;
		border-radius: 0.4rem;
	}
	
	select#sort:hover{
		cursor: pointer;
	}
	
	input.input_style{
		display :inline-block;
		width: 60%;
		margin-left: 8px;
		height: 35px;
		border: 1px solid gray;
		border-radius: 0.4rem;
		font-size: 10pt;
		text-indent: 30px;
	}
	
	button#btn_tracking_num{
		border-radius: 0.5rem;
		width: 25%;
		height: 40px;
		font-size: 10pt;
		background: black;
		color: white;
		margin : 40px 35% ;
	}
	
	div.box{
		border-radius: 0.5rem;
		border: gray;
		background-color: white;
	}
	
</style>

<script>

	$(document).ready(function(){
		
		
		// 운송장 입력 유효성 검사
		$("input:text.input_style").blur(function(e){
			const $target = $(e.target);
			const regExp = new RegExp(/^[0-9]{10,13}$/g);
			
			const bool = regExp.test($target.val()); // 정규 표현식에 값을 집어넣음
			
			if(!bool){ 
				$target.val('');
				$target.css('border', '1px solid red');
				return;
				
			} else { // 제대로 입력했다면
				// 자동으로 체크
				$target.css('border', '1px solid gray');
				$target.parent().parent().find("input:checkbox").prop('checked',true);
			}
		}); //end of  운송장 입력 유효성 검사
		
		
		
		// 운송장 일괄등록 버튼 클릭이벤트
		$("button#btn_tracking_num").click(function(){
			
			let arr = [];
			let arr2 = [];
			let arr3 = [];
			let arr4 = [];
			
			if ($("input:checked").length > 0) { 

				$("input:checked").each(function () {
					
					const track = $(this).parent().parent().parent().find("input:text.input_style").val();
					
					// console.log(track);
					if(track.length==0){ // 운송장번호가 제대로 들어와 있는지 
						alert('체크한 항목의 운송장 번호가 누락된 부분이 있습니다');
						return;
					}
					
					const company = $(this).parent().parent().parent().find("select").val();
					const orderstatus = $(this).parent().parent().parent().find("input:hidden").val();
					
					var ck_val = $(this).val();
					
					arr.push(ck_val);
					arr2.push(track);
					arr3.push(company);
					arr4.push(orderstatus);
					
				});
				
				const arrjoin = arr.join(",");
				const arrjoin2 = arr2.join(",");
				const arrjoin3 = arr3.join(",");
				const arrjoin4 = arr4.join(",");
				
				$.ajax({
					url : "<%= ctxPath%>/admin/adminRegisterTracking.sun" , 
					type: "POST",  
					data: {"orderidjoin":arrjoin,
							"trackjoin":arrjoin2,
							"companyjoin":arrjoin3,
							"orderstatusjoin":arrjoin4},
							
				    dataType:"text",
				    success:function(json) {
				    	
				    	alert('운송장이 등록되었습니다');
				    	window.location.reload(true);
				    },
				    error: function(request, status, error){
						//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
				
			} else { // 체크박스 선택 안한 경우
				alert('환불상품을 한개 이상 선택하여 주세요.');
				return;
			}// end of 운송장 일괄등록 버튼 클릭이벤트
		});
		
	}); // end of ready

	

</script>

<body style="background: #f4f4f4;">   
<section class="py-4 px-2 " style="width:70%; margin:0 auto; ">
 
	 &nbsp;&nbsp; <h3 style="color:#404040; font-size: 16pt; font-weight: bolder; margin: 0 0 5% 6%;">Register Tracking Number</h3> 
	 
	<c:if test="${not empty mapList}">
	<div class="my-5" id="container">
	<span class="boldtxt">배송등록 목록</span>
	<span class="link_tag" style="margin-left:15px;" onclick="javascript:window.location.reload()">업데이트 <%= sf.format(nowTime) %></span>
	
	
	<%-- 반복시작 --%>
	<c:forEach var="map" items="${ mapList}" >
	<div class="row mt-4 border box">
		<div  class="col-md-6">
			<label class="click"><input type="checkbox" name="tracking_num" class="m-4" value="${map.pk_orderid}" >
			<c:if test="${map.order_status eq '1'}">
				<span class="boldtxt">주문 배송 &nbsp;&nbsp;&nbsp;&nbsp;(${map.date })</span></label>
			</c:if>
			<c:if test="${map.order_status eq '3'}">
				<span class="boldtxt">환불수거 &nbsp;&nbsp;&nbsp;&nbsp;(${map.date })</span></label>
			</c:if>
			<ul>
				<c:if test="${map.order_status eq '1'}">
					<li><label class="li_lb">받는분 :</label>${map.name}</li>
				</c:if>
				<c:if test="${map.order_status eq '3'}">
					<li><label class="li_lb">보내는분 :</label>${map.name}</li>
				</c:if>
				<li><label class="li_lb">연락처 :</label>${map.mobile } </li>
				<li><label class="li_lb">배송주소 :</label>${map.address }</li>
				<li><label class="li_lb"></label>${map.detailaddress } ${map.extraaddress } (우: ${map.postcode } )</li>
			</ul>
		</div>
		<div class="col-md-6">
			<ul style="margin: 25px 0 0 0; padding-left: 0;">
				<li><span class="boldtxt mb-2">주문번호 ${map.pk_orderid }</span></li>
				<li>시리얼넘버 ${map.pk_order_detail_id }</li>
				<li>${map.pname}</li>
			</ul>
			<span class="puretxt my-1">운송장 입력</span>
			<select id="sort" class="mb-3">
				<option selected>CJ대한통운</option> 
		        <option >로젠</option>
		        <option >롯데</option>
		        <option >한진</option>
		        <option >우체국택배</option>
			</select>
		<input type="text" class="input_style"  placeholder="운송장번호를 입력하세요" />
		<input type="hidden" value="${map.order_status}">
		</div>
	</div>
	</c:forEach>
	<%-- 반복끝 --%>
	
	
	<%-- 버튼 --%>
	<button id="btn_tracking_num" type="button">운송장 일괄등록</button>
</div>
</c:if>
 <c:if test="${empty mapList}"><span class="boldtxt">운송장을 등록할 주문목록이 없습니다.</span> </c:if>
 	
 </section>