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
	
	span.boldtxt{
		display: block;
		font-weight: bold;
		font-size: 11pt;
	}
	
	.myright{
		text-align: right;
	}
	
	table {
		width: 100%;
		/* border : 1px solid black; */
		font-size: 10pt;
	}
	
	td{
		vertical-align: top;
		/* border-collapse:collapse;
		border : 1px solid black; */
	}
	
	tr {
		height: 30px;
	}
	
	.link_tag{
		font-size: 11pt;
		color: black;
		text-decoration: underline;
		font-weight:bold;
		margin-left : 20px;
		cursor: pointer;
	}
	
	div.box{
		width: 45%;
	}
	
	td.image{
		width: 175px;
		height: 220px;
	}
	
	img.image{
		width: 160px;
		height: 200px;
	}
	
</style>

<%-- 상단네비 시작 --%>
<div class="border-top"></div>
<div id="order_nav">
	<nav>
	    <ul>
	    	<li><a href="#">회원정보</a></li>
	    	<li><a href="#">주문/배송</a></li>
	    	<li><a href="#">위시리스트</a></li>
	    	<li><a href="#">상품문의</a></li>
	    </ul>
	</nav>
</div>
<%-- 상단네비 끝 --%>

<div class="border-top"></div>
<div class="container my-5">
	<span class="boldtxt mb-3">주문</span>
	
	<%-- 주문번호 부분 시작 --%>
	<table class="tbl_1 border-bottom">
		<tbody>
			<tr><td><strong>Order#000001010</strong><td></tr>
			<tr><td><strong>2022/09/03</strong></td></tr>
			<tr><td>주문수량 : 3</td></tr>
			<tr>
				<td class="myright" style="height: 50px;"><a class="link_tag">주문취소</a><a class="link_tag">교환요청</a><a class="link_tag">반품요청</a></td>
			</tr>
		</tbody>
	</table>
	<%-- 주문번호 부분 끝 --%>
	
	
	<%-- 밑에 테이블 두개 시작 --%>
	<div style="display: flex;" class="my-4">
		<div class="box">
			<table class="mb-4 border-right">
				<tbody>
					<tr>
						<td colspan="2"><strong>입금대기중</strong></td>
					</tr>
					<%-- 반복시작 --%>
					<tr>
						<td rowspan="3" class="image"><img src="sun_img.png"  class="image"></td>
						<td style="vertical-align: middle;"><strong>릴리트01</strong><br>259000원</td>
					</tr>
					<tr>
						<td>수량 : 1</td>
					</tr>
					<tr>
						<td  style="height: 70px;"> </td>
					</tr>
					<%-- 반복끝 --%>
					<tr>
						<td rowspan="3" class="image"><img src="sun_img.png"  class="image"></td>
						<td style="vertical-align: middle;"><strong>릴리트01</strong><br>259000원</td>
					</tr>
					<tr>
						<td>수량 : 1</td>
					</tr>
					<tr>
						<td  style="height: 70px;"> </td>
					</tr>
					<tr>
						<td rowspan="3" class="image"><img src="sun_img.png"  class="image"></td>
						<td style="vertical-align: middle;"><strong>릴리트01</strong><br>259000원</td>
					</tr>
					<tr>
						<td>수량 : 1</td>
					</tr>
					<tr>
						<td  style="height: 70px;"> </td>
					</tr>
				</tbody>
			</table> <br>
		</div>
		
		<div class="box" style="margin-left: auto">
			<table class="mb-4">
				<tbody>
					<tr>
						<td  colspan="3"> </td>
					</tr>
					<tr>
						<td><strong>배송방법</strong></td>
						<td  colspan="2">일반배송</td>
					</tr>
					<tr>
						<td><strong>배송주소</strong></td>
						<td  colspan="2">김젠몬<br>서울특별시 관악구 청림3마길 28-8<br>101동 101호<br>08732</td>
					</tr>
					<tr  style="height: 70px;">
						<td><strong>연락처</strong></td>
						<td  colspan="2">01012345678</td>
					</tr>
					<tr>
						<td><strong>결제수단</strong></td>
						<td  colspan="2">가상계좌</td>
					</tr>
					<tr style="height: 70px;">
						<td><strong>입금 계좌번호</strong></td>
						<td  colspan="2">우리은행 1002-850-797783</td>
					</tr>
					<tr>
						<td rowspan="4"><strong>주문상세</strong></td>
						<td>소계</td>
						<td class="myright">259000원</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td class="myright">0원</td>
					</tr>
					<tr>
						<td>적립금 사용</td>
						<td class="myright">-1000원</td>
					</tr>
					<tr  style="height: 60px;">
						<td>총결제금액</td>
						<td class="myright">258000원</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><strong>배송사</strong></td>
					</tr>
					<tr>
						<td colspan="2"><strong>CJ대한통운</strong></td>
					</tr>
				</tfoot>
			</table> <br>
		</div>
	</div>
	<%-- 밑에 테이블 두개 끝 --%>
</div>

<jsp:include page="footer.jsp" />