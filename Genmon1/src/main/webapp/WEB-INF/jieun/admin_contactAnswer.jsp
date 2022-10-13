<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>
    
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-4.6.0-dist/css/bootstrap-multiselect.min.css">



<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.2.13/dist/semantic.min.css" >
<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/modules/b4bca5d779777cff9d5c51553952a0a1.min.css" >

<style>
a {
    text-decoration: none;
}
.btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    user-select: none;
    padding: 0.375rem 0.75rem;
    line-height: 1.5;
    border-radius: 0.25rem;
}
div#question{
	margin-top: 15%;
	display: inline-block;
}
.contents{
	width: 65%;
	margin: 0 auto;
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

/* Add a background color and some padding around the form */
.container {
  border-radius: 5px;
  /* background-color: #f2f2f2; */
  padding: 20px;
}
.divider {
    border-bottom: #e0e0e0 1px solid;
    width: 100%;
}
.margin_b20 {
  	 margin-bottom: 20%;
}
.margin_b10 {
  	 margin-bottom: 10%;
}
.margin_t10 {
  	 margin-top: 10%;
}
textarea {
  width: 100%; /* Full width */
  padding: 12px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

.clearfix {
  overflow: auto;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
}
.row {
  display: flex;
}
a.btn{
		background-color: #2c2c2c; 
		color: white; 
		margin-top: 5%; 
		margin-right: 1%;
		font-size: 11pt; 
		/* max-width: 100%;  */
		text-align: center;
	}
a.delete{
	float: right
		/* padding: 3% 43%;   */
}
.ft10{
	font-size: 12pt;
}
.mg10{
	padding-bottom: 10%;
}
.bld{
	font-weight: bold;
}
div, span{
	margin-bottom: 10px;
}


.error{
		color: red;
		font-size: 9pt;
		padding-left: 10px;
		padding-bottom: 1px;
	}


///
div#question{
	margin-top: 15%;  
	display: inline-block;
}
.contents{
	width: 65%;
	margin: 0 auto;
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

/* Add a background color and some padding around the form */
.container {
  border-radius: 5px;
  /* background-color: #f2f2f2; */
  padding: 20px;
}
.divider {
    border-bottom: #e0e0e0 1px solid;
    width: 100%;
}
.margin_b20 {
  	 margin-bottom: 20%;
}
.margin_b10 {
  	 margin-bottom: 10%;
}
.margin_t10 {
  	 margin-top: 10%;
}
textarea {
  width: 100%; /* Full width */
  padding: 12px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

.clearfix {
  overflow: auto;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

.row {
  display: flex;
}
a.btn{
		background-color: #2c2c2c; 
		color: white; 
		margin-top: 5%; 
		margin-right: 1%;
		font-size: 11pt; 
		/* max-width: 100%;  */
		text-align: center;
	}
a.delete{
	float: right
		/* padding: 3% 43%;   */
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
	label{
		padding-left: 10px;
		font-size: small;
	}
	
	.insert {
    padding: 20px 30px;
    display: block;
    width: 600px;
    margin: 5vh auto;
    height: 90vh;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 200px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}
#image {background‑image:url of the image}
.placeholder{color: grey;}
select option:first-child{color: grey; display: none;}
select option{color: #555;} // bootstrap default color

btn{
	box-shadow: 0px;
}

.form-control:disabled, .form-control[readonly] {
    background-color: #efefef4d;
    opacity: 1;
}
 /* @media screen and (max-width: 970px) {.container-wrap {width: ;}}  */
@media screen and (max-width: 767px) { .container-wrap {width: 90%;}}
@media screen and (min-width: 1100px) { .container-wrap {width: 70%;}}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>


 <script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script> 
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js" ></script>

<script>

$(document).ready(function(){
	
	$("span.error").hide();
	const fixcomment = "안녕하세요. ${cvo.mvo.name}(${cvo.email})님, 젠틀몬스터 입니다.";
/* 
	
	let answerval="";
	
	if("${cvo.acontents}" != ""){

		answerval=fixcomment; 
		$("textarea#answer").val(answerval); 
		console.log('${cvo.acontents}')
	} 
*/
	
	
	
	$("textarea#answer").focus();
	//$(".must").prop("disabled", true);
	const fixlen = fixcomment.length;
	
	// 인삿말 지워지지않게 하기 
	$("textarea#answer").bind("keydown", function(e){
		 if (e.keyCode == 8 && fixlen == $(e.target).val().length  ){ // 백스페이스(backspace) 입력 제한
			 event.preventDefault()
		}
		 
		 $('#test_cnt').html("("+$(e.target).val().length+" / 1000)");
		 
	        if($(e.target).val().length > 100) {
	        	$(e.target).val($(e.target).val().substring(0, 1000));
	            $('#test_cnt').html("(1000 / 1000)");
	        }

 	});
	
	// 제출버튼 클릭시 
	$("button#btnRegister").click(function(e){
		if(confirm("답변등록을 하시겠습니까?")){
			const val = $("textarea#answer").val()
			const valtrm = val.trim()
			if( valtrm.substr(fixlen).trim() == "" ){
				$("span.error").show();
				$("textarea#answer").focus();
				return;
			}
			
			// 작성한 문의내용이 있을시 비회원인지 회원인지 구분하고 문의번호, 작성내용 넘겨주기  => 메일로 작성한 답변내용 발송
			 $.ajax({
				   url:"<%= request.getContextPath()%>/admin/adminAnswer.sun",
				   type:"POST",
				   data: {"name":"${cvo.mvo.name}",
					      "contactid":"${cvo.contactid}",
					      "contents": val},
				   dataType:"JSON",
				   success:function(json) {
					   alert(json.message);
					   if(confirm("작성한 답변에 대해 이메일 발송을 하시겠습니까?")){
						   
					   }
				   },
				   error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				   }
			 });
			
		}
	});// end of $("button#btnRegister").click(function(e){}-----
	
	
	
	// 수정버튼 클릭시 
	$("button#btnEdit").click(function(e){
		if(confirm("답변수정을 하시겠습니까?")){
			const val = $("textarea#answer").val()
			const valtrm = val.trim()
			if( valtrm.substr(fixlen).trim() == "" ){
				$("span.error").show();
				$("textarea#answer").focus();
				return;
			}
			
			// 작성한 문의내용이 있을시 비회원인지 회원인지 구분하고 문의번호, 작성내용 넘겨주기  => 메일로 작성한 답변내용 발송
			 $.ajax({
				   url:"<%= request.getContextPath()%>/admin/adminAnswerEdit.sun",
				   type:"POST",
				   data: {"contactid":"${cvo.contactid}",
					      "contents": val},
				   dataType:"JSON",
				   success:function(json) {
					   alert(json.message);
					   
				   },
				   error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				   }
			 });
			
		}
	});
	
	
	
	
});



</script>


 <div style="width:70%; margin:auto;">
    <div class="modal-content ">
      
      <div class="modal-header">
		  <h4>Q&A</h4>
	  </div>
	  <div class="modal-body">

	<form name="prodInputFrm"
	      action="<%= request.getContextPath()%>/admin/adminInsertAnswer.sun"
	      method="post"
	      enctype="multipart/form-data">


		<div class="row">
			
			<input hidden="" value="${cvo.contactid}" type="text"  name="contactid" id="contactid" readonly>
			
			<c:if test="${cvo.mvo.name != null}">
			<div class="col-md-6 form-group existhide">
				<label for="name" class="col-form-label">이름</label>
				<input class="must"value="${cvo.mvo.name}" type="text" class="form-control infoData" name="name" id="name" readonly>
			</div>
			</c:if>
			<div class="col-md-6  form-group existhide">
				<label for="email" class="col-form-label">이메일</label>
				<input class="must"value="${cvo.email}"type="text" class="form-control" name="email" id="email" readonly>
			</div>
			
			<div class="form-group existhide">
				<label for="contents" class="col-form-label">상담내용</label>
				<textarea class="form-control must" name="contents" id="contents" cols="30" rows="7" placeholder="내용을 입력해주세요" readonly>${cvo.contents}</textarea>
			</div>
			 
         	<div class="form-group existhide">
				<label class="col-form-label" for="file">첨부파일</label>&nbsp;&nbsp;
				<c:if test="${cvo.contactfile_orginFileName != null}">
	                 <a name="file" id="file" href="<%= ctxPath%>/admin/fileDownload.up?contactid=${cvo.contactid}">${cvo.prdmanual_orginFileName}</a>
	             </c:if>
	             <c:if test="${cvo.contactfile_orginFileName == null}">
	                <span style="font-size: 10pt;">첨부파일없음</span>
	             </c:if>
				<%-- <input value="" type="file" class="form-control infoData" name="pimage1" id="pimage1" onchange="previewImage(this,'View_area')"/>
				<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '>${cpvo.pimage1}</div> --%>
			</div>
			
			
			<!-- <div style="border: 1px solid grey"></div> -->
        	<br>
        	<br>
        	<br>
        	<br>
			<div style="">
			<div class="form-group existhide " >
			<label class="col-form-label" for="answer">답변내용작성</label><span class="error">답변내용을 작성해주세요</span>
        	<div class="form-group">
	     	<c:if test="${cvo.acontents != null}">
				<textarea class="form-control" name="answer" id="answer" cols="30" rows="7" placeholder="내용을 입력해주세요">${cvo.acontents}</textarea>
	     	</c:if>
	     	<c:if test="${cvo.acontents == null}">
				<textarea class="form-control" name="answer" id="answer" cols="30" rows="7" placeholder="내용을 입력해주세요">안녕하세요. ${cvo.mvo.name}(${cvo.email})님, 젠틀몬스터 입니다.</textarea>
	     	</c:if>
				<div id="test_cnt">(0 / 1000)</div>
			</div>

 
	     </div>

	     <div class="modal-footer">
	     	<c:if test="${cvo.acontents != null}">
		       <button type="button" value="register" id="btnEdit" class="btn shadow-0 btn-md btn-outline-primary "style="" >Edit</button>
	     	</c:if>
	     	<c:if test="${cvo.acontents == null}">
		       <button type="button" value="register" id="btnRegister" class="btn shadow-0 btn-md btn-outline-primary "style="" >Register</button>
	     	</c:if>
       	   <button type="reset" value="delete"  class="me-2 btn shadow-0 btn-md btn-primary btnRegister" onclick="if(confirm('답변작성을 취소하시겠습니까?'))window.close();" >delete</button>
	     </div>
	     
     
     </div>
     
	</form>
	
</div>
	</div>
     
     
    </div>




          


