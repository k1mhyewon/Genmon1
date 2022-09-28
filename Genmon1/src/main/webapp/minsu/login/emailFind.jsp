<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

<style type="text/css">

	button#btnFind {
		margin: auto; 
		background-color: black; 
		width: 150px; 
		line-height : 25px;
		text-align: center; 
		color: white;
		margin: 15px auto;
	}
	
	
</style>
    

<form name="emailFindFrm" style="padding: 20px 4%; align: center;">
	
	<div style="padding-left: 3%;">성명과 핸드폰번호를 입력해주세요.</div>
		
		
	<ul style="list-style-type: none">
         <li style="margin: 30px 0">
            <label for="name" style="display: inline-block; width: 90px">성명</label>
            <input type="text" name="name" id="name" size="25" placeholder="홍길동" autocomplete="off" required />
         </li>
         <li style="margin: 4px 0">
            <label for="mobile" style="display: inline-block; width: 90px">핸드폰번호</label>
            <input type="text" name="mobile" id="mobile" size="25" placeholder="010-xxxx-xxxx" autocomplete="off" required />
         </li>
   </ul>
	
	<div class="my-3">
    	<p style="text-align: center;">
      	 	<button type="button" class="btn"  id="btnFind">찾기</button>
   		</p>
   </div>
		
		 <div class="my-3" id="div_findemailResult">
	    	<p class="text-center" style="margin-left: 15px;" >
	      	 	 ID : <span style="color: red; font-size: 16pt; font-weight: bold; "><%-- ${requestScope.userid}--%></span>
	   		</p>
  		 </div>
</form>
