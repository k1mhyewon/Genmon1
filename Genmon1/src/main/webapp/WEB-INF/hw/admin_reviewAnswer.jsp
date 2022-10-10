<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <jsp:include page="managerManage_sidebar2.jsp" /> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href=http://localhost:9090/scss/_buttons.scss">

<!-- 폰트 -->
<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">



<style>

* {font-family: 'Pretendard', sans-serif; !important}

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
    background-color: #2c2c2c; 
	color: white; 
	margin-top: 5%; 
	margin-right: 1%;
	font-size: 11pt; 
	/* max-width: 100%;  */
	text-align: center;
	
}
.btn:hover{
	cursor:pointer;
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
  resize: vertical; /* Allow the user to vertically resize the textarea (not horizontally) */
  font-size: 11pt;
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
<%--
a.btn{
		background-color: #2c2c2c; 
		color: white; 
		margin-top: 5%; 
		margin-right: 1%;
		font-size: 11pt; 
		/* max-width: 100%;  */
		text-align: center;
	}
	--%>
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
		
	}); // end of $(document).ready() 
	
	
	
	
	function refresh(){
		location.reload();
	}
	
	
	
	function goUpdateReply(reviewid){
		
		const replyFrm = $("form[name=replyFrm]").serialize() ;
	
		$.ajax({
			url:"<%= request.getContextPath()%>/member/review.sun",
			data:replyFrm,
			type: "post",
			dataType:"text",
		    success:function(json) {
		    	// console.log("t성공");
		    	refresh();
		    	
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
			
		});
		
	}
	
	function godeleteReply(reviewid){
		
	
		if (confirm("리뷰 댓글을 삭제하시겠습니까?")) {
			$.ajax({
				url:"<%= request.getContextPath()%>/member/review.sun",
				data:{"reviewid":reviewid, "purpose":"replyDelete"},
				type: "post",
				dataType:"text",
			    success:function(json) {
			    	refresh();
			    	
			    },
			    error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
				
				
			});
		}
		else {
			// 취소(아니오) 버튼 클릭 시 이벤트
	        
	        return false;
		}
	}
	
	function popClose(){
		
		window.close();
		
	}

</script>

        <div class="contents margin_t10" >
        <div class="row" style="margin-left: 2%">
	        <div class="column ft10 " >
	         <!-- <h3 style="font-size:14pt; " class="margin_b10">상품 문의</h3> -->
	         	<div id="question orderNo"><span class="bld">주문상세번호</span><span>&nbsp;${rvo.fk_pk_order_detail_id}</span></div>
	         	<div id="question memName"><span class="bld">유저아이디</span> <span>&nbsp;${rvo.odvo.ovo.fk_userid}</span></div>
	         	<div id="question memEmail"><span class="bld">내용</span> <span>&nbsp;${rvo.content}</span></div>
	         	<div id="question memContext"><span class="bld">별점</span> <span style="color: rgba(250, 208, 0, 0.99)">&nbsp;${rvo.star}</span></div>
	         	<img class="column" width="" height="" src="" style="/* position:fixed; */  /*  border: 0.5px solid black; */">
	         </div><br>
         </div>
         	<!-- <a href="#" class="btn delete">문의삭제</a> -->
         	<div class="divider margin_b10 margin_t10"></div>
         	
         <h4 style="font-size:13pt; ">댓글내용 작성</h4><br>
          <div class="column " >
         	<!-- <div id="orderNo"><span class="bld">관리자</span><span>&nbsp;&nbsp;&nbsp;젠틀몬스터</span>
         	<div id="memName"><span class="bld">이메일</span><span>&nbsp;&nbsp;&nbsp;admin@gentlemonster.com</span></div> -->
            <div class="col-md-12 form-group">
            <!-- <label for="inputContext bld"><span class="bld">내용</span></label> -->
            	<form name="replyFrm" enctype="multipart/form-data">
					<textarea class="form-control" name="reply_content" id="message" cols="30" rows="7" placeholder="내용을 입력해주세요" >${rvo.reply}</textarea>
					<input type="hidden" name="reviewid" value="${rvo.reviewid}" />
					<input type="hidden" name="purpose" value="insertReply" />
				</form>
			</div>
			
         	<div class="col">
         	<c:if test="${ empty rvo.reply}">
         		<button onClick="goUpdateReply(${rvo.reviewid})" class="column btn">댓글등록</button>
         	</c:if>
         	<c:if test="${ not empty rvo.reply}">
	         	<button onClick="goUpdateReply(${rvo.reviewid})" class="column btn">댓글수정</button>
	         	<button onClick="godeleteReply(${rvo.reviewid})" class="column btn">댓글삭제</button>
         	</c:if>
         	<button onClick="popClose()" class="column btn" style="float:right;">닫기</button>
         	</div>
        </div>
        </div>
          


