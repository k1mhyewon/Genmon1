<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <% String ctxPath = request.getContextPath(); %>
   
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />

<style type="text/css">

  		/* 내가 만든거 */
  	form.frm_mypage {
  		/* border: solid 1px red; */
  		left:5%;
  		position: relative; 
  	}
  
  	section#menu_bar {
  	  /*border: solid 1px orange;*/
  		width: 60%;
  		margin:  2% auto;
  	}
  	section#menu_bar > span > button { 
  		  border: none;
  		  padding-left: 8%;
	  	  background-color: white;
	  	  margin-right: 5%;
	  	  font-size: 16px;
		  display:inline-block; 
		  text-transform:uppercase; 
		  text-decoration: none;
	  }
	section#menu_bar > span > button:after {
		  display:block;
		  content: '';
		  margin-top:2px;
		  border-bottom: solid 1px black;  
		  transform: scaleX(0);  
		  transition: transform 250ms ease-in-out;
	}
	section#menu_bar > span > button:hover:after { 
		transform: scaleX(1); 
	}
	
	section#main1, section#main2 {
		/* border: solid 1px red; */
		width: 47%;
		display: inline-block;
		margin: 0 auto 10% auto;
		vertical-align: top;
	}
	
	section#main2 > div{
		border-top: solid 1px #cccccc; 
		padding: 30px;
		
	}
	
	span#money > div > button{
		margin: 20% 30%;
		background-color: #808080;
		border:none; 
		color: white; 
		width: 40%;
		line-height: 200%;
		
	}	
	
	div#frm_my {
		height: 
	}
	
  	
  	button:hover {
  		cursor: pointer;
  	}
  	.btn:hover {
  		cursor: pointer;
  	}
  	
 	.btn {
 		color: gray;
 	}
  	
 
	.info {
		margin: 20px;
		font-size: 12px;
		text-align: center;
	}
	.info > span {
		margin-right: 15%;
	}
	
	.btn_money {
		background-color: #cccccc;
		border: none;
		width: 100px;
		margin: 30px 130px;
		font-size: 13px;
		line-height: 25px;
		
	}
	
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		
		// 클릭한 메인메뉴 글씨 굵게
    	$("span#info_detail").css("font-weight","bold");
		
		
		// 마이페이지에서 수정으로 누르면 내정보수정으로 넘가는 버튼
        $("span#btn_myinfoupdate").click(function(){
        	location.href="<%= ctxPath%>/myinfo/infoUpdate.sun";
			
		}); // end of $("button#btn_logout").click() --------------
		
	}); // end of $(document).ready(function()



</script>

   <form name="frm_mypage" id="frm_mypage">
        <div>
        	<div id="frm_my">
        	<section id="main1">
	        	<div id="memberInfo" style="border-top: solid 1px #cccccc; padding: 20px;">
		       		<span style="font-size: 16px; font-weight: bold;">회원정보</span>
		       		<span id="btn_myinfoupdate" type="button" class="btn" style="text-decoration: underline; margin-left: 80%; font-size: 12px;" >수정</span>
					<div style="padding: 5%; font-size: 13px;">
						<ul style="list-style: none; line-height: 30px;">
							<li id="gender" name="gender">성별&nbsp;&nbsp;: </li>
							<li id="name" name="name">이름&nbsp;&nbsp;: </li>
							<li id="birth" name="birth">생년월일&nbsp;&nbsp;: </li>
							<li id="email" name="email">이메일&nbsp;&nbsp;: </li>
							<li id="gender" name="gender">주소&nbsp;&nbsp;:</li>
								<%-- <c:if test="">
					    				<div>저장된 주소가 없습니다</div>
					    				<button id="btn_adradd">새로운 주소 추가</button>
					   				</c:if>
					   			--%>	
						</ul> 
					</div>
	        	</div>
	        	 
        	</section>
        	
        	<section id="main2">
	        	<div id="order">
		        	<span style="font-size: 16px; font-weight: bold; margin-bottom: 100%; ">주문</span>
		        	<a href=""><span id="btn_myinfoupdate" class="btn" type="button" style="text-decoration: underline; margin-left: 80%;font-size: 12px; ">모두보기</span></a>
	        		<div class="info">
		        		<span>주문번호</span>
		        		<span>주문날짜</span>
		        		<span>가격</span>
		        		<%-- <c:if test="">
				    				<div>주문내역이 존재하지 않습니다.</div>
				    				<button id="btn_adradd">쇼핑하기</button>
				   				</c:if>
				   			--%>	
	        		</div>
	        	</div>
	        	
	        	<div id="query">
	        		<span style="font-size: 16px; font-weight: bold; margin-bottom: 100%; ">문의</span>
	        		<a href=""><span id="btn_query" class="btn" type="button" style="text-decoration: underline; margin-left: 80%;font-size: 12px; ">모두보기</span></a>
	        		<div class="info">
		        		<span>문의번호</span>
		        		<span>문의날짜</span>
		        		<span>답변상태</span>
		        		<%-- <c:if test="">
				    				<div>요청하신 문의사항이 없습니다.</div>
				    				<button id="btn_adradd">새로운 주소 추가</button>
				   				</c:if>
				   			--%>	
	        		</div>
	        	</div>
	        	
	        	<div id="point" style="width: 350px; display: inline-block;" >
	        		<span style="font-size: 16px; font-weight: bold; margin-bottom: 100%;">포인트</span>
	        		<div style="text-align: center;margin: 3%;font-size: 13px;">포인트</div>
	        		<button type="button" id="btn_point" class="btn_money" onclick="">적립내역</button>
	        	</div>
	        	
	        	<div id="coin" style="width: 350px;margin-left:50px;display: inline-block; ">
	        		<span style="font-size: 16px; font-weight: bold; margin-bottom: 100%; ">코인</span>
	        		<div style="text-align: center;margin: 3%; font-size: 13px;">코인</div>
	        		<button type="button" id="btn_coin" class="btn_money" onclick="">충전하기</button>
	        	</div>
     		</section>
     		
     		</div>
       </div>
   </form>



<jsp:include page="../common/footer.jsp" />