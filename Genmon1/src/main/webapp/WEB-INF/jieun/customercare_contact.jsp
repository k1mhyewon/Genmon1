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
		width: 200px;
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
	
</style>
<!-- swiper jquery -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Optional JavaScript -->
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>

	$(document).ready(function() {
		
		// 회원 문의하기를 클릭했다면		
		$("a#membercontactFrm").click(function() {
			// 로그인 안되어있으면 로그인 페이지갓다가 현재 url으로 다시오기 
			if(${empty sessionScope.loginuser}){
				location.href="<%= ctxPath%>/login.sun"; // 로그인 페이지 
			}
			else{// 로그인이 되어있으면 문의작성폼으로 
				goMemberCotactFrm();
				location.href="<%= ctxPath%>/jieun/memberContactForm.jsp"; // 문의작성 페이지 
			}
			
		})
		
		// 비회원 문의하기를 클릭했다면	
		$("a#guestcontactFrm").click(function() {
			 
			goNonmemberCotactFrm();
		})
		
		// 문의조회를 클릭했다면	
		$("a#searchContact").click(function() {
			// 회원인데 로그인상태라면 마이페이지 문의조회로
			
			// 회원 또는 비회원인데 비로그인상태라면 회원 비회원 선택 폼으로 => div.contents 내용물 바꾸기  
			location.href="<%= ctxPath%>/customerCare/contact/memberGoContact.sun"; // 회원 비회원 선택하는 라디오 
			// $("div.contents").html();
			
			
		})
		
	})

</script>
		<!-- 문의탭 -->
	<div class="box_content col-md-8" >
         <div class="contents">
               <h2 class="title">일반문의<br></h2>
               	<div>
                   <span>주문, 배송, 제품, 결제 등 궁금한 사항이 있으시거나 도움이 필요하시면 아래 편하신 방법으로 연락주시기 바랍니다.</span>
					<div><a class="btn margin_b50" id="membercontactFrm">회원 문의하기</a>
					
					<a class="btn margin_b50" id="guestcontactFrm">비회원 문의하기</a> <%-- 회원으로 로그인했으면 안보이게하기 --%> 
					
					<a href="#" class="btn margin_b50" id="livechat">실시간 채팅하기</a></div>
                </div>
                
                	<div class="divider margin_b50 margin_t50"></div>
                	
               <h2 class="title">문의조회<br></h2>
               	<div>
                   <span>주문, 배송, 제품, 결제 등 궁금한 사항에 대해 문의하신 내용을 확인해주세요.</span>
					<div><a class="btn margin_b50" id="searchContact">문의조회하기</a></div>
                </div>
                
                	<div class="divider margin_b50 margin_t50"></div>
                	
               <h2 class="title">전화문의<br></h2>
               	<div>
                  	<span>대표번호 : 1600-1234<br>고객서비스팀 : 1600-1237<br>* 근로자 보호 및 서비스 품질 향상을 위해 모든 통화 내용이 녹음됩니다.</span>
               	</div>
                   
                <div class="divider margin_b50 margin_t50"></div>
                   
                <h2 class="title">온라인 고객 서비스 운영시간<br></h2>
                <span>운영시간 : AM 09:30 - PM 17:00 (주말 및 공휴일 휴무)
                <br>점심시간 : PM 12:00 - PM 13:00</span>
                
               </div>
          </div>
          
          <%-- 문의조회 클릭시 나오는 폼  --%>
          <div >
          
          </div>
          
          
          
          
         </div>
            

<%-- 인덱스 끝 --%>
	<jsp:include page="../common/footer.jsp" />

