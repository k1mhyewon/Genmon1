<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>주문 상세</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<!-- 폰트 -->
<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">

<style type="text/css">

	* {font-family: 'Pretendard', sans-serif; !important}

	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	span.boldtxt2{
		display: block;
		font-weight: bold;
		font-size: 10pt;
		margin-bottom: 6px;
	}
	
	span.puretxt{
		display: block;
		font-size: 10pt;
		margin-bottom: 6px;
	}
	
	div.tbl_box{
		width: 100%;
		height: 145px;
	}
	
	table {
		width: 90%;
		margin : 7px auto;
		/* border : 1px solid black; */
		font-size: 10pt;
		/* vertical-align: top; */
		text-align: center;
	}
	
	td {
		/* border-collapse:collapse;
		border : 1px solid black; */
	}
	
	tr{
		height: 20px;
	}
	
	.myleft{
		padding-left : 10px;
		text-align: left;
	}
	
	.myright{
		width : 25%;
		padding-right : 10px;
		text-align: right;
	}
	
	td.image{
		width: 40%;
		height: 130px;
	}
	
	span.tf_span {
		display:inline-block;
		width: 360px;
		height: 25px;
	}
	
	img.image{
		padding : auto 10px;
		width: 110px;
		height: 120px;
	}
	
	ul{padding-left: 15px;}
	
	li {
		font-size: 10pt;
		list-style-type: none;
		margin-bottom: 7px;
		/* border : 1px solid black; */
	}
	
	span.list_span{
		/* border : 1px solid black; */
		display: inline-block;
		width: 100px;
		font-weight: bold;
	}
	
	select#sort{
		margin-bottom: 20px;
		width: 120px;
		height: 35px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 15px;
		margin-left :10px;
	}
	
	select#sort:hover{
		cursor: pointer;
	}
	
	
	input {
		display :inline-block;
		width: 300px;
		height: 35px;
		margin-left :10px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 10px;
	}
	
	div#btn{	
		width: 90%;
		margin: auto;
	}
	
	
	
	button {
		width: 60%;
		margin: 5px 20%;
		background: black;
		color: white;
		font-weight: bold;
	}
	
	
	
</style>

<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 배송완료만 배송정보 조회해오기
		var  total_status = "${total_status}" ;
		
		if(total_status==5 ||  total_status==8){
			
			var orderid = "${odervo.pk_orderid }" ;
			
			$.ajax({
				url : "<%= ctxPath%>/myinfo/deliInfo.sun" , 
				type: "POST",  
				data: {"orderid":orderid,
						"deliv_class":1},
			    dataType:"JSON",
			    success:function(json) {
			    	// alert(json.deliv_company);
			    	html ='<li>배송완료 ('+json.deliv_date+')</li><li>'+json.deliv_company+' '+json.tracking_number+' </li>';
			    	$("ul#tracking").html(html);
			    },
			    error: function(request, status, error){
					//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); 
		}
		
		//console.log('ㅎㅎ');
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
			}
		}); //end of  운송장 입력 유효성 검사
		
		
		
		// 운송장 일괄등록 버튼 클릭이벤트
		$("button#btn_tracking_num").click(function(){
			
			let arr = [];
			let arr2 = [];
			let arr3 = [];
			let arr4 = [];
			
			if( $("input:text.input_style").val()!= "") { 

				const track = $("input:text.input_style").val();
				const company = $("select").val();
				const orderstatus = "${total_status}";
				var ck_val = "${odervo.pk_orderid }" ;
				
				arr.push(ck_val);
				arr2.push(track);
				arr3.push(company);
				arr4.push(orderstatus);
					
				const arrjoin = arr.join(",");
				const arrjoin2 = arr2.join(",");
				const arrjoin3 = arr3.join(",");
				const arrjoin4 = arr4.join(",");
				
				console.log(arrjoin);
				console.log(arrjoin2);
				console.log(arrjoin3);
				console.log(arrjoin4);
				
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
				alert('운송장번호를 비워둘 수 없습니다');
				return;
			}
		}); // end of 운송장 일괄등록 버튼 클릭이벤트
		
		
		
		// 입급확인 클릭 이벤트 
		$("button#btn_check_money").click(function(){
			
			var orderid = "${odervo.pk_orderid }" ;
			
			let arr = [];
			
			$("td.pnum").each(function () {
				
				arr.push($(this).text());
			});
			
			const arrjoin = arr.join(",");
			
			
			$.ajax({
				url : "<%= ctxPath%>/admin/adminCheckMoneyIn.sun" , 
				type: "POST",  
				data: {"orderid":orderid,
					"pnumjoin":arrjoin},
			    dataType:"JSON",
			    success:function(json) {
			    	
			    	if(json.result!=0){
			    		alert('입금을 확인했습니다.');
				    	window.location.reload(true);
			    	}
			    	
			    },
			    error: function(request, status, error){
					//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); 
			
			
		});// end of 입급확인 클릭 이벤트 
		
		
	}); // end of ready 

</script>

</head>
<body>
	<div style="width: 80%; margin: 0 auto;">
		<span class="boldtxt my-3">주문상세 ${odervo.pk_orderid }</span>
		<span class="boldtxt2 mb-2">주문상품 (${totalqty })</span>
		<%-- 반복 시작 --%>
		<c:forEach var="orddtailvo" items="${orddtailList }">
		<div class="border tbl_box mb-1" >
			<table>
				<tbody>
					<tr>
						<td rowspan="5" class="image"><img src="<%=ctxPath %>/images/common/products/${orddtailvo.cpvo.pimage1 }" class="image"></td>
						<td class="myright"></td>
						<td class="myleft"></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td class="myleft">${orddtailvo.cpvo.parentProvo.pname } ${orddtailvo.cpvo.colorName }</td>
					</tr>
					<tr>
						<td>품번</td>
						<td class="myleft pnum" >${orddtailvo.fk_pnum }</td>
						
					</tr>
					<tr>
						<td class="myright"></td>
						<td class="myleft"></td>
					</tr>
				</tbody>
			</table>
		</div>
		</c:forEach>
		<%-- 반복 끝 --%>
		
		
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">주문 정보</span>
		<ul>
			<li><span class="list_span">결제일 </span> ${purvomap.purvo.purchaseDate }</li>
			<li><span class="list_span">받는분 </span> ${odervo.name }</li>
			<li><span class="list_span">휴대폰번호 </span> ${odervo.mobile }</li>
			<li style="margin-bottom: 2px;"><span class="list_span">배송지 </span> ${odervo.address }</li>
			<li style="margin-bottom: 2px;"><span class="list_span"> </span> ${odervo.detailaddress }</li>
			<li><span class="list_span"> </span> ${odervo.extraaddress } ${odervo.postcode }</li>
		</ul>
		
		<%-- 구분선 --%>
		<c:if test="${total_status eq 6}">
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">입금예정금액</span>
		<span class="puretxt ml-3"><fmt:formatNumber>${purvomap.purvo.paymentAmount -(purvomap.purvo.usedCoin + purvomap.purvo.usedPoint) }</fmt:formatNumber>원</span>
		<button type="button" id="btn_check_money" class="mb-4">입금확인</button>
		</c:if>
		
		
		<c:if test="${total_status eq 1}">
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">배송등록</span>
		<span class="puretxt ml-3">운송장 등록</span>
		<select id="sort">
			<option selected>CJ대한통운</option> 
	        <option >로젠</option>
	        <option >롯데</option>
	        <option >한진</option>
	        <option >우체국택배</option>
		</select>
		<input type="text" class="input_style" placeholder="송장번호를 입력하세요" />
		
		<div id="btn" class="mt-3 mb-4">
			<button type="button" id="btn_tracking_num">배송등록</button>
		</div>
		</c:if>
		<%-- 구분선 --%>
		
		<c:if test="${total_status eq 5 or  total_status eq 8}">
		<div class="border-bottom mt-4"></div>
		<span class="boldtxt2 my-3">배송정보</span>
		<ul class="mb-5" id='tracking'>
			
		</ul>
		
		<%-- 구분선 --%>
		
		<div class="border-bottom mt-4"></div>
		
		<%-- 구분선 --%>
		</c:if>
		
	</div>
</body>
</html>