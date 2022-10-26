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
	div#login_container {
    margin:  auto;
    	width: 60%;
    }
@media screen and (max-width: 767px) { .divider {width: 100%;}}
	
</style>
	<div class="box_content col-md-8" >
	
		<div id="login_container">
        	<div class="titles mb-5" style="text-align:center;font-size: 15pt;">시리얼 넘버 조회</div>
        	<div class="row ">
		 		<div class="col-md-12 form-group">
				  <input type="password" id="pwd" name="pwd" class="form-control must password" maxlength="20" >
		 		</div>
		 		<div class="col-md-6">
		           	<a style="display:inline-block;float:right;"href="#" class="col-md-6 btn margin_b50" onclick="funcGoDelete()">삭제하기</a>
					<!-- <a style="display:inline-block;float:right;background-color: white;color:black;"href="#" class="col-md-6 btn margin_b50"  onclick="funcCancel()">취소하기</a> -->
				</div>
			</div>
        </div>
	
	</div>
	</div>
<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />