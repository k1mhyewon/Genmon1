<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="/minsu/header.jsp" />

<style type="text/css">

	div.container {
   		width: 70%;
   	/*  border: solid 1px blue; */
    }
    
    div#loginFrm {
    /*  border: solid 1px red;  */
    	margin: 10% 50%;
    	width: 50%;
    }
    
    div#loginFrm > ul > label, p{
    	display: block;
    	font-size: 12px;
    
    }
    
    input {
    	width: 80%;
    	text-align: left;
    	line-height: 200%;
    }


</style>

<!-- 인덱스 시작 -->
    <div class="container">
        <div id="loginFrm">
        	<span style="font-weight:bold; display:inline-block; margin: 0 0 3% 8%; ">로그인</span>
        	
        	<ul>
        		<label for="email">이메일</label>
        		<input type="email" name="email" id="email" required/>
        	</ul>
        	
        	<ul>
        		<label for="pwd">비밀번호</label>
        		<input type="password" name="pwd" id="pwd" required/>
        	</ul>
        	
        	
        	<span>
               	<a style="cursor: pointer; font-size: 12px; margin-left: 8%; text-decoration: underline;" data-toggle="modal" data-target="#emailFind" data-dismiss="modal" data-backdrop="static">이메일 찾기</a>
               	<a style="cursor: pointer; font-size: 12px;margin-left: 2%;text-decoration: underline;" data-toggle="modal" data-target="#passwdFind" data-dismiss="modal" data-backdrop="static">비밀번호 찾기</a>
            </span> 
             																			
        	
        	<button type="button" style="background-color: black; color: white; width: 74%;margin: 10% 0 0 8%; line-height: 250%;">로그인</button>
        	
        	
        	<span style="font-weight:bold; display:inline-block; margin: 10% 0 3% 8%; ">회원가입</span>
        	<p style="width: 72%; margin-left: 8%;">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</p>
        	<button type="button" id="btn_gojoin" style="background-color: black; color: white; width: 74%;margin-left: 8%; line-height: 250%;">신규가입</button>
        	
        </div>
    </div>    	
        	
    <!-- 인덱스 끝 -->
<jsp:include page="/minsu/footer.jsp" />


 
<!-- 이메일찾기 모달창 -->
	<div class="modal fade" id="idFind">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal header -->
	        <div class="modal-header">
	          <h6 class="modal-title" style="font-weight: bold;" >이메일 찾기</h6>
	          <button type="button" class="close emailFindClose" data-dismiss="modal">&times;</button> 
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <div id="idFind">
	          <h3>아이디 찾기</h3>
	          	<iframe id="pwFind" style="border: none; width: 100%; height: 350px;" src="http://localhost:9090/Genmon/minsu/emailFind.jsp">
	          	
	             </iframe>
	          </div>
	        </div>
	        
	    </div>
	   </div>
	</div>    
    
<!-- 비밀번호찾기 모달창 -->
	<div class="modal fade" id="passwdFind">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal header -->
	        <div class="modal-header">
	          <h6 class="modal-title" style="font-weight: bold;" >비밀번호 찾기</h6>
	          <button type="button" class="close passwdFindClose" data-dismiss="modal">&times;</button> 
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <div id="idFind">
	          <h3>계정에 연결된 이메일을 입력하시면 비밀번호를 재설정하실 수 있습니다.</h3>
	          	<iframe id="pwFind" style="border: none; width: 100%; height: 350px; src="http://localhost:9090/Genmon/minsu/pwdFind.jsp" >
	          		
	             </iframe>
	          </div>
	        </div>
	    </div>
	   </div>
	</div>
	
<jsp:include page="/minsu/footer.jsp" />
	