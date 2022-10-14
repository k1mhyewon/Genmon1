package jihyun.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.CartVO;
import common.model.MemberVO;
import common.model.OrderVO;
import common.model.PurchaseVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;
import jihyun.model.InterMemberDAO;
import jihyun.model.InterOrderDAO;
import jihyun.model.InterPurchaseDAO;
import jihyun.model.MemberDAO;
import jihyun.model.OrderDAO;
import jihyun.model.PurchaseDAO;

public class CardPurchaseEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		//if("post".equalsIgnoreCase(method)) {
			
			HttpSession session = request.getSession();
			
			OrderVO ovo = (OrderVO)session.getAttribute("ovo");
			InterOrderDAO odao = new OrderDAO();
			
			if(super.checkLogin(request)) { // 회원 주문 
				odao.insertOrderMember(ovo);
				
			} else { // 비회원 주문
				odao.insertOrderGuest(ovo); 
			}
			
			List<CartVO> ordertList = (List<CartVO>) session.getAttribute("ordertList");
			String orderid = odao.findOrderid(); // 주문번호 알아오기
			int total = 0;
			
			// 상품 수량 만큼 주문상세 테이블에 추가해주기
			for(CartVO cvo : ordertList) {
				int qty = cvo.getQty();
				if(qty>1) {
					for(int i =0; i<qty ; i++) {
						odao.isertOrderDetail(cvo, orderid);
					}
				} else {
					odao.isertOrderDetail(cvo, orderid);
				}
				total += (cvo.getAllProdvo().getParentProvo().getPrice()*cvo.getQty())*(100-cvo.getAllProdvo().getSalePcnt())/100;
			} // end of for
			
			
			// 상품 수량 줄어들게 하기
			Map<String, Object> map1 = new HashMap<>();
			map1.put("ordertList", ordertList);
			odao.decreaseProdQty(map1);
			
			//System.out.println(rslt);
			
			
			// 결제 테이블
			InterPurchaseDAO purdao = new PurchaseDAO();
			String str_usePoint = request.getParameter("usePoint");
			PurchaseVO purvo = new PurchaseVO();
			
			purvo.setFk_orderid(orderid);
			purvo.setPaymentAmount(total);
			
			// 포인트를 사용한경우 걸러주기 (비회원은 선택란이 없으니까 당연히 null 값임)
			if(str_usePoint != "" && Integer.parseInt(str_usePoint)!=0) { 
				
				MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
				InterMemberDAO mdao = new MemberDAO();
				
				int usePoint = Integer.parseInt(str_usePoint);
				int point = loginuser.getPoint();
				int Coin = loginuser.getCoin();
				
				if(usePoint == (point+Coin) ) { // 포인트와 적립금 전액 사용
					purvo.setUsedCoin(Coin);
					purvo.setUsedPoint(point);
					
					mdao.updateCoin(loginuser.getUserid(), 0, 0);
					
					loginuser.setPoint(0);
					loginuser.setCoin(0);
					
				} else if(usePoint>point) { // 포인트와 적립금 둘다 사용 but 전액 사용 X
					purvo.setUsedPoint(point);
					purvo.setUsedCoin(usePoint-point);
					
					mdao.updateCoin(loginuser.getUserid(), 0, Coin-usePoint+point);
					
					loginuser.setPoint(0);
					loginuser.setCoin(Coin-usePoint+point);
					
				} else if(usePoint<= point) { // 포인트만 사용
					purvo.setUsedPoint(usePoint);
					purvo.setUsedCoin(0);
					
					mdao.updateCoin(loginuser.getUserid(), point-usePoint, Coin);
					
					loginuser.setPoint(point-usePoint);
					loginuser.setCoin(Coin);
				}
				
				session.setAttribute("loginuser", loginuser);
				
			} else { // 포인트 사용 안했다면
				
				purvo.setUsedPoint(0);
				purvo.setUsedCoin(0);
			}
			
			purdao.insertCardPurchase(purvo); // 결제테이블에 insert
			
			// System.out.println("결제 테이블 : "+ n);
			
			/*
			int fk_purchaseid = purdao.findPurchaseNum(orderid); // 결제 id 알아오기
			
			// 환불 테이블에 넣어줘야 함
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("fk_purchaseid", String.valueOf(fk_purchaseid)  );
			paraMap.put("refundbank", request.getParameter("refundbank"));
			paraMap.put("refundacc", request.getParameter("refundacc"));
			paraMap.put("accname", request.getParameter("accname"));

			int m = purdao.insertRefund(paraMap);
			
			// System.out.println("환불 테이블 :"+m);
			*/

			
			
			/*
			// ===   >> SMS발송 << === //
			//   HashMap 에 받는사람번호, 보내는사람번호, 문자내용 등 을 저장한뒤 Coolsms 클래스의 send를 이용해 보냅니다.
			      
			//String api_key = "발급받은 본인의 API Key";  // 발급받은 본인 API Key
			String api_key = "NCSQDLMWNYJY9XJ2";
			
			// String api_secret = "발급받은 본인의 API Secret";  // 발급받은 본인 API Secret
			String api_secret = "5WMHUOM7E79YN1S9HY6DDLYT3BSN5A0D";  // 발급받은 본인 API Secret
			
			Message coolsms = new Message(api_key, api_secret);
		    // net.nurigo.java_sdk.api.Message 임. // @@@ import 주의!!!!
		    // 먼저 다운 받은  javaSDK-2.2.jar 를 /MyMVC/src/main/webapp/WEB-INF/lib/ 안에 넣어서  build 시켜야 함.
			
			// 문자 내용
			String smsContent = "[젠틀몬스터] \r\n "+ovo.getName()+"님, 주문번호 "+ orderid +"의 주문이 완료되었습니다";
			
			
			// == 4개 파라미터(to, from, type, text)는 필수사항이다. == 
			HashMap<String, String> map = new HashMap<>();
			map.put("to", ovo.getMobile()); // 수신번호
		    // 2020년 10월 16일 이후로 발신번호 사전등록제로 인해 등록된 발신번호로만 문자를 보내실 수 있습니다
			map.put("from", "01027588339"); // 홈페이지에 등록한 본인 명의의 번호만 가능하다
			map.put("type", "SMS"); // Message type ( SMS(단문), LMS(장문), MMS, ATA )
			map.put("text", smsContent); // 문자내용
		      
		    // 꼭써야해!!!!
			map.put("app_version", "JAVA SDK v2.2"); // application name and version
		      
		   coolsms.send(map);
			*/
			
		   
			
		   // === 메일 발송하기 === //
		   // 라이브러리 다운받고 시큐리티 파일 고치고 메일보낼 준비가 됐다면 메일 보낼 클래스를 만들어서 사용할거임
			GoogleMail mail = new GoogleMail();
			
			// 메일이 성공적으로 보내졌는지 유무를 알아오기 위한 용도
			boolean sendMailSuccess = false;
			
			SimpleDateFormat dateft = new SimpleDateFormat("yyyy-MM-dd");
			Calendar currentDate = Calendar.getInstance();
			dateft.format(currentDate.getTime());
			
			
			String subject = "[젠틀몬스터] "+dateft.format(currentDate.getTime())+" 주문 내역입니다" ;
			String title = ovo.getName() +"님의 주문번호 "+orderid+" 주문이 완료되었습니다.";
			
			String content = "<div style='width:750px;'>"
					+ "<h1 style=\"padding: 10px 0; margin: 0px;\"><img src=\"http://127.0.0.1:9090/Genmon1/images/common/Gentle_monster_logo.png\" style=\"max-width: 200px; min-width: 175px; height:30px;\"/></h1>"
					+ "<div style=\"width: 700px; color: #4e4e4e;margin: 0 auto; color: #cccccc; padding: 0;\"> \r\n"
					+ "	 <div style=\"position: relative; margin: 0; padding:0;\"> \r\n"
					+ "		 <h1 style=\"padding: 10px 0; margin: 0px;\"></h1> \r\n"
					+ "		 <span> 젠틀몬스터 제품을 구매해주셔서 감사합니다.</span>\r\n"
					+ "	</div> \r\n"
					+ "	<div style=\"padding: 13px;border: 5px solid #eee; margin-top: 20px;\"> <div style=\"margin:0;margin-bottom:10px;padding: 0;font-family:NanumBarunGothic;, nbg, dotum,sans-serif;position: relative\"> \r\n"
					+ "	<table style=\"padding: 0px;color:black; border: 0px currentColor;border-image: none;width:100%;\"> \r\n"
					+ "		<tbody>\r\n"
					+ "			<tr>\r\n"
					+ "				<td style=\"text-align:left;width:60%\"> \r\n"
					+ "					<h3 style=\"margin: 0;padding: 0;font-family:NanumBarunGothic, nbg, dotum, sans-serif;float:left;font-size: 55px;color: #000\">Purchase</h3>\r\n"
					+ "				</td>\r\n"
					+ "				<td> \r\n"
					+ "					<p style=\"margin: 0;padding:0;line-height:16px; padding-top:10px;\"> \r\n"
					+ "						<span style=\"font-family: NanumBarunGothic, nbg, dotum,sans-serif;font-weight: bold;padding-bottom: 5px\"></span><br> \r\n"
					+ "					</p>\r\n"
					+ "				</td>\r\n"
					+ "			</tr>\r\n"
					+ "		</tbody>\r\n"
					+ "	</table> \r\n"
					+ "</div>"
					+ "<table style=\"width:100%; border-top-color: rgb(183, 183,183); border-top-width: 1px;color:black; border-top-style:solid; table-layout:fixed; border-collapse:collapse; \"> \r\n"
					+ "	<colgroup><col style=\"width:20%\"><col style=\"width:80%\"></colgroup> \r\n"
					+ "	<tbody>\r\n"
					+ "		<tr><th colspan=\"1\" rowspan=\"1\" style=\"font-size:12px; font-family: Myriad SetPro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;font-weight: normal; border-bottom-color: rgb(222,222, 222); border-bottom-width: 1px;border-bottom-style: solid; color:#333;background:#f4f4f4; text-align:left;padding-top:7px; padding-left:10px;padding-bottom:5px;\">Name</th><td style=\"font-size:13px; font-family: Myriad SetPro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;border-bottom: 1px solid #dedede;padding-left:5px;\"><b>"+ovo.getName()+"</b></td></tr> \r\n"
					+ "		<tr><th colspan=\"1\" rowspan=\"1\" style=\"font-size:12px; font-family:Myriad Set Pro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;font-weight: normal; border-bottom-color: rgb(222,222, 222); border-bottom-width: 1px;border-bottom-style: solid; color:#333;background:#f4f4f4; text-align:left;padding-top:7px; padding-left:10px;padding-bottom:5px;\">Address</th><td style=\"font-size:12px; font-family: Myriad SetPro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;border-bottom: 1px solid #dedede;padding-left:5px;\">"+ovo.getAddress()+"  "+ovo.getDetailaddress()+" "+ovo.getExtraaddress()+" "+ovo.getPostcode()+"</td></tr>\r\n"
					+ "		<tr><th colspan=\"1\" rowspan=\"1\" style=\"font-size:12px; font-family:Myriad Set Pro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;font-weight: normal; border-bottom-color: rgb(222,222, 222); border-bottom-width: 1px;border-bottom-style: solid; color:#333;background:#f4f4f4; text-align:left;padding-top:7px; padding-left:10px;padding-bottom:5px;\">Tel</th><td style=\"font-size:12px; font-family: Myriad SetPro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;border-bottom: 1px solid #dedede;padding-left:5px;\">"+ovo.getMobile()+"</td></tr>\r\n"
					+ "	</tbody>\r\n"
					+ "</table> "
					+ "<div style=\"font-size:18px; color:black; font-family: MyriadSet Pro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;height:28px; padding-top:25px;\">Product Information</div> \r\n"
					+ "	<table style=\"width:100%; color:black; border-top-color:rgb(183, 183, 183); border-top-width: 1px;border-top-style: solid; table-layout:fixed;border-collapse: collapse; \"> \r\n"
					+ "		<colgroup><col style=\"width:20%\"><col style=\"width:40%\"><col style=\"width:10%\"><col style=\"width:30%\"></colgroup> \r\n"
					+ "		\r\n"
					+ "		<tbody>\r\n";
					
					// 상품 수량 만큼 테이블에 추가해주기
					for(CartVO cvo : ordertList) {
						//content+= "<tr><td><img src='http://127.0.0.1:9090/Genmon1/images/common/products/"+cvo.getAllProdvo().getPimage1()+"' style='width:100px;'/></td></tr>";	
						//content+= "<tr><td> 수량: "+cvo.getQty()+" 제품명: "+cvo.getAllProdvo().getParentProvo().getPname()+" "+cvo.getAllProdvo().getColorName()+"</td></tr>";
						content +=  "			<tr>\r\n"
								+ "				<th colspan=\"1\" rowspan=\"1\" style=\"font-size:12px; font-family:Myriad Set Pro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;font-weight: normal; border-bottom-color: rgb(222,222, 222); border-bottom-width: 1px;border-bottom-style: solid; color:#333;background:#f4f4f4; text-align:left;padding-top:7px;padding-left:10px;padding-bottom:5px;\">Product</th>\r\n"
								+ "				 	<td style=\"font-size:12px; font-family: Myriad SetPro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;border-bottom: 1px solid #dedede;padding-left:5px;\"><img src='http://127.0.0.1:9090/Genmon1/images/common/products/"+cvo.getAllProdvo().getPimage1()+"' style='width:100px;'/> </td>\r\n"
								+ "				<th colspan=\"1\" rowspan=\"1\" style=\"font-size:12px; font-family: Myriad SetPro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;font-weight: normal; border-bottom-color: rgb(222,222, 222); border-bottom-width: 1px;border-bottom-style: solid; color:#333;background:#f4f4f4; text-align:left;padding-top:7px;padding-left:10px;padding-bottom:5px;\">Name & Quantity</th>\r\n"
								+ "					<td style=\"font-size:12px; font-family: Myriad SetPro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;border-bottom: 1px solid #dedede;padding-left:5px;\">"+cvo.getAllProdvo().getParentProvo().getPname()+" "+cvo.getAllProdvo().getColorName()+"("+cvo.getQty()+")</td></tr>\r\n";

					} // end of for
					// System.out.println(content);
					
					
					content += "	</tbody>\r\n"
					+ "	</table>"
					+ "<div style=\"font-size:18px; font-family: MyriadSet Pro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;height:28px; padding-top:25px;\">Purchase details</div>\r\n"
					+ "\r\n"
					+ "<table style=\"width:100%; color:black; border-top-color:rgb(183, 183, 183); border-top-width: 1px;border-top-style: solid; table-layout:fixed;border-collapse: collapse; \"> \r\n"
					+ "	<colgroup><col style=\"width:20%\"><col><col style=\"width:20%\"><col></colgroup> \r\n"
					+ "	<tbody>\r\n"
					+ "		<tr><th colspan=\"1\" rowspan=\"1\" style=\"font-size:12px;font-family: Myriad Set Pro,LucidaGrande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;font-weight: normal; border-bottom-color: rgb(222,222, 222); border-bottom-width: 1px;border-bottom-style: solid; color:#333;background:#f4f4f4; text-align:left;padding-top:7px;padding-left:10px;padding-bottom:5px;\">Purchase No</th>\r\n"
					+ "			<td style=\"font-size:12px; font-family:Myriad Set Pro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;border-bottom: 1px solid #dedede;padding-left:5px;\" colspan=\"3\">"+orderid+"</td></tr> \r\n"
					+ "		\r\n"
					+ "		<tr><th colspan=\"1\" rowspan=\"1\" style=\"font-size:12px;font-family: Myriad Set Pro,LucidaGrande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;font-weight: normal; border-bottom-color: rgb(222,222, 222); border-bottom-width: 1px;border-bottom-style: solid; color:#333;background:#f4f4f4; text-align:left;padding-top:7px;padding-left:10px;padding-bottom:5px;\">Date</th>\r\n"
					+ "			<td style=\"font-size:12px; font-family: Myriad SetPro,Lucida Grande,HelveticaNeue,Helvetica,Arial,Verdana,sans-serif;border-bottom: 1px solid #dedede;padding-left:5px; color:#f4412d\" colspan=\"3\">"+dateft.format(currentDate.getTime())+"</td>\r\n"
					+ "		</tr> \r\n"
					+ "	</tbody>\r\n"
					+ "</table> "
					+ "<div style=\"font-family: 나눔고딕,NanumG_N;border-top: 2px solid #333; padding: 9px0px 0px 0px; margin: 32px 0px 0px 0px;\"> <table style=\"border: 0px currentColor; border-image:none;padding-top:10px\"> <tbody><tr><td style=\"width:500px;padding-left:20px\"> <em style=\"font-style: normal; font-size: 13px; font-weight:bold; letter-spacing: -1px; padding: 7px 0 0;color: #333; display: block;\">본 메일은\r\n"
					+ "발신전용 메일입니다. 문의 사항은 <a style=\"color: #ef4337; text-decoration: none;\" href=\"http://tw.monkeytravel.com/user/board/board_list.php?code=qna\" rel=\"noreferrer noopener\" target=\"_blank\">Q&amp;A</a>를\r\n"
					+ "이용해 주시기 바랍니다.</em> </td><td>\r\n"
					+ "<a style=\"color: #333; text-decoration: none;\" href=\"http://blog.naver.com/monkey_dream\" target=\"_blank\" rel=\"noreferrer noopener\"><img style=\"border-radius: 0px;border: 0; vertical-align: top;\" src=\"http://thai.monkeytravel.com/globals/common/kr/img/mail/ic_naver.gif\" alt=\"네이버블로그 바로가기\" loading=\"lazy\"></a> </td><td> <a style=\"color: #333; text-decoration:none;\" href=\"http://blog.daum.net/monkey_dream\" target=\"_blank\" rel=\"noreferrer noopener\"><img style=\"border-radius: 0px;border: 0; vertical-align: top;\" src=\"http://thai.monkeytravel.com/globals/common/kr/img/mail/ic_daumbl.gif\" alt=\"다음블로그 바로가기\" loading=\"lazy\"></a> </td><td>\r\n"
					+ "<a style=\"color: #333; text-decoration: none;\" href=\"http://blog.daum.net/monkey_dream\" target=\"_blank\" rel=\"noreferrer noopener\"><img style=\" border-radius: 0px;border: 0; vertical-align: top;\" src=\"http://thai.monkeytravel.com/globals/common/kr/img/mail/ic_face.gif\" alt=\"페이스북 바로가기\" loading=\"lazy\"></a> </td><td> <a style=\"color: #333; text-decoration: none;\" href=\"https://story.kakao.com/ch/monkeytravel\" target=\"_blank\" rel=\"noreferrer noopener\"><img style=\" border-radius: 0px;border: 0; vertical-align: top;\" src=\"http://thai.monkeytravel.com/globals/common/kr/img/mail/ic_kakaos.gif\" alt=\"페이스북 바로가기\" loading=\"lazy\"></a> </td></tr>\r\n"
					+ "</tbody></table> "
					+ "</div></div>"
					+ "<table width=\"1\" height=\"1\" border=\"0\" background=\"http://tw.monkeytravel.com/randomimg.php?idx=1669908\"><tbody><tr><td>&nbsp;</td></tr></tbody></table>\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "</div>";
			
			try {
				mail.sendmail(ovo.getEmail(), content, title, subject); // 구글메일 클래스 안의 메일 보내기 메소드 사용
				sendMailSuccess =  true; // 메일전송이 성공했음을 기록함
				
			} catch (Exception e) { 
				// 메일전송이 실패한 경우 여기에 온다
				e.printStackTrace();
				sendMailSuccess = false; // 메일전송이 실패했음을 기록함
			}
			
			// System.out.println(sendMailSuccess);
			
			
			
			// 회원 장바구니 비워주기 
			if(super.checkLogin(request)) {
				
				InterCartDAO cdao = new CartDAO();
				int dc =cdao.deleteOrderedList(ordertList, ovo.getFk_userid());
				
				System.out.println(dc);
			}
			
			
			
			
			request.setAttribute("orderid", orderid);
			request.setAttribute("ordertList", ordertList);
			
			// 세션 다음 페이지에서 보여주고  버려줘야대 
			session.removeAttribute("ovo"); // 주문테이블
			session.removeAttribute("ordertList"); // 주문 상품목록
			request.setAttribute("flag", "card");
			
			super.setViewPage("/WEB-INF/jihyun/perchaseEnd.jsp");
		//}
	}

}
