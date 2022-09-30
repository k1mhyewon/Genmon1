<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/minsu/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" /> />

<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#delete").click(function(){
			alert("이 주소를 삭제하시겠습니까?");
		});
		
		
		
	});
</script>

<style>

	form#frm_infoupdate {
		margin-bottom: 10%;
	}
	
	div#frm_address {
		/* border: solid 1px orange; */
		margin: 5% 0 0 20%;
		display: inline-block;
		width: 30%;
		font-size: 12px;
		left: 20%; top: 36%;
		position: absolute;
	}
	
	button#update,
	button#delete {
		margin: 3% 0 10% 0%;
		width: 35%;
		line-height: 200%;
	}
	
	
	button:hover {
		cursor: pointer;
	}

</style>




	
	<div id="frm_address">
	
		<span style="font-size: 16px; font-weight: bold; padding-left: 8%;">기본배송지</span>
			<div style="margin-top: 5%;">
				<%-- 자동으로 들어오게 나중에 requestScope로 바꾸기 --%>
				<ul id="name" name="name">이름</ul>
				<ul id="birth" name="birth">생년월일</ul>
				<ul id="email" name="email">이메일</ul>
				<ul id="gender" name="gender">주소</ul>
				<ul id="nation"" name="nation">국가</ul>
				<button type="button" id="update" style="background-color: black; color: white; margin-left: 10%;">수정</button>
				<button type="button" id="delete" style="background-color: white;">삭제</button>
				<a href="adrAdd.jsp"><button type="button" id="adrAdd" style="background-color: black; color: white;width: 72%; margin: 0 0 30% 10%; line-height: 200%;">주소추가하기</button></a>
				<%-- <c:if test="">
	    				<div>등록된 배송지가 없습니다.</div>
	    				<button type="button" id="adrAdd" style="background-color: black; color: white;width: 72%; margin: 0 0 30% 10%; line-height: 200%;">주소추가하기</button>
	    				addrAdd파일을 넣어야한다.
	   				</c:if>
		   		--%>	
		</div>

	
	</div>
	
</form>

	<%-- 삭제기버튼을 클릭하면  --%>
<%-- *** 비밀번호 찾기 Modal(부트스트랩기능) *** --%>
<%-- 
<div class="modal fade" id="adr_delete">
    <div class="modal-dialog">
      <div class="modal-content">
      
        Modal header
        <div class="modal-header">
          <h4 class="modal-title" ></h4>
        </div>
        
        Modal body
        <div class="modal-body">
          <div id="adrdelete_check">
          	<iframe id="adr" style="border: none; width: 100%; height: 350px;" >
             </iframe>
             
          </div>
        </div>
        
        Modal footer
        <div class="modal-footer">
          <button type="button" class="btn btn-danger adrdeleteClose" data-dismiss="modal">취소</button>
           <button type="button" class="btn btn-danger adrdeleteOk" data-dismiss="modal">확인</button>
        </div>
      </div>
      
    </div>
 </div> --%>



<jsp:include page="/minsu/footer.jsp" />