<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />

<% String ctxPath = request.getContextPath(); %>

<style type="text/css">
	form#menu_myinfoupdate {
		/*border: solid 1px orange;*/
		display: flex;
		font-size: 14px;
		width: 400px;
		height: 300px;
		margin: 2% auto 3% auto;
	}
	
	
	button#btn_pwdcheck {
		background-color: black;
		color: white;
		width: 310px;
		display: block;
		margin: 10% 0 0 10%;
		line-height:30px;
	}
	
	input {
		margin-top: 7%;
		width: 300px;
		height : 30px; 
	}
	
	li {
		list-style: none;
	}
	

</style>


<script type="text/javascript">

		$(document).ready(function(){
			
			// 클릭한 메인메뉴 글씨 굵게
	    	$("span#info_detail").css("font-weight","bold");
			
			
			
			
			
			// 내정보를 수정할 수 있는 버튼을 누르면
	        $("button#btn_pwdcheck").click(function(){
	        	location.href="<%= ctxPath%>/myinfo/infoUpdateEnd.sun";
				
			}); // end of $("button#btn_pwdcheck").click(function() --------------
			
			
		});// end of $(document).ready(function() ------------------------------------------




</script>


<form id="menu_myinfoupdate" >
		<div>
			<ul>
				<li>
					<label for="passwd" style="font-size: 16px; font-weight: bold;">비밀번호</label>
					<input type="password" name="passwd" size="20" placeholder="비밀번호를 입력해주세요" autofocus required/>
				<li>
			</ul>
		<button type="button" id="btn_pwdcheck"  >비밀번호 확인</button>
		</div>
</form>



<jsp:include page="../common/footer.jsp" />