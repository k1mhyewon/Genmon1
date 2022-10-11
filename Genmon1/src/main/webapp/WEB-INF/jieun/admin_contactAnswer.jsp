<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>
    

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/modules/b4bca5d779777cff9d5c51553952a0a1.min.css" >
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
<!-- Style -->
  <link rel="stylesheet" href="<%= ctxPath%>/css/style.css">



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
    background-color: transparent;
    border: 1px solid transparent;
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
.ft10{
	font-size: 12pt;
}
.mg10{
	padding-bottom: 10%;
}
.bld{
	font-weight: bold;
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


 /* @media screen and (max-width: 970px) {.container-wrap {width: ;}}  */
@media screen and (max-width: 767px) { .container-wrap {width: 90%;}}
@media screen and (min-width: 1100px) { .container-wrap {width: 70%;}}
</style>
<script src="<%= ctxPath%>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<script>

$(document).ready(function(){
	
	$("textarea#message").focus();
	$(".must").prop("disabled", true);
	
});
	
	function goAnswer() {
		$("")
	}

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
			
			<div class="col-md-6 form-group existhide">
				<label for="name" class="col-form-label">이름</label>
				<input class="must"value="${cvo.mvo.name}" type="text" class="form-control infoData" name="name" id="name" >
			</div>
			
			<div class="col-md-6  form-group existhide">
				<label for="email" class="col-form-label">이메일</label>
				<input class="must"value="${cvo.email}"type="text" class="form-control" name="email" id="email" >
			</div>
			
			<div class="form-group existhide">
				<label for="contents" class="col-form-label">상담내용</label>
				<textarea class="form-control must" name="contents" id="contents" cols="30" rows="7" placeholder="내용을 입력해주세요">${cvo.contents}</textarea>
			</div>
			 
         	<div class="form-group existhide">
				<label class="col-form-label" for="file">첨부파일</label>
				<c:if test="${cvo.contactfile_orginFileName != null}">
	                 <a name="file" id="file" href="<%= ctxPath%>/admin/fileDownload.up?contactid=${cvo.contactid}">${cvo.prdmanual_orginFileName}</a>
	             </c:if>
	             <c:if test="${cvo.contactfile_orginFileName == null}">
	                첨부파일없음
	             </c:if>
				<%-- <input value="" type="file" class="form-control infoData" name="pimage1" id="pimage1" onchange="previewImage(this,'View_area')"/>
				<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '>${cpvo.pimage1}</div> --%>
			</div>
			
			
			
        	<br>

			<div class="form-group existhide">
			<label class="col-form-label" for="answer">답변내용작성</label>
        	<div class="form-group">
				<textarea class="form-control" name="answer" id="answer" cols="30" rows="7" placeholder="내용을 입력해주세요"><span></span>안녕하세요. ${cvo.mvo.name}(${cvo.email})님, 젠틀몬스터 입니다.</textarea>
			</div>
			</div>



     <div class="modal-footer">
       <button type="button" value="register" id="btnEdit" class="btn shadow-0 btn-md btn-outline-primary "onclick="goAnswer()" >Save</button>
       <button type="reset" value="delete"  class="me-2 btn shadow-0 btn-md btn-primary btnRegister" style="" >delete</button>
     </div>
     </div>
     
	</form>
	
</div>
	</div>
     
     
    </div>




          


