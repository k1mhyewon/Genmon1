<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="customerService.jsp" />
<style>
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
				<h2 class="title">교환 환불 규정<br></h2>
				<div>
                		<span>교환 및 반품은 제품을 수령하신 날(구매일)로부터 7일 이내 가능하며, 제품은 미사용 상태로 모든 구성품을 포함하고 있어야 합니다.</span>
                </div>
                
                    <div class="divider margin_b50 margin_t50"></div>
                 
                 <h2 class="title">교환<br></h2>
                 <div>
                		<span>• 온라인 주문건의 온라인 교환은 반품 및 재주문으로만 가능합니다.</span><br>
                		<span>• 매장에서 다른 제품으로 교환을 원하시는 경우, 제품의 가격은 최초 구매하신 제품보다 높거나 동일해야 합니다.</span><br>
                		<span>• 면세 구매 건은 교환이 불가합니다.</span>
                </div>
                
                    <div class="divider margin_b50 margin_t50"></div>
                
                <h2 class="title">반품<br></h2>
                <div>    
               		<span>• 반품은 최초 구매 매장에서만 가능하며, 온라인 구매건의 경우 온라인 반품만 가능합니다.</span><br>
               		<span>• 매장 반품의 경우, 방문 시 반드시 원거래결제수단과 영수증을 지참하셔야 합니다.</span><br>
               		<span>• 온라인 반품의 경우, 반품접수는 [회원정보-주문-주문상세보기]에서 가능합니다. 접수 후 최초 배송지로 자동 픽업이 접수되어 영업일 기준 2일내 방문수거가 진행됩니다.</span><br>
               		<span>• 반품 택배비는 젠틀몬스터에서 부담하며, 물류에 제품 입고 시 검수를 거쳐 환불됩니다. (환불소요일은 결제수단에 따라 상이할 수 있습니다.)</span><br>
               		<span>• 선물하기로 수령한 제품의 경우 고객 서비스 센터로 연락주시면 반품 접수 도와 드리며, 구매자에게 환불됩니다.</span>
                </div>
                
                    <div class="margin_b50 margin_t50"></div>
               	<div>	
               		<span>※ 다음 사유에 해당하는 경우, 교환 및 반품이 불가합니다.</span><br>
               		<span>- 구성품이 누락되거나 제품가치가 훼손된 경우</span><br>
               		<span>- 제품 부착된 보호 스티커가 제거된 경우</span><br>
               		<span>- 제품에 장착된 렌즈가 제거된 경우</span><br>
               		<span>- 제품 등록을 완료한 경우</span>
	            </div>
            </div>
            </div>
            </div>

<%-- 인덱스 끝 --%>

 <jsp:include page="../common/footer.jsp" />