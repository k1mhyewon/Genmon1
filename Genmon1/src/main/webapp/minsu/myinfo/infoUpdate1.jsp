<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/minsu/header.jsp" />
<jsp:include page="myinfo_sideMenu.jsp" />

<style type="text/css">

	button.btn {
		background-color: black; 
		color: white;
		width: 70%;
		display: block;
		line-height: 200%;
		margin: 7% 0 -2% 10%;
	}
	
	div#menu_myinfoupdate {
		/* border: solid 1px orange; */
		margin: 5% 0 10% 30%;
		display: inline-block;
		width: 30%;
		font-size: 12px;
	}
	

</style>

	<div id="menu_myinfoupdate">
		<ul id="gender" name="gender">성별&nbsp;&nbsp;: </ul>
		<ul id="name" name="name">성명&nbsp;&nbsp;: </ul>
		<ul id="birth" name="birth">생년월일&nbsp;&nbsp;: </ul>
		<ul id="email" name="email">이메일&nbsp;&nbsp;: </ul>
		<a href="pwdInput.jsp" style="text-decoration: none;"><button type="button" id="btn_update" class="btn" >수정하기</button></a>
		<button type="button" id="btn_update" class="btn"  data-toggle="modal" data-target="#accountDropout" data-dismiss="modal" data-backdrop="static">회원 탈퇴하기</button>
	</div>

</form>

<jsp:include page="/minsu/footer.jsp" />

<%-- *** 회원탈퇴하기 찾기 Modal(부트스트랩기능) *** --%>

<div class="modal fade" id="accountDropout">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal header -->
        <div class="modal-header">
          <h4 class="modal-title" >회원탈퇴 안내</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div id="notice">
          	<iframe id="pwFind" style="border: none; width: 100%; height: 350px;" src="<%= request.getContextPath()%>/login/pwdFind.up">
             </iframe>
             
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger cancle" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-danger agree" data-dismiss="modal">확인</button>
        </div>
      </div>
      
    </div>
 </div>

