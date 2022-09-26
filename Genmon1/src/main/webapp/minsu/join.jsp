<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">

	 div.container {
   		width: 70%;
   	 /* border: solid 1px blue; */
    }
    
    div#joinFrm {
     /* border: solid 1px red; */
    	margin: 10% 35%;
    	width: 50%;
    }
    
    input {
    	margin-top:2%;
    	width: 80%;
    	text-align: left;
    	line-height: 23px;
    }
    
  	div#joinFrm > ul > label, 
  	div#joinFrm > section > ul > label {
  		display: block;
  	}
  	
  	.first_error, .error {
  		font-size: 11px;
  		color:red;
  	}
 
  	section#section_pwd > div:last-child > ol { /* 패스워드 입력조건 */
  		font-size: 10pt;
  	    line-height: 2px;
  	    color: gray;
  	}
  	
  	div#birth > select{
  		border: solid 1px gray;
  		display:inline-block;
  		width: 25%;
  		padding: 8px;
  		
  	}
  	
  	div#birth > div{
  		
  		display:inline-block;
  	
  	}
  	
  	select {
  		width:80%; 
  		height:35px; 
  		margin-top:2%
  	}
  	
  	button {
  		margin-top: 10%;
  		width: 43%;
  		height: 40%;
  		text-align: center;
  		line-height: 200%;
  	}
  	
  	button:hover {
		cursor: pointer;
	}
  	
</style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
       
       $(document).ready(function(){
    	   
    	   $("div.error").hide();
    	   $("div.first_error").hide();
    	   
       	   // === 이메일주소 === //
       	   $("input#name").bulr((e) => {
       		   
       		   const $target = $(e.target);
       		   const email = $target.val().trim(); // 이메일입력칸에 입력했는지 안했는지 알아오자
       		   
       		   if(email == ""){
       			   // 공백이거나 입력하지 않은경우
       			   $("div#joinFrm : input").prop("disabled".true); // input태그의 모든칸 비활성화
       			   $target.prop("disabled".false); // 이메일창만 활성화
       			   
       			   $target.parent().find("div.first_error").show();
       			   $target.focus();
       			   
       			   
       		   }
       		   else {
       			   // 공백이 아닌 글자를 입력한경우
       			   
 			  const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
 			  const bool = regExp.test($target.val());
 			  
 			  if(!bool) { // 정규표현식에 위배된경우
 				  $("div#joinFrm : input").prop("disabled".true); // input태그의 모든칸 비활성화
        			   $target.prop("disabled".false); // 이메일창만 활성화
        			   
        			   $target.parent().find("div.error").show();
        			   $target.focus();
 			  }
 			  
 			 // 정규표현식에 맞는경우
 			  $("div#joinFrm : input").prop("disabled".false);
 			  $target.parent().find("div.first_error").hide();
 			  
       			   
       			   
       			   
       		   }
       		   
       	   }); // end of  $("input#name").bulr((e) => {}
     
    	   // === select box 연도 , 월 표시 === //
    		  setDateBox();
    		 
    		 
        	
        	
        //=== 국가선택 시작 ===
        $.get('https://restfulcountries.com/api/v1/countries?fetch_type=slim',function(countries){

            //Loop through returned result and populate countries select
            $.each(countries.data,function(key,value){
                $('#country-select')
                    .append($("<option></option>")
                        .attr("value", value.name)
                        .text(value.name));
                });
            }); // end of   $.get('https://restfulcountries.com/api/v1/countries?fetch_type=slim',function(countries) --------------
        
        }); // end of  $(document).ready(function() --------------------------------------
        		
        		
    	// >>> Function Declaration <<< //
        // select box 연도 , 월 표시
		  function setDateBox() {
		    var dt = new Date();
		    var year = "";
		    var com_year = dt.getFullYear();

		    // 발행 뿌려주기
		    $("#year").append("<option value=''>년도</option>");

		    // 올해 기준으로 -50년부터 +1년을 보여준다.
		    for (var y = (com_year - 50); y <= (com_year + 1); y++) {
		      $("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
		    }

		    // 월 뿌려주기(1월부터 12월)
		    var month;
		    $("#month").append("<option value=''>월</option>");
		    for (var i = 1; i <= 12; i++) {
		      $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
		    }

		    // 일 뿌려주기(1일부터 31일)
		    var day;
		    $("#day").append("<option value=''>일</option>");
		    for (var i = 1; i <= 31; i++) {
		      $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
		    }

		  }
		  
		/* let dd_html = "";
		for(var i=1; i<=31; i++) {
			if(i<10) {
				dd_html += "<option>0"+i+"</option>";
			}
			else {
				dd_html += "<option>"+i+"</option>";
			}
		}
		$("select#birthdd").html(dd_html);
		// === 생년월일 끝 === 
  		 */

       // === 국가선택 함수 === //
        function initStates(){
            //Get selected country name
            let country=$("#country-select").val();

            //Remove previous loaded states
            $('#state-select option:gt(0)').remove();
            $('#district-select option:gt(0)').remove();

            //Call restful countries states endpoint
            $.get('https://restfulcountries.com/api/v1/countries/'+country+'/states?fetch_type=slim',function(states){

                //Loop through returned result and populate states select
                $.each(states.data,function(key,value){
                    $('#state-select')
                        .append($("<option></option>")
                            .attr("value", value.name)
                            .text(value.name));
                });
            });
        }
        //=== 국가선택 끝 ===
    </script>



    <!-- 인덱스 시작 -->
    <div class="container">
        <div id="joinFrm">
        	<span style="font-weight:bold; display:inline-block; margin: 0 0 3% 6%; ">신규회원가입</span>
        	
        	
        	<ul>
				<label for="email">이메일주소</label>
				<input type="email" name="email" id="email" required/> 
				<div class="first_error">필수 입력란입니다.</div>
				<div class="error">이메일 주소를 입력해 주십시오.</div>
			</ul>
			
			<ul>
				<label for="emailcheck">이메일주소확인</label>
				<input type="email" name="emailcheck" id="emailcheck" required/> 
				<div class="first_error">필수 입력란입니다.</div>
				<div class="error">이메일 주소가 일치하지 않습니다.</div>
			</ul>
			
			
		<section id="section_pwd">
			  <ul>
		         <label >비밀번호</label>
		         <input type="password" id="pwd" class="requiredInfo" required/>
		         <div class="first_error">필수 입력란입니다.</div>
		         <div class="error">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
		       
		      </ul>
		      <ul>
		         <label>비밀번호확인</label>
		         <input type="password" id="pwdcheck" class="requiredInfo" required/>
		         <div class="first_error">필수 입력란입니다.</div>
		         <div class="error">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
		      </ul>
		      
		      <div id="pwderrormsg" style="font-size: 10pt;"><div style="margin: 3% 6%;">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
		      	<ol>최소 8자 이상</ol>
		      	<ol>최소 1개의 대문자 사용</ol>
		      	<ol>최소 1개의 소문자 사용</ol>
		      	<ol>최소 1개의 특수문자 사용</ol>
		      </div>
	      </section>
	      
	      
	      <ul>
	         <label >성별</label>
	         <select type="text" id="gender" style="width: 80%; required; style="color: gray;"> 
	         	<option style="color: gray;">성별을 선택해주세요</option>
	         	<option>남성</option>
	         	<option>여성</option>
	          </select>
	         <div class="first_error">필수 입력란입니다.</div>
	      </ul>
	      
	      <ul>
	         <label >성명</label>
	         <input type="text" id="name" class="requiredInfo" required/>
	         <div class="first_error">필수 입력란입니다.</div>
	      </ul>
	      
	      <ul>
	         <span>생년월일</span>
	         <div style="text-align: left;" id="birth">
			    	<select name="year" id="year" title="년도" class="custom-select"></select>
			    	<div class="first_error">필수 입력란입니다.</div>
					<select name="month" id="month" title="월" class="custom-select" style="margin-left: 2%;"></select>
					<div class="first_error">필수 입력란입니다.</div>
					<select name="day" id="day" title="일" class="custom-select" style="margin-left: 2%;"></select>
					<div class="first_error">필수 입력란입니다.</div>
				</div>
     	 </ul>
	   
	      <ul>
	      	<label>국가</label>
	      	<select id="nation" style="width: 80%;">
			    <option>대한민국</option>                        
			    <option>미국</option>
	            <option>영국</option>
				<option>중국</option>
	            <option>일본</option>
				<option>베트남</option>
	            <option>프랑스</option>
			</select>
			<div class="first_error">필수 입력란입니다.</div>
	      </ul>
	      
	      
	      <ul>
				<div style="line-height: 20px; margin-top: 7%; font-size: 12px;">
					<input type="checkbox" name="all_agree" id="all_agree" style="margin-left: -38%;"/>
					<span style="margin-left: -35%;" for="all_agree">전체동의</span>
	      			<br>
	      			
					<input type="checkbox" name="agree" id="agree1" style="margin-left: -38%;"/>
					<span for="agree1" style="margin-left: -35%;">[필수] 만 14세 이상입니다</span>
					<br>
					
					<input type="checkbox" name="agree" id="agree2"style="margin-left: -38%;"/>
					<span for="agree2" style="margin-left: -35%;">[필수] 이용약관 동의</span>
					<br>
					
					<input type="checkbox" name="agree" id="agree3"style="margin-left: -38%;"/>
					<span for="agree3" style="margin-left: -35%;">[필수] 개인정보 수집 및 이용 동의</span>
					<br>
					
					<input type="checkbox" name="agree" id="agree4"style="margin-left: -38%;"/>
					<span for="agree4" style="margin-left: -35%;">[선택] 마케팅 목적 개인정보 수집 및 이용 동의</span>
					<br>
					
					<input type="checkbox" name="agree" id="agree5"style="margin-left: -38%;"/>
					<span for="agree5" style="margin-left: -35%;">[선택] 마케팅 정보 수신 및 활용 동의</span>
					<br>
				</div>
	     	 </ul>  	
	     	 
	     	 <ul>
	     	 	<div id="btn">
		     	 	<button type="button" id="btn_cancle" style="background-color: white; ">취소</button>
		     	 	<button type="button" id="btn_cancle" style="background-color: black; color:white;">계정생성</button>
	     	 	</div>
	     	 </ul>
	       
       </div>
   </div>
   
    <!-- 인덱스 끝 -->
    
<jsp:include page="footer.jsp" />
 