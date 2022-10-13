<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

 div#menu_myinfoupdate {
		/*border: solid 1px orange;*/
		display: inline-block;
		width: 380px;
		height: 480px;
		padding: 3%;
	}
	
	ul > li {
		list-style: none;
		line-height: 30px;
		font-size: 13px;
	}

	button.btn {
		background-color: black; 
		color: white;
		width: 300px;
		display: block;
		line-height: 100%;
		margin: 10% 0 -5% 10%;
	}



</style>


<script type="text/javascript">

		$(document).ready(function(){
			
			$("span#info_detail").css("font-weight","bold");
			
			// 수정하기 버튼을 누르면
	        $("button#btn_update").click(function(){
	        	location.href="<%= ctxPath%>/myinfo/updatepwdInput.sun";
				
			}); // end of $("button#btn_pwdcheck").click(function() --------------
			    
		});// end of $(document).ready(function() ------------------------------------------

		
</script>

<div id="container" align="center">
	<div id="menu_myinfoupdate">
		<ul  align="left">
		
			<li id="gender" name="gender">성별&nbsp;&nbsp;: 
				<c:choose>  <%-- gender 컬럼은 1 또는 2로 나오기때문에 따로 설정한다 --%>
        					<c:when test=" ${loginuser.gender eq '1'}">남자</c:when>
        					<c:otherwise>여자</c:otherwise>
        		</c:choose>
			</li>
			
			<li id="name" name="name" >성명&nbsp;&nbsp;: ${loginuser.name}</li>
			<li id="birth" name="birthday">생년월일&nbsp;&nbsp;: ${loginuser.birthday}</li>
			<li id="email" name="email">이메일&nbsp;&nbsp;: ${loginuser.email}</li>
			<li id="mobile" name="mobile">전화번호&nbsp;&nbsp;: ${loginuser.mobile}</li>
		</ul>
		<div>
			<button type="button" id="btn_update" class="btn" onclick="goupdate()" >수정하기</button>
		</div>
	</div>
</div>

   
   <jsp:include page="/minsu/footer.jsp" />