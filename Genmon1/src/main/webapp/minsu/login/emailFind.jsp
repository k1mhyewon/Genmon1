<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<form id="Frm_emailfind" style="border: solid 1px red; width: 30%;">
	
		<p style="padding-left: 3%;">성명과 핸드폰번호를 입력해주세요.</p>
		
		<ul style="list-style-type: none">
			<li style="margin: 10% 0;">
				<label for="name" id="name" style="display: inline-block; margin-right: 12%;" >성명</label>
				<input type="text" id="name" name="name" size="25" style="line-height: 200%;" required />
			</li>
			
			<li>
				<label for="mobile" id="mobile" >핸드폰번호</label>
				<input type="text" id="mobile" name="mobile" size="25" style="line-height: 200%;" required />
			</li>
		</ul>
		<button type="button" id="btn_searchemail" style="background-color: black; color: white; width: 40%; margin: 4% 20%; line-height: 200%;"  >찾기</button>
		
		
		 <div class="my-3" id="div_findemailResult">
	    	<p style="margin-left: 15%;">
	      	 	 ID : <span style="color: red; font-size: 16pt; font-weight: bold; ">${requestScope.userid}</span>
	   		</p>
  		 </div>
</form>
