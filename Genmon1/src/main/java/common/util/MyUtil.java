package common.util;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {
	
	// *** ? 다음의 데이터까지 포함한 현재 URL 주소를 알려주는 메소드 생성하기 *** // 
	public static String getCurrentURL(HttpServletRequest request) {
		
		// 만약에 현재 URL이
		// http://localhost:9090/MyMVC/member/memberList.up?sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=정
		// 이라면 
		
		String currentURL = request.getRequestURL().toString();
		// http://localhost:9090/MyMVC/member/memberList.up   // ? 중심으로 왼쪽
		
		String queryString = request.getQueryString();
		// sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=정  // ? 중심으로 오른쪽 (데이터) // GET방식일 경우
		// null // POST 방식일 경우
		
		if(queryString != null) { // GET방식일경우
			currentURL += "?" + queryString;
		}
		String ctxPath = request.getContextPath();
		//    /MYMVC
		int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
		//    27       =			21			     +        6
		
		currentURL = currentURL.substring(27);
		
		return currentURL;
	}
	
}
