<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<style>

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
		width: 55%;
		margin: 40px auto;
	}
	
	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	table {
		width: 100%;
		border : 1px solid black; 
		font-size: 10pt;
		text-align: center;
	}
	
	thead td {
		font-size: 11.5pt;
		font-weight: bold;
		background: black;
		color: white;
		height: 45px;
	}
	
	td{
		padding-left: 9px;
	}
	
	tr {
		border-collapse:collapse;
		border : 1px solid black;
		height: 40px;
	}
	
	tr:hover{
		background-color: rgb(235, 235, 235); 
		cursor: pointer;
	}
	
	tr > td:first-child{
		font-weight: bold;
	}
	
	.link_tag{
		font-size: 11pt;
		color: black;
		text-decoration: underline;
		font-weight:bold;
		cursor: pointer;
	}
	
	select#sort{
		margin-bottom: 20px;
		width: 120px;
		height: 35px;
		border: 1px solid black;
		font-size: 11pt;
		font-weight : bold;
		text-indent: 24px;
	}
	
	select#sort:hover{
		cursor: pointer;
	}
	
	button#btn_deli{
		margin-left: 20px;
		margin-bottom: 20px;
		width: 120px;
		height: 35px;
		font-size: 10pt;
		background: black;
		color: white;
	}
	
	input.input_style{
		display :inline-block;
		width: 70%;
		margin: 30px 0 20px 8%;
		height: 40px;
		border: 1px solid black;
		font-size: 10pt;
		text-indent: 30px;
	}
	
	button#search{
		width: 120px;
		height: 40px;
		font-size: 10pt;
		background: black;
		color: white;
	}
	
</style>


<script>

</script>

<%-- 상단네비 시작 --%>
<div class="border-top"></div>
<div id="order_nav">
	<nav>
	    <ul>
	    	<li><a href="#">상품관리</a></li>
	    	<li><a href="#">주문관리</a></li>
	    	<li><a href="#">문의관리</a></li>
	    	<li><a href="#">리뷰관리</a></li>
	    </ul>
	</nav>
</div>
<%-- 상단네비 끝 --%>

<div class="border-top"></div>
<div class="my-5" id="container">
	<span class="boldtxt mb-3">주문목록</span>
	
	<span class="link_tag" style="margin-left:58%;">업데이트 09-19 14:20 ㉿</span>
	<table>
		<thead>
			<tr>
				<td>구분</td>
				<td>상태</td>
				<td>주문번호</td>
				<td>주문자명</td>
				<td>주문상품</td>
				<td>주문날짜</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>주문</td>
				<td>신규주문</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>주문</td>
				<td>결제완료</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>주문</td>
				<td>배송중</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>주문</td>
				<td>배송완료</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>취소</td>
				<td>취소요청</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>취소</td>
				<td>환불완료</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>반품</td>
				<td>반품요청</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>반품</td>
				<td>반품수거전</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>반품</td>
				<td>반품수거중</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>반품</td>
				<td>반품상품도착</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>반품</td>
				<td>환불완료</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>교환</td>
				<td>교환요청</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>교환</td>
				<td>교환수거전</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>교환</td>
				<td>교환수거중</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>교환</td>
				<td>교환상품도착</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>교환</td>
				<td>교환배송중</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
			<tr>
				<td>교환</td>
				<td>교환완료</td>
				<td>202209190001</td>
				<td>김지현</td>
				<td>젠몬01(3), 젠몬02(1)</td>
				<td>2022-09-19 14:02</td>
			</tr>
		</tbody>
	</table>
	
	<input type="search" class="input_style" aria-label="Search" placeholder="주문번호, 상품명, 고객명으로 검색가능합니다."/>
	<button id="search" type="button">검색</button>
</div>

<jsp:include page="footer.jsp" />