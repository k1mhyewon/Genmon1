<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>button</title>
    
    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css"> -->
</head>
<body>

	<form id="Frm_pwdfind" style="width: 30%;  border: solid 1px red; padding: 3%;"  >
		<p style="padding: 1%">계정에 연결된 이메일을 입력하시면 비밀번호를 재설정하실 수 있습니다.</p>
		<span>
			<input type="email" id="email" name="email" size="30" style="width: 60%; line-height: 200%;" placeholder="이메일을 입력해주세요." required autofocus="autofocus"/>
			<button id="btn_pwdcode" type="button" style="width: 30%; background-color: black; color: white; line-height: 200%;">링크 받기</button>
				<%-- 반응형<button id="btn_pwdcode" type="button" class="btn btn-secondary">링크 받기</button> --%>
		</span>
		
		<div style="margin-top: 5%;"><a id="btn_join" type="button" href="join.jsp" style="text-decoration:underline; color: gray; " >회원가입</a></div>
															<%-- 나중에 링크 변경하기 --%>
	</form>
	

</body>
</html>