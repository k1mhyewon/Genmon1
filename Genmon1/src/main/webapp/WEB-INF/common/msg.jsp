<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	alert("${requestScope.message}"); // 메세지 출력해주기
	location.href ="${loc}"; // 페이지 이동
	
	// (부모창을) 새로고침 해야만 변경된 세션을 보여줌 (부모창이 있다면 .. 없다면 노상관)
	opener.location.reload(true);
	self.close(); // 팝업창 닫기 (본인)
	
	// opener.history.go(0);         // 부모창 새로 고침
    /*   
      location.href="javascript:history.go(-2);";  // 이전이전 페이지로 이동 
       location.href="javascript:history.go(-1);";  // 이전 페이지로 이동
       location.href="javascript:history.go(0);";   // 현재 페이지로 이동(==새로고침) 캐시에서 읽어옴.
       location.href="javascript:history.go(1);";   // 다음 페이지로 이동.
       
       location.href="javascript:history.back();";       // 이전 페이지로 이동 
       location.href="javascript:location.reload(true)"; // 현재 페이지로 이동(==새로고침) 서버에 가서 다시 읽어옴. 
       location.href="javascript:history.forward();";    // 다음 페이지로 이동.
   */
   
</script>