<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <jsp:include page="managerManage_sidebar2.jsp" /> --%>

<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href=http://localhost:9090/scss/_buttons.scss">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>



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

 /* @media screen and (max-width: 970px) {.container-wrap {width: ;}}  */
@media screen and (max-width: 767px) { .container-wrap {width: 90%;}}
@media screen and (min-width: 1100px) { .container-wrap {width: 70%;}}
</style>
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>

<script>

$(document).ready(function(){
	
	$("textarea#message").text('안녕하세요 +"${cvo.mvo.name}"+님, 젠틀몬스터 입니다. '');
	$("textarea#message").focus();
});

</script>

        <div class="contents margin_t10" >
        <div class="row" style="margin-left: 2%">
	        <div class="column ft10 " >
	         <!-- <h3 style="font-size:14pt; " class="margin_b10">상품 문의</h3> -->
	         	<div id="question orderNo"><span class="bld">주문번호</span><span>${cvo.contactid}</span></div>
	         	<div id="question memName"><span class="bld">이름</span> <span>${cvo.fk_userid}</span></div>
	         	<div id="question memEmail"><span class="bld">이메일</span> <span>${cvo.email}</span></div>
	         	<div id="question memContext"><span class="bld">내용</span> <span>${cvo.contents}</span></div>
	         	<img class="column" width="" height="" src="" style="/* position:fixed; */  /*  border: 0.5px solid black; */">
	         </div><br>
         </div>
         	<!-- <a href="#" class="btn delete">문의삭제</a> -->
         	<div class="divider margin_b10 margin_t10"></div>
         	
         <h4 style="font-size:13pt; ">답변내용 작성</h4><br>
          <div class="column " >
         	<!-- <div id="orderNo"><span class="bld">관리자</span><span>&nbsp;&nbsp;&nbsp;젠틀몬스터</span>
         	<div id="memName"><span class="bld">이메일</span><span>&nbsp;&nbsp;&nbsp;admin@gentlemonster.com</span></div> -->
            <div class="col-md-12 form-group">
            <!-- <label for="inputContext bld"><span class="bld">내용</span></label> -->
				<textarea class="form-control" name="message" id="message" cols="30" rows="7" placeholder="내용을 입력해주세요"></textarea>
			</div>
			
         	<div class="col">
         	<a href="#" class="column btn">답변등록</a>
         	<a href="#" class="column btn">답변수정</a>
         	<a href="#" class="btn" style="float:right;" >취소</a>
         	</div>
        </div>
        </div>
          


