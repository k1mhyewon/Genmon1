<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>
<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<jsp:include page="../common/header.jsp" />
<jsp:include page="customerService.jsp" />

<style>
	.swiper-wrapper {
			height:auto;
		}
	/* Style inputs with type="text", select elements and textareas */
	input[type=text], select, textarea {
	  width: 100%; /* Full width */
	  padding: 10px; /* Some padding */ 
	  border: 1px solid #ccc; /* Gray border */
	  border-radius: 4px; /* Rounded borders */
	  box-sizing: border-box; /* Make sure that padding and width stays in place */
	  margin-bottom: 16px; /* Bottom margin */
	  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
	}
	
	/* Style the submit button with a specific background color etc */
	input[type=submit] {
	  display: block;
	  background-color: #505050;
	  color: white;
	  padding: 10px 20px;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	}
	
	/* When moving the mouse over the submit button, add a darker green color */
	input[type=submit]:hover {
	  background-color: #45a049;
	}
	
	
	div.body{
	    margin: 40px 0;
	}
	a.btn{
		background-color: #000; 
		color: white; 
		font-size: 11pt; 
		width: 200px;
		text-align: center;
		margin: 30.5px 5px 0 0;
    	height: 40px;
    	border: solid 1px #000;
    	border-radius: 0;
		}
	div.questionFrm , div.form{
		width: 80%;
		margin-bottom: 100px;
	}
	input[type=text]#password, input[type=password]#password{
		width: 40%; /* Full width */
	  padding: 5px; /* Some padding */ 
	  border: 1px solid #ccc; /* Gray border */
	  border-radius: 4px; /* Rounded borders */
	  margin: 0 ;
	}
	.error{
		color: red;
		font-size: 9pt;
		padding-left: 10px;
		padding-bottom: 1px;
	}
</style>

<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>

	$(document).ready(function() {
		$("input#name").focus();
		$("span.error").hide();
		
		// 비밀번호란에 스페이스바 입력못하게 하기 
		$("input#typePassword").keyup(function() {
			let keycode = event.keyCode;
			let val = $(this).val().trim()
			$(this).val(val);
			if(keycode == 32){
				alert("비밀번호 입력시 스페이스바는 사용하실 수 없습니다.");
			}
		});
		
		
	});// end of $(document).ready(function() {}----------------
	
	let name_flag = false;
	let email_flag = false;
	let textarea_flag = false;
	let pwd_flag = false;
	// 문의버튼 누를시 
	function funcSubmitForm() {
		
		// 필수입력사항 입력했는지 검사 
		const name = $("input#name").val().trim();
		const email = $("input#email").val().trim();
		const contents = $("textarea").val().trim();
		const password = $("input#password").val().trim();
		
		// 입력란이 채워있을경우 true 깃발
		let name_flag = name!="" ?? true;
		let email_flag = email!="" ?? true;
		let textarea_flag = contents!="" ?? true;
		let pwd_flag = password!="" ?? true;
		
		
		if(!name_flag){ // 이름 입력안했을경우  
			const inputname = $("input#name");
			inputname.focus();
			inputname.css('border','1px solid red');
			inputname.parent().find("span.error").show() // 경고 표기
			
			inputname.keydown(function(){
				inputname.parent().find("span.error").hide();
				inputname.css('border','1px solid #ccc');
				name_flag = true;
				return;
			});
		}
		else{// 이름 입력했을경우
			
			if( !email_flag ){
				const inputemail = $("input#email");
				inputemail.focus();
				inputemail.css('border','1px solid red');
				inputemail.parent().find("span.error").show() // 경고 표기
				
				inputemail.keydown(function(){
					inputemail.parent().find("span.error").hide();
					inputemail.css('border','1px solid #ccc');
					email_flag = true;
					return;
				});
			}
			else{// 이메일 입력했을경우
				
				if( !textarea_flag ){
					const inputtextarea = $("textarea");
					inputtextarea.focus();
					inputtextarea.css('border','1px solid red');
					inputtextarea.parent().find("span.error").show() // 경고 표기
					
					inputtextarea.keydown(function(){
						inputtextarea.parent().find("span.error").hide();
						inputtextarea.css('border','1px solid #ccc');
						textarea_flag = true;
						return;
					});
				}
				else{// 문의내용 입력했을경우
					
					if( !pwd_flag ){
						const inputpassword = $("input#password");
						inputpassword.focus();
						inputpassword.css('border','1px solid red');
						inputpassword.parent().find("span.error").show() // 경고 표기
						
						inputpassword.keydown(function(){
							inputpassword.parent().find("span.error").hide();
							inputpassword.css('border','1px solid #ccc');
							pwd_flag = true;
							return;
						});
					}
				}
			}
		}
		
			
		
		if( (name_flag && email_flag && textarea_flag) && pwd_flag ){
			// 정말 제출하시겠습니까?
			if(confirm("정말로 문의작성을 제출하시겠습니까?")){
				$("div.logined :input").prop("disabled", false);
				
				// 문의 제출
				const frm = document.conInputFrm;
			    frm.submit();
			};
		}
	};// end of function funcSubmitForm() {}---------------------------------
	
	
	
	// Show Password 클릭시 
	function myClick() {
	    let pwd = document.getElementById("typePassword");
	    if (pwd.type === "password") { // 패스워드입력
	        pwd.type = "text";
	    } else {
	        pwd.type = "password";
	    }
	};// end of function myClick() {}---------------------

	// 취소버튼 누를시 
	function funcCancel() {
		if(confirm("정말로 문의작성을 취소하시겠습니까?")){
			history.go(-1);
		};
	};// end of function funcCancel() {}-------------------
	
	
</script>
         
		<div class="box_content col-md-8">
            <br>
       <div class="form" style="margin-top: 10px;" >
		 <h3 style="font-size: 12pt; margin-bottom: 20px;">Contact</h3> 
		
		<form class="mb-5 " method="post" action="<%= ctxPath%>/contact/guestGoContact.sun" enctype="multipart/form-data" 
		id="contactForm" name="conInputFrm" novalidate="novalidate"style="font-size: 11pt;">

		<div class="row">
			<div class="col-md-6 form-group mb-3">
	         <label for="question"></label>
	         <select id="type" name="type">
	             <option value="delivery">배송문의</option>
	             <option value="product">상품문의</option>
	             <option value="refund">환불문의</option>
	             <option value="cancel">기타문의</option>
	         </select>
			</div>
		</div>


		<div class="row logined">
			<div class="col-md-6 form-group mb-3">
				<label for="name" class="col-form-label">이름 *</label><span class="error">이름을 입력해주세요</span>
				<input type="text" class="form-control" name="name" id="name" placeholder="Your name" >
			</div>
			<div class="col-md-6 form-group mb-3">
				<label for="email" class="col-form-label">이메일 *</label><span class="error">이메일을 입력해주세요</span>
				<input type="text" class="form-control" name="email" id="email" placeholder="Your email">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 form-group mb-3">
				<label for="contents" class="col-form-label">내용 *</label><span class="error">문의내용을 입력해주세요</span>
				<textarea class="form-control" name="contents" id="contents" cols="30" rows="8" placeholder="내용을 입력해주세요."></textarea>
			</div>
		</div>
		<div class="row ">
	 		<div class="col-md-6 form-group">Password * <span class="error">비밀번호를 입력해주세요</span>
			  <input type="password" id="typePassword" name="password" class="form-control must password" maxlength="20" >
	 		</div>
	 		<div class="col-md-6 form-group " style="padding:30px 0;">
              <input type="checkbox" id="show" onclick="myClick()" >&nbsp;&nbsp;Show Password
	 		</div>
		</div>
             <!-- Password: <input type="password" value="" name="password" id="password"> -->
         <!-- </div> -->
         <div class="row ">
         	<div class="col-md-6 form-group">
              <input type="file" id="file" name="file">
			</div>
		</div>
	</form>                    
			<a href="#" class="col-md-6 btn margin_b50" onclick="funcSubmitForm()">문의하기</a>
			<a href="#" class="col-md-6 btn margin_b50" style="background-color: white; color:black;" onclick="funcCancel()">취소하기</a>
			<span class="submitting"></span>
		</div>
	</div>

<jsp:include page="../common/footer.jsp" />
