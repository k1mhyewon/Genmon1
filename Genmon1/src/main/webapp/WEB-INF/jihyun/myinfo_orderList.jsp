<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<% String ctxPath = request.getContextPath(); %>
    

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />

<style>

	
	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	span.boldtxt2{
		font-weight: bold;
		font-size: 11pt;
		/* margin: 20px auto 20px auto; */
	}
	
	table {
		
		width: 90%;
		margin : 20px; auto;
		/* border : 1px solid black; */
		font-size: 10pt;
	}
	
	td{
		vertical-align: top;
		/* border-collapse:collapse;
		border : 1px solid black; */
		padding-left: 20px;
	}
	
	
	.link_tag{
		font-size: 11pt;
		color: black;
		text-decoration: underline;
		font-weight:bold;
		margin-left : 15px;
		cursor: pointer;
	}
	
	td.image{
		width: 165px;
		height: 200px;
	}
	
	img.image{
		width: 160px;
		height: 200px;
	}
	
	button {
		height: 40px;
		width : 200px;
		font-size: 11px;
		background-color: black;
		color: white;
		font-weight: bold;
	}
	
</style>

<script>

	$(document).ready(function(){
		
		$("span#order_deli").css("font-weight","bold");
		
	}); // end of ready

</script>


<div class="border-top"></div>
<div class="container my-5">
	<span class="boldtxt mb-3">주문내역</span>
	<%-- 주문내역 있을때 시작 --%>
	<c:if test="${not empty requestScope.mapList }">
		<div class="row">
		
		<c:forEach var="map" items="${requestScope.mapList }">
			<div class="col-sm-6 my-4">
				<table>
					<tr>
						<td rowspan="3" class="image"><img src="<%=ctxPath %>/images/common/products/${map.image }"  class="image"></td>
						<td style="vertical-align: middle;"><span class="boldtxt2">${map.orderid }</span><br>
							<c:if test="${map.status eq '1'}">결제완료</c:if>
							<c:if test="${map.status eq '0'}">입금대기중</c:if>
						</td>
					</tr>
					<tr>
						<td>주문수량 : ${map.totalqty }<br>${map.orderdate }</td>
					</tr>
					<tr>
						<td  style="vertical-align: bottom;"><button type="button" onclick="javascript:location.href='<%=ctxPath %>/myinfo/orderDetail.sun?orderid=${map.orderid }'">주문 상세보기</button></td>
					</tr>
				</table>	
			</div>
		</c:forEach>
		
	</div>
	</c:if>
	<%-- 주문내역 있을때 끝 --%>
	
	
	<c:if test="${ empty empty requestScope.mapList }">
		주문내역이 없습니다
	</c:if>
</div>

<jsp:include page="../common/footer.jsp" />