<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/minsu/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />

<style type="text/css">

	form#frm_infoupdate {
		margin-bottom: 20%;
	}
	
	button#btn_pwdupdateEnd {
		background-color: black;
		color: white;
		width: 30%;
		display: block;
		line-height: 200%;
		margin: 7% 0 0 30%;
	}
	
	div#frm_pwdupdate {
		/* border: solid 1px orange; */
		margin-left:25%;
		display: inline-block;
		width: 30%;
		font-size: 12px;
		margin-top: 10%;
		left: 15%;
    	position: absolute;
	}
	
	section#section_pwd > ul {
		margin-bottom: 3%;
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

</style>

	<div id="frm_pwdupdate">
		<section id="section_pwd">
			  <ul>
		         <label >새로운 비밀번호</label>
		         <input type="password" id="pwd" class="requiredInfo" required/>
		         <div class="first_error">필수 입력란입니다.</div>
		         <div class="error">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
		       
		      </ul>
		      <ul>
		         <label>새로운 비밀번호확인</label>
		         <input type="password" id="pwdcheck" class="requiredInfo" required/>
		         <div class="first_error">필수 입력란입니다.</div>
		         <div class="error">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
		      </ul>
		      
		      <div id="pwderrormsg" style="font-size: 10pt; line-height: 8px; color: gray; margin: 10% 0;">
		      	<ul style="color: black;">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</ul>
		      	<ol>최소 8자 이상</ol>
		      	<ol>최소 1개의 대문자 사용</ol>
		      	<ol>최소 1개의 소문자 사용</ol>
		      	<ol>최소 1개의 특수문자 사용</ol>
		      </div>
		      
		      <button type="button" id="btn_pwdupdateEnd">비밀번호 변경</button>
		      <%-- 변경버튼을 누르면 마이페이지 첫창으로 넘어간다 --%>
	      </section>
	 </div>    
</form>	      




<jsp:include page="/minsu/footer.jsp" />