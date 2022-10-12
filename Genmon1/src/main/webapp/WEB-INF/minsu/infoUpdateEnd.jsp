<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../common/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />



<style type="text/css">

	form#frm_update {
		margin: 40px auto;
		width: 400px;
		height: 600px;
		font-size: 12px;
	}
	
	ul{
		list-style: none;
	}

     input {
    	margin:2% 0;
    	width: 79%;
    	text-align: left;
    	line-height: 25px;
    	display: block;
    }
    
    label {
	    display: block;
	    line-height: 25px;
	}
    
  	div#updateFrm > ul > li > label, 
  	div#updateFrm > section > ul > li > label {
  		display: block;
  	}
  
	div#birthday > select {
		 /*border: solid 1px purple; */
		width: 92px;
		padding: 8px;
  	}
  	
  	select {
  		width:80%; 
  		height:35px; 
  		margin:2% 0;
  	}
  	
  	button.btn {
		background-color: black; 
		color: white;
		width: 72%;
		display: block;
		line-height: 150%;
		margin: 7% 0 -2% 10%;
	}
	
	li#telNum > input {
		width: 85px;
		line-height: 30px;
		margin: 10px 0;
		display: inline-block;
	}
  	

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
       
    $(document).ready(function(){
    	
       $("div.error").hide();
   	   $("div.first_error").hide();
   	   $("div#pwderrormsg").hide();
   	   $("div.btn_Nocheck").hide();
   	   $("div#diffrent").hide();
    	
   	  // === 이메일주소 === //
  	   $("input#email").blur((e) => {
    	
   		const $target = $(e.target);
		const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;   //  이메일 정규표현식 객체 생성 
             
         const bool = regExp.test($target.val()); //암호의 값을 정규표현식에 넣어 테스트해보기
         
         if($target.val() == "") {
         	// 이메일 입력칸이 공백인 경우
         	 $target.parent().find("div.first_error").show();
         }
         else {
         	// 입력칸에 글이 들어온경우
         	 $target.parent().find("div.first_error").hide();
         	
         	if(!bool) {
    				// 이메일이 정규표현식에 위배된 경우  
    			    $target.parent().find("div.error").show();
    				$target.focus();
    			}
    			    $target.parent().find("div.error").hide();
    			
           }
   	  }); // end of  $("input#name").bulr((e) => {} --------------------------------
   			  
   			  
   			  
   	 // === 성명 === //
  	   $("input#name").blur((e) => {
  	
  	   const $target = $(e.target);
       const name = $("input#name").val().trim();
       
       if($target.check) {
       	// 성명 입력칸이 공백인 경우
       	 $target.parent().find("div.first_error").show();
       	 $target.focus();
       }
       else {
       	// 성명을 입력한경우
  			  $target.parent().find("div.error").hide();
  		   }
  	   }); // end of $("input#emailcheck").blur((e) => {} --------------------------------	   	   
  			   
  			   
  	/* 		   
   
	  // === 생년월일 === //
   	   $("select#birthday").each((e) => {
   	
   		const $target = $(e.target);
        
        if($target.ischecked) {
        	// 생년월일을 입력한경우
   			  $target.parent().find("div.error").hide();
        }
        else {
        	// 생년월일 입력칸이 공백인 경우
   			 $("div.first_error").show();
        	 $target.focus();
   		   }
   	   }); //  $("select#birthday").each((e)  --------------------------------	   	   */
 			   
  			   
  	// === 전화번호2 === //
		$("input#hp2").blur( (e)=>{
			
			const $target = $(e.target);
			
		//	const regExp = /^[1-9][0-9]{2,3}$/g;  
		//  또는
		    const regExp = new RegExp(/^[1-9][0-9]{2,3}$/g);  
          //  숫자 3자리 또는 4자리만 들어오도록 검사해주는 정규표현식 객체 생성 
          
          const bool = regExp.test($target.val());
			
			if(!bool) {
				// 국번이 정규표현식에 위배된 경우  
			
			//	$target.next().show();
			//  또는
			    $target.parent().find("div.error").show();
				
			}
			else {
				// 국번이 정규표현식에 맞는 경우 
				
          //	$target.next().hide();
			//  또는
			    $target.parent().find("div.error").hide();
			}
			
		} ); // 전화번호 hp2 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
		// === 전화번호3 === //
		$("input#hp3").blur( (e)=>{
			
			const $target = $(e.target);
			
		//	const regExp = /^\d{4}$/g;  
		//  또는
		    const regExp = new RegExp(/^\d{4}$/g);  
          //  숫자 4자리만 들어오도록 검사해주는 정규표현식 객체 생성 
          
          const bool = regExp.test($target.val());
			
			if(!bool) {
				// 마지막 전화번호 4자리가 정규표현식에 위배된 경우  
				
			    $target.parent().find("div.error").show();
			
			}
			else {
				// 마지막 전화번호 4자리가 정규표현식에 맞는 경우 
			
			    $target.parent().find("div.error").hide();
			}
			
		} ); // 전화번호 hp3 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
		
	       
	    // === 생년월일 === //
	        
	    var dt = new Date();
	    var com_year = dt.getFullYear();
	    var year = "";
	    
	    // 년도 뿌려주기
	    $("#year").append("<option value=''>년도</option>");
	    // 올해 기준으로 -50년부터 +1년을 보여준다.
	    for (var i = (com_year - 50); i <= (com_year); i++) {
	      $("#year").append("<option value='" + i+ "'>" + i + " 년" + "</option>");
	    }
	    
	    // 월 뿌려주기(1월부터 12월)
	    var month;
	    $("#month").append("<option value=''>월</option>");
	    for (var i = 1; i <= 12; i++) {
	    	
	    	if(i<10){
	    		month += "<option>0"+i+"</option>";
			}
			else{
				month += "<option>"+i+"</option>";
			}
	    } 
		$("#month").html(month);
	    
	    // 일 뿌려주기(1일부터 31일)
	    var day;
	    $("#day").append("<option value=''>일</option>");
	    for (var i = 1; i <= 31; i++) {
	    	if(i<10){
	    		day += "<option>0"+i+"</option>";
			}
			else{
				day += "<option>"+i+"</option>";
			}
	    }
		$("#day").html(day);
		
	
	}); // end of $(document).ready(function() ------------------------------------
			
		
			
			
	  // >>> 수정하기 버튼을 누르면 <<<
	   function goUpdate(userid) {
		   const frm = document.frm_update;
		    frm.action = "<%= ctxPath%>/myinfo/infoUpdateEndCommit.sun"; // URL view단을 관리하는 클래스는 join클래스
		    frm.method = "post";
		    frm.submit();
	   }
			
			
			
</script>

	<form id="frm_update">
	
	
		<%-- 성별과 이름은 변경불가 변경을 원할경우 창띄우기
			이름과 생년월일은 변경이 불가합니다. 변경을 원하실 경우 고객문의센터로 연락부탁드립니다.
		 --%>
	 	
			
	        	<ul>
	        		<li>
						<label for="email">이메일주소</label>
						<input type="email" name="email" id="email" class="t_input requiredInfo" required value="${sessionScope.loginuser.email}" readonly /> 
						<div class="first_error">필수 입력란입니다.</div>
						<div class="error">이메일 주소를 입력해 주십시오.</div>
					</li>
				</ul>
			
			
		
	      <ul>
	      	<li>
	           <label >성별</label>
	           <select type="text" id="gender" name="gender" style="color: gray;" class="t_input requiredInfo"  value="${sessionScope.loginuser.gender}" required > 
	           		<option value="1" selected>여성</option>
		         	<option value="2">남성</option>
	           </select>
	        	<div class="first_error">필수 입력란입니다.</div>
	         </li>
	      </ul>
	      
	      <ul>
		      <li>
		         <label >성명</label>
		         <input type="text" id="name"name="name" class="requiredInfo t_input requiredInfo" value="${sessionScope.loginuser.name}" />
		         <div class="first_error">필수 입력란입니다.</div>
	       	  </li>
	      </ul>
	      
	      <ul style="list-style: none;">
	         <li >연락처</li>
	         <li style="width: 100%; text-align: left;" id="telNum" name="mobile">
	             <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" class="requiredInfo" readonly />&nbsp;-&nbsp;
	             <input type="text" id="hp2" name="hp2" size="6" maxlength="4" class="requiredInfo"  value="${ fn:substring(sessionScope.loginuser.mobile, 3, 7)}"/>&nbsp;-&nbsp;
	             <input type="text" id="hp3" name="hp3" size="6" maxlength="4" class="requiredInfo" value="${ fn:substring(sessionScope.loginuser.mobile, 7, 11) }"/>
	             <div class="error">휴대폰 형식이 아닙니다.</div>
	         </li>
	      </ul>
	      
	      
	      <ul>
	      	<li>
		         <span>생년월일</span>
		         <div style="text-align: left;" id="birthday" name="birthday"  value="${sessionScope.loginuser.birthday}"  readonly>
				    	<select name="year" id="year" title="년도" class="custom-select requiredInfo" value="${fn:substring(sessionScope.loginuser.birthday, 0, 4)}" readonly></select>
						<select name="month" id="month" title="월" class="custom-select requiredInfo" value="${fn:substring(sessionScope.loginuser.birthday, 5, 6)}" ></select>
						<select name="day" id="day" title="일" class="custom-select requiredInfo" value="${fn:substring(sessionScope.loginuser.birthday, 7, 8)}"></select>
						<div class="first_error">필수 입력란입니다.</div>
				</div>
			 </li>
     	  </ul>
     	  
	      
	      <button type="button" id="btn_update" class="btn">수정하기</button>
	      <%-- 이버튼을 클릭하면 infoUpdate로 이동 --%>

</form>

<jsp:include page="/minsu/footer.jsp" />