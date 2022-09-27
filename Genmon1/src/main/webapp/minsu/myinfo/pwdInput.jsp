<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/minsu/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />

<style type="text/css">

	div#menu_myinfoupdate {
		/* border: solid 1px orange; */
		display: inline-block;
		margin-left:30%;
		width: 30%;
		font-size: 14px;
		top: -50px;
		position: relative;
	}
	
	div > button#btn_pwdcheck {
		background-color: black;
		color: white;
		width: 69%;
		display: block;
		margin: 7% 0 0 11%;
		 line-height:30px;
	}
	
	input {
		margin-top: 5%;
		width: 74%;
		height : 30px; 
	}

</style>

	<div id="menu_myinfoupdate">
		<ul>
			<label for="passwd">비밀번호</label>
			<div><input type="passwd" name="passwd" size="20" placeholder="비밀번호를 입력해주세요" autofocus required/></div>
		</ul>
		<button type="button" id="btn_pwdcheck"  >비밀번호 확인</button>
	</div>
</form>



<jsp:include page="/minsu/footer.jsp" />