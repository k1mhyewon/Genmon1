package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface InterCommand {
	
	// 웹 하려면 이 두개의 파라미터가 꼭 필요하고 클래스들은 얘를 재정의하면 된다
	void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
