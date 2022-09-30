<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../common/header.jsp" />

<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">

	form#joinFrm {
		display: flex;
		font-size: 14px;
		width: 500px;
		margin: 5% auto 7% auto;
   		/* border: solid 1px blue;   */
    }
    
    div#div_joinfrm {
    	font-size: 14px;
    }
    
    input.t_input {
    	margin-top:2%;
    	width: 400px;
    	text-align: left;
    	line-height: 30px;
    }
    
  	div#div_joinfrm > ul > li > label, 
  	div#div_joinfrm > section > ul > li > label {
  		display: block;
  	}
  	
  	.first_error, .error {
  		font-size: 11px;
  		color:red;
  	}
 
  	section#section_pwd >ul:last-child >li { /* 패스워드 입력조건 */
  		font-size: 10pt;
  	    line-height: 20px;
  	    color: gray;
  	}
  	
  	.custom-select{
  		border: solid 1px black;
  		display:inline-block;
  		width: 130px;
  	}
  
  	select {
  		width: 400px;
  		height:40px; 
  		margin-top:2%
  	}
  	
  	button {
  		margin-top: 3%;
  		width: 200px;
  		height: 40%;
  		text-align: center;
  		line-height: 200%;
  	}
  	
  	button:hover {
		cursor: pointer;
	}
	
	ul{
		list-style: none;
		
	}
	
	
	button#btn_idcheck{
		margin-top: 3px;
		width: 70px; 
		display:block; 
		font-size: 10px;
		background-color: #cccccc;
		border: none;
		line-height: 30px;
		
	}
  	
</style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
       
       $(document).ready(function(){
    	 
    	   
    	   $("div.error").hide();
    	   $("div.first_error").hide();
    	   $("ul#pwderrormsg").hide();
    	   
    	   // === 아이디 === //
       	   $("input#userid").blur((e) => {
       	
       		const $target = $(e.target);
            const userid = $("input#userid").val().trim;
            
            if($target.val() == "") {
            	// 아이디 입력칸이 공백인 경우
            	 $target.parent().find("div.first_error").show();
            	 $target.focus();
            }
            else {
            	// 아이디를 입력한경우
       			  $target.parent().find("div.error").hide();
       		   }
       	   }); // end of $("input#emailcheck").blur((e) => {} --------------------------------
       			   
    	   
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
       			else {
       				// 이메일이 정규표현식에 맞는 경우 
       			    $target.parent().find("div.error").hide();
       			}
              }
       	   }); // end of  $("input#name").bulr((e) => {} --------------------------------
       			   
       			   
     
       	  // === 이메일주소 확인 === //
       	   $("input#emailcheck").blur((e) => {
       	
       		const $target = $(e.target);
            const email = $("input#email").val();
            const emailcheck = $("input#emailcheck").val();
            
            if($target.val() == "") {
            	// 이메일 입력칸이 공백인 경우
            	 $target.parent().find("div.first_error").show();
            }
            else {
            	// 입력칸에 글이 들어온경우
            	 $target.parent().find("div.first_error").hide();
            	
            	if(email != emailcheck) {
       				// 이메일과 이메일확인이 일치하지 않는 경우  
       			    $target.parent().find("div.error").show();
       				$target.focus();
       			}
       			else {
       			// 이메일과 이메일확인이 일치하는 경우  
       			    $target.parent().find("div.error").hide();
       			}
              }
       	   }); // end of $("input#emailcheck").blur((e) => {} --------------------------------
       			   
       			   
       	  // === 비밀번호 === //
       	   $("input#pwd").blur((e) => {
       	
       		const $target = $(e.target);
    		const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;  //  비밀번호 정규표현식
                
            const bool = regExp.test($target.val()); //암호의 값을 정규표현식에 넣어 테스트해보기
            
            if($target.val() == "") {
            	// 비밀번호 입력칸이 공백인 경우
            	 $target.parent().find("div.first_error").show();
            }
            else {
            	// 비밀번호 입력칸에 글자가 들어온경우
            	 $target.parent().find("div.first_error").hide();
            	
            	if(!bool) {
       				// 비밀번호가 정규표현식에 위배된 경우  
       			    $target.parents().show("ul#pwderrormsg");
       				$target.focus();
       			}
       			else {
       				// 비밀번호가 정규표현식에 맞는 경우 
       			    $target.parent().find("div.error").hide();
       			}
              }
       	   }); // end of  $("input#name").bulr((e) => {} --------------------------------
       			   
       			   
     
       	  // === 비밀번호 확인 === //
       	   $("input#pwdcheck").blur((e) => {
       	
       		const $target = $(e.target);
            const pwe = $("input#pwd").val();
            const pwdcheck = $("input#pwdcheck").val();
            
            if($target.val() == "") {
            	// 이메일 입력칸이 공백인 경우
            	 $target.parent().find("div.first_error").show();
            	 $target.parent().find("ul#pwderrormsg").show();
            }
            else {
            	// 입력칸에 글이 들어온경우
            	 $target.parent().find("div.first_error").hide();
            	
            	if(pwd != pwdcheck) {
       				// 비밀번호와 비밀번호확인이 일치하지 않는 경우  
       			    $target.parent().find("ul#pwderrormsg").show();
       				$target.focus();
       			}
       			else {
       				// 비밀번호와 비밀번호확인이 일치하는 경우  
       			    $target.parent().find("div.error").hide();
       			}
              }
       	   }); // end of $("input#emailcheck").blur((e) => {} --------------------------------
       			   
       			   
       	 // === 성별 === //
       	   $("select#gender").blur((e) => {
       	
       		const $target = $(e.target);
            const userid = $("select#gender").val().trim;
            
            if($target.val() == "") {
            	// 아이디 입력칸이 공백인 경우
            	 $target.parent().find("div.first_error").show();
            	 $target.focus();
            }
            else {
            	// 아이디를 입력한경우
       			  $target.parent().find("div.error").hide();
       		   }
       	   }); // end of $("input#emailcheck").blur((e) => {} --------------------------------	   
       			   
       			   
       			   
       			   
       			   
       			   
       			   
       			   
       			   
       			   
       			   
       			   
    	
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
    <form name="joinFrm" id="joinFrm">
        <div id="div_joinfrm">
        	<span style="font-weight:bold; display:inline-block; margin-bottom: 8%; ">신규회원가입</span>
        	
        		<ul>
	        		<li>
						<label for="userid">아이디</label>
						<input type="text" name="userid" id="userid" class="t_input" style="width:330px;" required autofocus/> 
						<button type="button" name ="btn_idcheck" id="btn_idcheck" style="display: inline-block;">아이디확인</button>
						<div class="first_error">필수 입력란입니다.</div>
						<div class="error">이메일 주소를 입력해 주십시오.</div>
					</li>
				</ul>
			
	        	<ul>
	        		<li>
						<label for="email">이메일주소</label>
						<input type="email" name="email" id="email" class="t_input" required autofocus/> 
						<div class="first_error">필수 입력란입니다.</div>
						<div class="error">이메일 주소를 입력해 주십시오.</div>
					</li>
				</ul>
			
			
			<ul>
				<li>
					<label for="emailcheck">이메일주소확인</label>
					<input type="email" name="emailcheck" id="emailcheck" class="t_input" required/> 
					<div class="first_error">필수 입력란입니다.</div>
					<div class="error">이메일 주소가 일치하지 않습니다.</div>
				</li>
			</ul>
			
			
		<section id="section_pwd">
			  <ul>
			  	<li>
			         <label >비밀번호</label>
			         <input type="password" id="pwd" class="requiredInfo t_input" required/>
			         <div class="first_error">필수 입력란입니다.</div>
			         <div class="error">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
		        </li>
		      </ul>
		      
		      <ul>
		      	<li>
			         <label>비밀번호확인</label>
			         <input type="password" id="pwdcheck" class="requiredInfo t_input" required/>
			         <div class="first_error">필수 입력란입니다.</div>
			         <div class="error">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
			     </li>
		      </ul>
		      
		      <ul id="pwderrormsg">
		      <div style="font-size: 10pt; margin: 3% 8%;">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
			      	<li>최소 8자 이상</li>
			      	<li>최소 1개의 대문자 사용</li>
			      	<li>최소 1개의 소문자 사용</li>
			      	<li>최소 1개의 특수문자 사용</li>
		      </ul>
	      </section>
	      
	      
	      <ul>
	      	<li>
	           <label >성별</label>
	           <select type="text" id="gender" style="color: gray;" class="t_input" required > 
		         	<option style="color: gray;">성별을 선택해주세요</option>
		         	<option>남성</option>
		         	<option>여성</option>
	           </select>
	        	<div class="first_error">필수 입력란입니다.</div>
	         </li>
	      </ul>
	      
	      <ul>
		      <li>
		         <label >성명</label>
		         <input type="text" id="name" class="requiredInfo t_input" required/>
		         <div class="first_error">필수 입력란입니다.</div>
	       	  </li>
	      </ul>
	      
	      <ul>
	      	<li>
		         <span>생년월일</span>
		         <div style="text-align: left;" id="birth">
				    	<select name="year" id="year" title="년도" class="custom-select" onclick="setDateBox()"></select>
				    	<div class="first_error">필수 입력란입니다.</div>
						<select name="month" id="month" title="월" class="custom-select" ></select>
						<div class="first_error">필수 입력란입니다.</div>
						<select name="day" id="day" title="일" class="custom-select"></select>
						<div class="first_error">필수 입력란입니다.</div>
				</div>
			 </li>
     	  </ul>
	   
	      <ul>
		      <li>
			      	<label>국가</label>
			      	<select id="nation">
					    <option>대한민국</option>
					    <option>미국</option>
					    <option>영국</option>
						<option>중국</option>
						<option>일본</option>
						<option>베트남</option>
						<option>프랑스</option>
					</select>
					<div class="first_error">필수 입력란입니다.</div>
				</li>
	      </ul>
	      
	      
	      <ul>
		      <li>
					<div style="line-height: 30px; margin-top: 7%; font-size: 12px; width: 300px;">
						<input type="checkbox" name="all_agree" id="all_agree" />
						<span for="all_agree">전체동의</span>
		      			<br>
		      			
						<input type="checkbox" name="agree" id="agree1" />
						<span for="agree1">[필수] 만 14세 이상입니다</span>
						<br>
						
						<input type="checkbox" name="agree" id="agree2"/>
						<span for="agree2">[필수] 이용약관 동의</span>
						<br>
						
						<input type="checkbox" name="agree" id="agree3"/>
						<span for="agree3">[필수] 개인정보 수집 및 이용 동의</span>
						<br>
						
						<input type="checkbox" name="agree" id="agree4"/>
						<span for="agree4" >[선택] 마케팅 목적 개인정보 수집 및 이용 동의</span>
						<br>
						
						<input type="checkbox" name="agree" id="agree5"/>
						<span for="agree5">[선택] 마케팅 정보 수신 및 활용 동의</span>
						<br>
					</div>
				</li>
	     	 </ul>  	
	     	 
	     	 <ul>
		     	 <li>
		     	 	<div id="btn">
			     	 	<button type="button" id="btn_cancle" style="background-color: white; ">취소</button>
			     	 	<button type="button" id="btn_cancle" style="background-color: black; color:white;">계정생성</button>
		     	 	</div>
	     	 	 </li>
	     	 </ul>
	       
       </div>
   </form>
   
    <!-- 인덱스 끝 -->
    
<jsp:include page="../common/footer.jsp" />
 