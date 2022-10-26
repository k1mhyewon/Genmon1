<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 폰트 -->
<link href="//db.onlinewebfonts.com/c/1ff95b1ff8fb906b63d36e68d0d07a07?family=Helvetica" rel="stylesheet" type="text/css"/>

<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>
.swiper-wrapper {
		height:auto;
	}
    div#login_container {
    margin: 100px auto;
    	width: 60%;
    }
    
    div#login_container > div>ul > li > label, p{
    	display: block;
    	font-size: 9pt;
    }
    
    .input_login {
    	width: 100%;
    	text-align: left;
    	line-height: 200%;
    	padding: 0 11.4px;
    }
    
    .titles {
	     font-size: 12pt;
	     font-weight: bold;
	     margin-bottom: 28px;
    } 
    
    
    li { list-style : none; }
    
    .form_container {
    	width: 100%;
    	height: auto;
    	margin: auto;
    }
    
    .fontSize_small {
    	font-size: 9pt;
    }
    
    .find_result_content {
    	/* border: solid 1px red; */
    	text-decoration: none;
    }
    
    .search_btn {
    	background-color: black; 
    	color: white; 
    	width: 70%;
    	margin: 0 auto; 
    	line-height: 300%;
    	font-size: 10pt;
    }
    
    ul{
    	padding-left: 0 ; 
    }
	
	.checkbox_item {
	    display: inline-block;
	    position: relative;
	    cursor: pointer;
	}
	.checkbox_item> input {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 0;
	    height: 0;
	    overflow: hidden;
    
	}
	span.checkbox_item > label {
    	padding: 5px 25px 0 0;
	}
	span.checkmark {
	    left: initial;
	    right: 0;
	    top: 6px;
	}
	.checkmark {
	    display: block;
	    position: absolute;
	    z-index: 0;
	    top: 1px;
	    left: 0;
	    width: 15px;
	    height: 15px;
	    border: 1px solid #343434;
	}
	.checkbox_item > input:checked ~ .checkmark:after {
	    content: '';
	    display: block;
	    position: absolute;
	    z-index: 5;
	    top: 4px;
	    left: 2px;
	    margin-top: -2px;
	    width: 9px;
	    height: 9px;
	    border: 1px solid #000;
	    background: #000;
	}

	.box_content {
	    width: 100%;
	    margin-bottom: 200px;
	}
	
	.error{
		color: red;
		font-size: 7pt;
		padding-left: 10px;
		padding-bottom: 1px;
	}
	a.btn{
		background-color: #000; 
		color: white; 
		font-size: 11pt; 
		width: 100px;
		text-align: center;
		margin: 30.5px 5px 0 0;
    	height: 40px;
    	border: solid 1px #000;
    	border-radius: 0;
		}
	.btn:hover {
     color: white;
    text-decoration: none;
	}
</style>

<script src="<%=ctxPath %>/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="<%=ctxPath %>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		
		$("input#pwd").focus();
		$("span.error").hide();
		
		$("input#pwd").bind("keyup",(e)=>{
			if(e.keyCode == 13){ 
				funcGoDelete();			
			}
		});
		
	});
	
	 
	
	// 조회하기 버튼클릭 
	function funcGoDelete() {
		
       	if(confirm("해당 문의글을 삭제하시겠습니까?")){
       		const pwd = $("input#pwd").val();
       		const contactid = "${contactid}";
        	//alert(contactid);
   			$.ajax({
   				url:"<%= request.getContextPath()%>/customerCare/contact/contactDeleteJSON.sun",
   				data:{"contactid":contactid,
   					  "pwd":pwd},
   				dataType:"JSON",
   				success:function(json){
   					alert(json.message);
   					window.close();
   				},
   				error: function(request, status, error){
   					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
   				}
   				
   			});
      }
	}// end of function funcGoDelete() {}
	
	// 취소버튼
	function funcCancel(){
		if(confirm("문의글삭제를 취소하시겠습니까?")){
			window.close();
		}
	}	
	
	
</script>



<div class="box_content " style="margin: 0 auto; margin-bottom: 100px;">
        <div id="login_container">
        	<div class="titles" style="text-align:center;font-size: 15pt;">문의 삭제</div>
        	<div class="row ">
		 		<div class="col-md-12 form-group">비밀번호<span class="error">비밀번호를 입력해주세요</span>
				  <input type="password" id="pwd" name="pwd" class="form-control must password" maxlength="20" >
		 		</div>
		 		<div class="col-md-6">
		           	<a style="display:inline-block;float:right;"href="#" class="col-md-6 btn margin_b50" onclick="funcGoDelete()">삭제하기</a>
					<a style="display:inline-block;float:right;background-color: white;color:black;"href="#" class="col-md-6 btn margin_b50"  onclick="funcCancel()">취소하기</a>
				</div>
			</div>
        </div>
   </div>
    
    
    
        	


