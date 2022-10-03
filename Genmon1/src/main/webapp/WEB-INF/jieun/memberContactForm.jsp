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
	  margin-top: 6px; /* Add a top margin */
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
</style>

<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>

	$(document).ready(function() {
		
		const name = "${sessionScope.loginuser.name}"
		const email = "${sessionScope.loginuser.email}"
		$("input#name").val(name);
		$("input#email").val(email);
		$("div.logined :input").prop("disabled", true);
		
	});

	// Show Password 클릭시 
	function myClick() {
	    let pwd = document.getElementById("myInput");
	    if (pwd.type === "password") { // 패스워드입력
	        pwd.type = "text";
	    } else {
	        pwd.type = "password";
	    }
	}

	// 취소버튼 누를시 
	function funcCancel() {
		if(confirm("정말로 문의작성을 취소하시겠습니까?")){
			history.go(-1);
		};
	};
	
	// 문의버튼 누를시 
	function funcSubmitForm() {
		// 정말 제출하시겠습니까?
		if(confirm("정말로 문의작성을 제출하시겠습니까?")){
			$("div.logined :input").prop("disabled", false);
			
			// 문의 제출
			const frm = document.form;
		    frm.action = "<%= ctxPath%>/contact/memberGoContact.sun";
		    frm.method = "post";
		    frm.submit();
		    
		};
		
	};
</script>
         
		<div class="box_content col-md-8">
            <br>
       <div class="form" style="margin-top: 10px;" >
		 <h3 style="font-size: 12pt; margin-bottom: 20px;">Contact</h3> 
		<form class="mb-5" method="post" id="contactForm" name="contactForm" novalidate="novalidate"style="font-size: 11pt;">
		<div class="row">
		<div class="col-md-12 form-group mb-3">

		<div class="row">
		<div class="col-md-6 form-group mb-3">
         <label for="question"></label>
         <select id="type" name="type">
             <option value="delivery">배송문의</option>
             <option value="product">상품문의</option>
             <option value="refExch">환불/교환문의</option>
             <option value="cancel">취소문의</option>
         </select>
		</div>
		</div>


		<div class="row logined">
			<div class="col-md-6 form-group mb-3">
				<label for="" class="col-form-label">이름 *</label>
				<input type="text" class="form-control" name="name" id="name" placeholder="Your name">
			</div>
			<div class="col-md-6 form-group mb-3">
				<label for="" class="col-form-label">이메일 *</label>
				<input type="text" class="form-control" name="email" id="email" placeholder="Your email">
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 form-group mb-3">
			<label for="order" class="col-form-label">주문번호</label>
			<select class="custom-select valid" id="order" name="order" aria-invalid="false">
				<option selected="">Choose Orderno..</option>
				
				<%-- <c:forEach var="order" items="${sessionScope.loginUser }">
					<option value="$1000 below">&lt; $1,000</option>
				</c:forEach> --%>
				
				<option value="$1000 below">&lt; $1,000</option>
				<option value="$2,000 - $5,000">$2,000 - $5,000</option>
				<option value="$5,000 - $15,000">$5,000 - $15,000</option>
				<option value="$15,000 - $25,000">$15,000 - $25,000</option>
				<option value="$25,000 >">$25,000 &gt;</option>
			</select>
			</div>
		</div>
		
		<div class="row">
		<div class="col-md-12 form-group mb-3">
		<label for="contents" class="col-form-label">내용 *</label>
		<textarea class="form-control" name="contents" id="contents" cols="30" rows="4" placeholder="Write your message"></textarea>
		</div>
		</div>
		<div class="row">
		<div class="col-md-12 form-group">
		
<!-- 		 <div class="form-group"> -->
		 	<div class="form-outline">
			  <input type="password" id="typePassword" class="form-control" />
			  <label class="form-label" for="typePassword">Password input</label>
             <input type="checkbox" onclick="myClick()">Show Password
			</div>
             <!-- Password: <input type="password" value="" name="password" id="password"> -->
         <!-- </div> -->
         
         <div class="form-group">
             <form action="/action_page.php">
                 <input type="file" id="myFile" name="file">
             </form>
         </div>
		                        
		<a href="#" class="col-md-6 btn margin_b50" onclick="funcSubmitForm()">문의하기</a>
		<a href="#" class="col-md-6 btn margin_b50" style="background-color: white; color:black;" onclick="funcCancel()">취소하기</a>
		<span class="submitting"></span>
		</div>
		</div>
		</form>
		<!-- <div id="form-message-warning mt-4"></div>
		<div id="form-message-success">
		Your message was sent, thank you!
		</div>
		</div> -->
              </div>
              
              
              
              


        </div>
    </div>
</div>
</div>

<jsp:include page="../common/footer.jsp" />
