<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% String ctxPath = request.getContextPath(); 
   Date nowTime = new Date();
   SimpleDateFormat sf = new SimpleDateFormat(" yyyy년MM월dd일  a hh:mm:ss");
%>
 

<jsp:include page="../common/header.jsp" />

<script>

   window.onload=function(){
      
      // 꽃가루 이벤트
      $("#startButton").trigger("click");
        setTimeout(function(){
           $("#stopButton").trigger("click");
        }, 6000);
      
   }

   
   $(document).ready(function(){
      
      //비회원 주문이라면! 장바구니 비워주기
      const lguser ="${sessionScope.loginuser.userid}";
      
      if(lguser==""){
         
         <c:forEach var="cvo" items="${requestScope.ordertList}">
               var pnum = ${cvo.fk_pnum};
            if(sessionStorage.getItem("Key"+pnum)){
               sessionStorage.removeItem('Key'+pnum);
               sessionStorage.removeItem('Qty'+pnum);
            }
         </c:forEach>         
         
      }// end of 비회원 장바구니 비우기

   });// end of reday
   
   
   
     

</script>


<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>

<style>
   canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
   
   div#container {
      /* border: solid 1px #d9d9d9; */
      width:800px;
      height:350px;
      display: flex;
      margin: 2% auto 7% auto;
   }
   
   section#mysection {
      width: 600px;
       margin-top:100px;
       padding-left: 4%;
   }
   
   section#mysection > div {
      font-size: 14px;
      padding: 1%;
   }
   
   div#message {
      display: inline-block;
          margin: auto;
   }
   
   
</style>




<div id="container">
   <div id="message">

      <div style="display: inline-block;"></div>
      
      <section style="display: inline-block;" id="mysection">
         <h5 style="font-weight: bold; margin-bottom: 2%;">주문 완료</h5>
         <div>${orderid }의 주문이 완료 되었습니다.</div>
         <br>
         <c:if test="${not empty sessionScope.loginuser}">
            <div>주문내역 및 배송에 관한 안내는 <a style="color:red;  font-weight:bold; font-variant: inherit;" href="<%=ctxPath %>/myinfo/orderList.sun">주문조회</a>를 통하여 확인 가능합니다.</div>
         </c:if>
         <c:if test="${empty sessionScope.loginuser}">
            <div>주문내역 및 배송에 관한 안내는 주문번호와 이메일로 <a style="color:red; font-weight:bold; font-variant: inherit;" href="<%=ctxPath %>/login.sun">비회원 주문조회</a>를 통하여 확인 가능합니다.</div>
         </c:if>
         
         <div>주문번호 : ${orderid }</div>
         <div>주문일자 : <%= sf.format(nowTime) %> </div>
         
         <c:if test="${flag eq 'cash' }">
            <div>우리은행 1002-950-797783 (예:김지현) </div>
            <div style="color: red;">*<fmt:formatNumber value="${total }"></fmt:formatNumber>원 입금해주셔야 주문이 완료됩니다*</div>
         </c:if>
      </section>
   </div>
   
</div>



<jsp:include page="../common/footer.jsp" />

<div class="buttonContainer" style="display:hidden;">
   <button class="canvasBtn" id="stopButton" style="display:none;">Stop Confetti</button>
   <button class="canvasBtn" id="startButton" style="display:none;" >Drop Confetti</button>   
</div>

<canvas id="canvas"></canvas>