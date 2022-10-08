<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>
 
<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />
    
<style type="text/css">

	

	form#frm_pwdupdate {
		margin-bottom: 20px;
		
	}
	
	button#btn_pwdupdateEnd {
		background-color: black;
		color: white;
		display: block;
		line-height: 200%;
		margin: 7% 0 0 30%;
	}
	
	div#pwd_update {
		
		display: inline-block;
		font-size: 14px;
		margin-top: 10%;
		left: 15%;
    	position: flex;
    
	}
	div#pwd_update >div {
		padding: 3%;
	}

	input {
		width:70%;
		display: block;
		line-height: 200%;
	}
	
	.first_error, .error {
  		font-size: 11px;
  		color:red;
  		
  	}
  	
  	.chk {
    	display: inline-block;
    	color: red;
    }
    

</style>



<script type="text/javascript">

	$(document).ready(function(){

	
		// 비밀번호 변경하기 버튼을 누르면
	    $("button#"btn_pwdupdateEnd").click(function(){
	    	location.href="<%= ctxPath%>/myinfo/pwdRechangeEnd.sun";
		}); // end of $("button#btn_logout").click() --------------
		
		

	}); // end of $(document).ready(function() ------------------------------------------

	

</script>

    
   
<form id="frm_pwdupdate">
<div id="pwd_update">
		  <div>
	         <label for="pwd" style="font-size: 11pt;">새로운 비밀번호</label>
	         <input type="password" id="pwd" name="pwd" class="requiredInfo" required/>
	         <div class="error">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
	      </div>
	      
	      <div>
	         <label style="font-size: 11pt;">새로운 비밀번호확인</label>
	         <input type="password" id="pwdcheck" class="requiredInfo" required/>
	         <div class="error">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
	      </div>
	      
	      	<div class="error_msg"><div id="notPassed">비밀번호는 해당 조건을 모두 충족해야 합니다.</div>
	        	<div class="chk" id="size">✔</div>&nbsp;최소 8자 이상 15글자 이하<br>
	        	<div class="chk" id="upper">✔</div>&nbsp;최소 1개의 대문자 사용<br>
	        	<div class="chk" id="lower">✔</div>&nbsp;최소 1개의 소문자 사용<br>
	        	<div class="chk" id="num">✔</div>&nbsp;최소 1개의 숫자 사용<br>
	        	<div class="chk" id="special">✔</div>&nbsp;최소 1개의 특수문자 사용
	        </div>
	      
	      <button type="button" id="btn_pwdupdateEnd">비밀번호 변경</button>
	      <%-- 변경버튼을 누르면 마이페이지 첫창으로 넘어간다 --%>
	      
	  </div>    
 </form>    