package jieun.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MySMTPAuthenticator extends Authenticator { 
	// 우리가 구글에서 주고있는 SMTP(메일을보내줄)서버에 가야한다 
	// 근데 우리가 설정한 이메일이 진짜 사용자인지 인증해야한다... 구글에서 받아온 인증키 있잖슴
	
	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		
		// Gmail 의 경우 @gmail.com 을 제외한 아이디만 입력한다
		return new PasswordAuthentication("nowgood0913","trbizpfhstlrroas"); // 첫번째는 아이디 두번째는 앱비밀번호
		// "trbizpfhstlrroas"은 구글에 로그인 하기위한 앱비밀번호이다
		
	}
	
}
