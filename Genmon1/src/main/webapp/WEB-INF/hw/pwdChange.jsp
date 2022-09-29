<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/header.jsp" />

<style type="text/css">

	
    
    div#pwdChange_container {
    /*  border: solid 1px red;  */
    	margin: 10% auto;
    	width: 35%;
    }
    
    div#pwdChange_container > ul > label {
    	display: block;
    	font-size: 12px;
    
    }
    
    input {
    	width: 80%;
    	text-align: left;
    	line-height: 200%;
    }
    
    #btn_pwdUpdate {
    	cursor: pointer;
		font-size: 10pt;
		background-color: black;
		color: white;
		border: none;
		width: 74%;
		height: 40px;
		margin-left: 8%;
		margin-top: 20px;
    }
    
    div > span {
     font-size: 12px;
     text-decoration: underline;
    } 
    
    

</style>

<script>


	$(document).ready(function(){ // --------------------------------------------------
		
		$("button#btn_pwdUpdate").click(function(){ // ----------------
			

			const pwd1 = $("input#pwd1").val();
			const pwd2 = $("input#pwd2").val();
			
			// const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
			// 또는
			const regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
			// 숫자/문자/특수문자 포함 형태의 8-15자리 이내의 암호 정규표현식 객체 생성
			const bool = regExp.test(pwd1);
			
			if(!bool){ // 암호가 정규식에 안맞는 경우
				alert("암호는 8글자 이상 15글자 이하에 영문자,숫자,특수기호가 혼합되어야만 합니다.");
				$("input#pwd1").val("");  // 입력받은 칸을 비워버림
				$("input#pwd2").val(""); // 입력받은 칸을 비워버림
				return; // 종료
			}
			else if(bool && pwd1 != pwd2){ // 암호와 암호확인 값이 서로 다른 경우
				alert("암호가 일치하지 않습니다.");
				$("input#pwd1").val("");  // 입력받은 칸을 비워버림
				$("input#pwd2").val(""); // 입력받은 칸을 비워버림
				return; // 종료
			}
			else {
				const frm = document.pwdChangeFrm;
				frm.action = "<%= ctxPath%>/login/pwdChangeEnd.sun";
				frm.method = "POST"; // post 방식이어야 함
				frm.submit();
			}
			
			
			
		}); // end of $("button#btn_pwdUpdate").click() ----------------
		
		
	}); // end of $(document).ready() ----------------------------------------------------
	
	
	
	
	
</script>


<!-- 인덱스 시작 -->
    <form name="pwdChangeFrm">
        <div id="pwdChange_container">
        	<span style="font-weight:bold; display:inline-block; margin: 0 0 3% 8%; ">비밀번호 변경</span>
        	
        	<ul>
        		<label for="pwd1">비밀번호</label>
        		<input type="pwd1" name="pwd1" id="pwd1" required/>
        	</ul>
        	
        	<ul>
        		<label for="pwd2">비밀번호 확인</label>
        		<input type="pwd2" name="pwd2" id="pwd2" required/>
        	</ul>
        	
        		<button type="button" id="btn_pwdUpdate">비밀번호 변경</button>
        	
        	
        	<c:if test="${requestScope.method == 'POST' && requestScope.n == 1 }">
				<div id="div_updateResult" align="center">
					${requestScope.userid}님의 암호가 변경되었습니다.<br> <%-- post 방식일때 && n이 1일 때만 보여야 함 --%>
				</div>
			</c:if>
        	<input type="hidden" name="userid" value="${requestScope.userid}"/>
        </div>
    </form>  
<!-- 인덱스 끝 -->
<jsp:include page="../common/footer.jsp" />

