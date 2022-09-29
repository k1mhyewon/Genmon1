<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>

<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

 <jsp:include page="../common/header.jsp" />
<jsp:include page="customerService.jsp" />
<style>
.swiper-wrapper {
	height:auto;
}
	div.Qbody{
		width: 100%;
		font-family: "Unica77LLWeb","SDGothicNeo", sans-serif;
	}
	div.Qtitle>span, div.Qtitle>ul>li{
		font-weight: lighter;
		font-size: 10pt;
	}
	a.btn{
		background-color: #000; 
		color: white; 
		font-size: 11pt; 
		width: 215px;
		text-align: center;
		margin: 30.5px 5px 0 0;
    	height: 40px;
    	border: solid 1px #000;
    	border-radius: 0;
	}
	.divider {
	    border-bottom: #e0e0e0 1px solid;
	    width: 100%;
	}
	.margin_b50 {
   	 	margin-bottom: 50px;
	}
	.margin_b200 {
   	 	margin-bottom: 200px;
	}
	.margin_t50 {
   	 	margin-top: 50px;
	}
	.box_content {
	    width: 100%;
	    margin-left: auto;
	    display: inline-block;
	    text-align: left;
	    margin-top:60px;
	    margin-bottom: 200px;
	}
	h2.title{
		font-size: 13pt;
		margin-bottom: 30.5px;
	}
	span {
		font-size: 11pt;
	}
@media screen and (max-width: 767px) { .divider {width: 100%;}}
	
</style>
   
			<!-- 배송탭 -->
			<div class="box_content col-md-8" >
            <div class="contents">
            <h2 class="title">무료 배송 및 무료 반품<br></h2>
            <div>
                   	<span>• 온라인 공식 스토어에서 주문 시, 무료 배송 및 무료 반품 서비스를 제공합니다.</span><br>
                	<span>• 오늘 주문한 상품을 영업일 기준 1-3일 내에 받아보세요.</span>
                </div>
                    <div class="divider margin_b50 margin_t50"></div>

                <h2 class="title">주문 상황 조회<br></h2>
            <div>
                		<span>• 주문하신 상품의 진행 상황은 공식 홈페이지 내 [회원정보] > [주문] 에서 확인하실 수 있습니다.</span><br>
                		<span>• 결제가 완료되지 않은 주문 내역은 3일 후 자동으로 취소됩니다.</span>
                </div>

                    <div class="divider margin_b50 margin_t50"></div>
                 
                 <h2 class="title">배송 현황<br></h2>
                 <div>
                	<span>결제가 완료되면 평일 기준 24시간 내 문자 메시지로 송장 번호가 전송됩니다. 안내 받으신 송장번호는 당일 오후 7시 이후부터 배송 조회가 가능합니다.
					<br>주문량이 많은 경우 상품 발송이 지연될 수 있습니다. 신속한 상품 발송 준비를 위해 최선을 다하겠습니다.</span><br>
               		<span>• CJ대한통운 ( https://www.cjlogistics.com )</span>
               	</div>
                    <div class="divider margin_b50 margin_t50"></div>

				<h2 class="title">배송 국가 및 소요 시간<br></h2>
				<div>
               		<span>• GENTLE MONSTER는 전세계적으로 배송이 가능합니다.</span><br>
               		<span>• 국내 배송의 경우 평균 1–3일 정도 소요됩니다. 단, 지역 운송사 사정에 따라 다소 차이가 있을 수 있습니다.</span>
                </div>
                
                    <div class="divider margin_b50 margin_t50"></div>

				<h2 class="title">배송지 변경<br></h2>
				<div>				
                	<span>1600-2126 또는 cs@gentlemonster.com으로 연락 주시기 바랍니다. 단, 이미 상품이 발송된 경우 변경이 어렵습니다.</span>
                </div>
                    <div class="divider margin_b50 margin_t50"></div>
            </div>
            </div>
            </div>
            

<%-- 인덱스 끝 --%>

 <jsp:include page="../common/footer.jsp" />