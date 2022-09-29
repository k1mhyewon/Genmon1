package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.MemberVO;


//얘가 모든 클래스의 부모 클래스가 될거임

// 얘를 추상 클래스로 만들었기 때문에 interface의 메소드들을 오버라이딩 안해도 됨
// => 근데 이제 이 부모 클래스를 상속받는 자식 클래스(실제로 쓰는 클래스들)에서는 excute메소드를 오버라이딩 해야함
public abstract class AbstractController implements InterCommand {

	/*
	    === 다음의 나오는 것은 우리끼리한 약속이다. ===
	
	    ※ view 단 페이지(.jsp)로 이동시 forward 방법(dispatcher)으로 이동시키고자 한다라면 
	       자식클래스에서는 부모클래스에서 생성해둔 메소드 호출시 아래와 같이 하면 되게끔 한다.
	     
	      super.setRedirect(false); 
	      super.setViewPage("/WEB-INF/index.jsp");
	    
	    
	    ※ URL 주소를 변경하여 페이지 이동시키고자 한다라면
	      즉, sendRedirect 를 하고자 한다라면    
	      자식클래스에서는 부모클래스에서 생성해둔 메소드 호출시 아래와 같이 하면 되게끔 한다.
	          
	      super.setRedirect(true);
	      super.setViewPage("registerMember.up");               
	*/   
	
	private boolean isRedirect = false;
	// isRedirect 변수의 값이 false 이라면 view단 페이지(.jsp)로  forward 방법(dispatcher)으로 이동시키겠다. 
	// isRedirect 변수의 값이 true 이라면 sendRedirect 로 페이지이동을 시키겠다.
	
	private String viewPage;
	// viewPage 는 isRedirect 값이 false 이라면 view단 페이지(.jsp)의 경로명 이고,
	// isRedirect 값이 true 이라면 이동해야할 페이지 URL 주소 이다.

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getViewPage() {
		return viewPage;
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// 로그인 유무를 검사해서 로그인 했으면 true를 리턴해주고 만약에 로그인을 안했으면 false를 리턴해주도록 하겠다
	
	public boolean checkLogin( HttpServletRequest request) { // 세션영역을 조회해야하니까 파라미터로 HttpServletRequest request를 받아오도록 하자
		
		HttpSession sesssion = request.getSession();
		MemberVO loginuser = (MemberVO)sesssion.getAttribute("loginuser");
		
		if(loginuser !=null) { // 로그인 한경우
			return true;
			
		} else { // 로그인 안한 경우
			return false;
		}
	}
	
	
	
	
}
