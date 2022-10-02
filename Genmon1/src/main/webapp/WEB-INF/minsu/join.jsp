<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>
    
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
		font-size: 11px;
		background-color: #cccccc;
		border: none;
		line-height: 30px;
	}
	
	li#telNum > input {
		width: 120px;
		line-height: 30px;
		margin: 10px 0;
	}
  	
</style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


b_flag_idDuplicate_click = false;
// 아이디중복확인을 클릭했는지 알아오는 용도
   
   $(document).ready(function(){
	 
	   
	   $("div.error").hide();
	   $("div.first_error").hide();
	   $("div#pwderrormsg").hide();
	   $("div.btn_Nocheck").hide();
	   $("div#diffrent").hide();
	   
	   
	   // === 아이디 === //
   	   $("input#userid").blur((e) => {
   	
   		const $target = $(e.target);
        const userid = $("input#userid").val().trim();
        
        if($target.val() == "") {
        	// 아이디 입력칸이 공백인 경우
        	 $target.parent().find("div.first_error").show();
        	 $target.parent().find("div.error").show();
        }
        else {
        	// 아이디를 입력한경우
   			 $target.parent().find("div.error").hide();
   			 $target.parent().find("div.first_error").hide();
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
   	$("input#pwd").blur( (e)=>{
		
		const $target = $(e.target);
	
		const regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
		const bool = regExp.test( $target.val() );
		
		 if($target.val() == "") {
	        	// 이메일 입력칸이 공백인 경우
	        	 $target.parent().find("div.first_error").show();
	        	 $("div#pwderrormsg").show();
	    }
		 else {
			 
				if(!bool) {
					// 암호가 정규표현식에 위배된 경우
					$target.parent().find("div.first_error").show();
					$("div#pwderrormsg").show();
				}
				else {
					// 비밀번호 입력칸에 글자가 들어온경우
			       	$target.parent().find("div.first_error").hide();
			       	 $("div.error").hide();
				}
		 }
	
	}); // end of $("input#pwd").blur() ----------------- // 아이디가 pwd 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
   			   
 
   	  // === 비밀번호 확인 === //
   	   $("input#pwdcheck").blur((e) => {
   	
   		const $target = $(e.target);
        const pwd = $("input#pwd").val();
        const pwdcheck = $("input#pwdcheck").val();
        
        if($target.val() == "") {
        	// 이메일 입력칸이 공백인 경우
        	 $target.parent().find("div.first_error").show();
        	 $("div#pwderrormsg").show();
	    }
		 else {
			 $target.parent().find("div.first_error").hide();
        	 $("div#pwderrormsg").hide();
			 
	       	if(pwd != pwdcheck) {
	    		// 암호와 암호확인값이 다른 경우
	    		$target.parent().find("div.error").show();
	    		$("div#pwderrormsg").show();
	    		$("div#diffrent").show();
	    	}
	       	
		 }
   	   }); // end of $("input#emailcheck").blur((e) => {} --------------------------------
   			   
  
   			   
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
		
   			   
		  // === 생년 === //
	   	   $("select#year").each((e) => {
	   	
	   		const $target = $(e.target);
	        
	        if($target.ischecked) {
	        	// 성명을 입력한경우
	   			  $target.parent().find("div.error").hide();
	        
	        }
	        else {
	        	// 성명 입력칸이 공백인 경우
	   			 $("div.first_error").show();
	        	 $target.focus();
	   		   }
	   	   }); // end of $("input#emailcheck").blur((e) => {} --------------------------------	   	  
	   			   
	   			   
			   
			// === 아이디 중복확인 === //
	   		$("button#btn_idcheck").click(function(){
	   			
	   			b_flag_idDuplicate_click = true;
	   			
	   		    $.ajax({ // { }모양은 객체의미
	            	url:"<%= ctxPath%>/join/idDuplicateCheck.sun", // url: 은 항상 정해져있다. 키:"값" ==> 알고자하는 입력한 아이디가 ""경로로 보내서 아이디가 중복됐는지 알아봐주겠다
	            	data:{"userid":$("input#userid").val()}, 
				            	
	            	type:"post",  // object타입
	          //	dataType:"json", 
	          //  	async:true,		 // async:true 가 비동기 방식을 말한다. async을 생략하면 비동기방식인 기본값 async:true이다.		
	            					 //  --> 일을 idDuplicateCheck.up에 넘겨주고 다른 일을 하다가 기존일이 다끝나면 돌아와서 하던거 마저함.
	            					 // async:false 가 동기 방식이다.(지도를 사용할때는 반드시 동기방식인 async:false을 사용해야만 올바르게 사용가능하다.)
	            					 // --> 일처리가 끝날때까지 하염없이 기다림
	            					 
	            	success:function(text) { 
						//dataType:"json" 을 생략하면 
						// text는 자바스크립트가 아닌 문자열이다. text은 "{"isExists":false}" 또는 "{"isExists":true}" 되어지는 String타입이다.
						
						//dataType:"json" 을 생략하지 않고 넣어주면
						// text는 자바스크립트가 아닌 문자열이다. text은 {"{"isExists":false}"} 또는 {"{"isExists":true}"} 되어지는 Object타입이다.
						
						
						const json = JSON.parse(text);
						// JSON.parse(text); 은 JSON.parse({"isExists":false}); 또는 JSON.parse({"isExists":true} ); 와 같은 것인데
						// 그 결과물은 {"isExists":false}" 또는 {"isExists":true}와 같은 문자열을 자바스크립트 객체로 바꿔준것이다. 
						// 조심할 것은 text는 반드시 JSON형식으로 된 문자열이어야 한다.
						
	            		if(json.isExists) { // (점).isExists표기법이다.(대괄호)[isExists]표기법도 있다)
	            			// 입력한 userid가 이미 사용중이라면
	            			$("div#idcheckResult").html($("input#userid").val() + "은 중복된 ID이므로 사용불가합니다. ").css("color","red");
	            			$("input#userid").val(""); // 입력한 값 지우기
	              
	            		}
	            		else {
	            			
	            		  const userid = $("input#userid").val().trim();
	          			
	            		  if( userid != "") {
					        	// 아이디 입력칸이 공백인 경우
					        	$("div#idcheckResult").val("");
					        	 $("div.first_error").hide();
					        	 $("div#idcheckResult").html($("input#userid").val() + "은 사용가능합니다.").css("color","gray");
					        } 
	            		 
	            		}
	            	}, // end of success
	            	
	            	// 잘못되면 alert를 띄워라
	            	error: function(request, status, error){
	                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	                 }
	            	
	            });
	        }); //  end of $("button#btn_idcheck").click(function()----------------------------
	        		
			//  아이디값이 변경되면 가입하기 버튼을 클릭시 "아이디중복확인" 을 클릭했는지 클릭안했는지를 알아보기위한 용도 초기화 시키기 
			$("input#userid").bind("change",()=> { // chage는 초기화 시킴.
				let b_flag_idDuplicate_click = false;
				// "아이디중복확인" 을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도.
			});
	        
	        
   }); // end of document ready----------------------------
	   			
	 
	
   
    		
	// >>> Function Declaration <<< //
	
    // >>> select box  생년월일 표시 <<<
	  function setDateBox() {
	    var dt = new Date();
	    var year = "";
	    var com_year = dt.getFullYear();
	    // 발행 뿌려주기
	    $("#year").append("<option value=''>년도</option>");
	    // 올해 기준으로 -50년부터 +1년을 보여준다.
	    for (var y = (com_year - 50); y <= (com_year + 1); y++) {
	      $("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
	    };
	    // 월 뿌려주기(1월부터 12월)
	    var month;
	    $("#month").append("<option value=''>월</option>");
	    for (var i = 1; i <= 12; i++) {
	      $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
	    };
	    // 일 뿌려주기(1일부터 31일)
	    var day;
	    $("#day").append("<option value=''>일</option>");
	    for (var i = 1; i <= 31; i++) {
	      $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
	    };
	  }
	// === 생년월일 끝 === 
	
   // >>> 회원가입하기 버튼 = 계정생성<<<
   
   function gojoin() {
	   
	   // *** 필수입력사항에 모두 입력이 되었는지 검사하기 ***//
	   b_Flag_requiredInfo = false;
	   
	   // -- 인풋태그 --  
	    const requiredInfo_list =  document.querySelectorAll("input.requiredInfo"); // 배열과 유사하게 나옴
        for(let i=0; i<requiredInfo_list.length; i++) { // 일반 for문 사용.of는 끝까지간다. break를 못씀
        	const val = requiredInfo_list[i].value.trim();
        	if(val == "") { // 필수입력사항이 한개라도 비었을 경우
        		alert(" 필수입력사항은 모두 입력하셔야 합니다.");
    			b_Flag_requiredInfo = true;
    			return false;//break
        	}
        }// end of for
        
        if(b_Flag_requiredInfo) {
        		return; //종료
        }
        
        // -- 동의합니다. 체크박스(동의유무) --
	    const checkbox_length = $("input:checkbox[id='agree']:checked").length; 
	    
	    if(checkbox_length == 0) {
	    	alert("이용약관에 동의하셔야 합니다.");
	    	return; // 종료	
	    }	
	    
		// >>>  "아이디중복확인" 을 클릭했는지 여부 알아오기 <<< 
	    if(!b_flag_idDuplicate_click) { 
	    	// "아이디중복확인" 을 클릭 안 했을 경우 
	    	alert("아이디중복확인을 클릭하셔야 합니다.");
	    	return; // 종료
	    } 
	   console.log($("input#pwd").val());
		
	   const frm = document.joinFrm;
	    frm.action = "join.sun"; // URL view단을 관리하는 클래스는 join클래스
	    frm.method = "post";
	    frm.submit();
	   
   }
  
   
   
   
    </script>



    <!-- 인덱스 시작 -->
    <form name="joinFrm" id="joinFrm">
        <div id="div_joinfrm">
        	<span style="font-weight:bold; display:inline-block; margin-bottom: 8%; ">신규회원가입</span>
        	
        		<ul>
	        		<li>
						<label for="userid">아이디</label>
						<input type="text" name="userid" id="userid" class="t_input requiredInfo" style="width:325px;" required autofocus/> 
						<button type="button" name ="btn_idcheck" id="btn_idcheck" style="display: inline-block;">아이디확인</button>
						<div id="idcheckResult"></div>
						<div class="first_error">필수 입력란입니다.</div>
						<div class="error">아이디를 입력해 주십시오.</div>
					</li>
				</ul>
			
	        	<ul>
	        		<li>
						<label for="email">이메일주소</label>
						<input type="email" name="email" id="email" class="t_input requiredInfo" required autofocus/> 
						<div class="first_error">필수 입력란입니다.</div>
						<div class="error">이메일 주소를 입력해 주십시오.</div>
					</li>
				</ul>
			
			
			<ul>
				<li>
					<label for="emailcheck">이메일주소확인</label>
					<input type="email" name="emailcheck" id="emailcheck" class="t_input requiredInfo" required/> 
					<div class="first_error">필수 입력란입니다.</div>
					<div class="error">이메일 주소가 일치하지 않습니다.</div>
				</li>
			</ul>
			
			
		<section id="section_pwd">
			  <ul>
			  	<li>
			         <label >비밀번호</label>
			         <input type="password" id="pwd" name="pwd" class="requiredInfo t_input" required/>
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
		      
		      <div style="font-size: 10pt; margin: 3% 8%;" id="pwderrormsg">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.
			      <ul>
				      	<li>최소 8자 이상</li>
				      	<li>최소 1개의 대문자 사용</li>
				      	<li>최소 1개의 소문자 사용</li>
				      	<li>최소 1개의 특수문자 사용</li>
			      </ul>
		      </div>
		      <div id="diffrent">비밀번호가 일치하지 않습니다.</div>
	      </section>
	      
	      
	      <ul>
	      	<li>
	           <label >성별</label>
	           <select type="text" id="gender" name="gender" style="color: gray;" class="t_input requiredInfo" required > 
	           		<option value="female" selected>여성</option>
		         	<option value="male">남성</option>
	           </select>
	        	<div class="first_error">필수 입력란입니다.</div>
	         </li>
	      </ul>
	      
	      <ul>
		      <li>
		         <label >성명</label>
		         <input type="text" id="name"name="name" class="requiredInfo t_input requiredInfo" required/>
		         <div class="first_error">필수 입력란입니다.</div>
	       	  </li>
	      </ul>
	      
	      <ul style="list-style: none;">
	         <li >연락처</li>
	         <li style="width: 100%; text-align: left;" id="telNum" name="mobile">
	             <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" class="requiredInfo" readonly />&nbsp;-&nbsp;
	             <input type="text" id="hp2" name="hp2" size="6" maxlength="4" class="requiredInfo"/>&nbsp;-&nbsp;
	             <input type="text" id="hp3" name="hp3" size="6" maxlength="4" class="requiredInfo"/>
	             <div class="error">휴대폰 형식이 아닙니다.</div>
	         </li>
	      </ul>
	      
	      <ul>
	      	<li>
		         <span>생년월일</span>
		         <div style="text-align: left;" id="birth" name="birthday">
				    	<select name="year" id="year" title="년도" class="custom-select requiredInfo" onclick="setDateBox()"></select>
						<select name="month" id="month" title="월" class="custom-select requiredInfo" ></select>
						<select name="day" id="day" title="일" class="custom-select requiredInfo" ></select>
						<div class="first_error">필수 입력란입니다.</div>
				</div>
			 </li>
     	  </ul>
	   
	      <ul>
		      <li>
					<div style="line-height: 30px; margin-top: 7%; font-size: 12px; width: 300px;">
						<label for="agree">이용약관에 동의합니다</label>&nbsp;&nbsp;<input type="checkbox" id="agree" />
					</div>	
					
					<div>
						<iframe src="../minsu/agree_Join.html" width="100%" height="150px" class="box" ></iframe>
		      		</div>
				</li>
	     	 </ul>  	
	     	 
	     	 <ul>
		     	 <li>
		     	 	<div id="btn">
			     	 	<button type="button" id="btn_cancle" style="background-color: white; ">취소</button>
			     	 	<button type="button" id="btn_cancle" style="background-color: black; color:white;" onclick="gojoin()">계정생성</button>
		     	 	</div>
	     	 	 </li>
	     	 </ul>
	       
       </div>
   </form>
   
    <!-- 인덱스 끝 -->
    
<jsp:include page="../common/footer.jsp" />
 