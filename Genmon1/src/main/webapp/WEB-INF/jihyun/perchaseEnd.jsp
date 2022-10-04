<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../common/header.jsp" />

주문 완료 <br><br>

주문번호 ${orderid }의 주문이 완료 되었습니다 <br><br>

우리은행 1002-950-797783 (예:김지현) 으로 

가격 입금해주셔야 주문이 완료됩니다.

결제 상품 ( 테이블로 보여주기 )<br><br>



비회원 조회를 원하면 결제상품과 입력하신 이메일을 사용하여 조회해주세요<br><br>

글고 비회원이면 세션 스토리지 비워주기
<jsp:include page="../common/footer.jsp" />