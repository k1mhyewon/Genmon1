<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />

<style>
    div#myPageNav{
        
        /* border: solid 1px gray; */
        padding-top: 100px;
        padding-bottom: 100px;
    }


    div#wishText{
        /* border: solid 1px green; */
        padding: 6% 0 3% 10%;
        font-size: 14pt;
        font-weight: bold;
    }
    
    #checkbox_choice {
     	/* border: solid 1px gray; */
     	padding: 0 20% 3% 0;
    	text-align: right;
        margin: auto;
    }

    button.btnWish{
        width: 250px; 
        height: 30px;
        font-size: 9pt;
        margin-bottom: 5px;
    }

    div#productDesc {
        font-size: 10pt;
        display: inline-block;
    }

    img.product_img {
        width: 250px;
        height: auto;
        margin-bottom: 10px;
    }

   .wish_container {
    	/* border: solid 1px green; */
    	width: 1400px;
    	margin: 0 auto;
    	
    }

    div.card_body {
        /* border: solid 1px pink; */
        margin: 20px 200px 20px 200px;
    }
    
    .btn_chkbox{
    	font-size: 10pt;
    	width: 160px; 
        height: 30px;
    }
    
    
    /*
    .cntbox {
    	/* border: solid 1px gray; */
    	width: 120px; 
        height: 40px;
        margin-left: 60px;
        margin-bottom: 10px;
        display: inline-block;
    }
	*/

    /* 갯수 상자 */
    
    input[type="number"] {
	  -webkit-appearance: textfield;
	  -moz-appearance: textfield;
	  appearance: textfield;
	}
	
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
	  -webkit-appearance: none;
	}
	
	.number-input {
	  border: 1px solid #ddd;
	  display: inline-flex;
	}
	
	.number-input,
	.number-input * {
	  box-sizing: border-box;
	}
	
	.number-input button {
		
	  padding-top:10px;
	  outline:none;
	  -webkit-appearance: none;
	  background-color: transparent;
	  border: none;
	  align-items: center;
	  justify-content: center;
	  width: 1rem;
	  height: 1rem;
	  cursor: pointer;
	  margin: 0;
	  position: relative;
	}
	
	.number-input button:before,
	.number-input button:after {
	  display: inline-block;
	  position: absolute;
	  content: '';
	  width: 0.6rem;
	  height: 2px;
	  background-color: gray;
	  transform: translate(-50%, -50%);
	}
	/*
	.number-input button:before{
		padding-left: 
	}*/
	.number-input button.plus:after {
	  transform: translate(-50%, -50%) rotate(90deg);
	}
	
	.number-input input[type=number] {
	  max-width: 2.5rem;
	  padding: .5rem;
	  border-top: solid #ddd;
	  border-bottom: solid #ddd;
	  border-width: 0 0;
	  font-size: 0.9rem;
	  height: 25px;
	  text-align: center;
	  color: gray;
	}
	
	#cart_added_comment {
		font-size: 9pt;
		color: red;
		margin: 5px 0 0 40px; 
	}
	
	label:hover {
	 cursor: pointer;
	}

</style>
<script>

	$(document).ready(function(){ // ==========================================================
		
		// 비회원이라면???
		const loginuser = '${sessionScope.loginuser.userid}' ;
		let allkey = "";
		let allqty = "";
		
		if(loginuser == ''){ // 로그인 안 한 경우
			let cnt1 = 0;
			let cnt2 = 0;
			for(let i=0; i<sessionStorage.length; i++) {
				// 문자열.indexOf("찾고자하는문자열")
				let key = sessionStorage.key(i);
				if(key.indexOf('Key')!=-1){  // 키 값인 경우
					let comma =  cnt1 ==0 ? "": ",";
					allkey += comma + sessionStorage.getItem(key);
					cnt1 +=1;
				} else { // 수량 값일 경우
					let comma =  cnt2 ==0 ? "": ",";
					allqty+= comma + sessionStorage.getItem(key);
					cnt2 += 1;
				}
			} // end of for
			
			//console.log("all_key"+all_key);
			//console.log("all_qty"+all_qty);
			
			// ajax로 띄우기
			
			if(sessionStorage.length>1){ // 장바구니 내역이 있을때만 조회함
				
				$.ajax({
					url:"<%= ctxPath%>/order/notMemberCartDisplayJASON.sun" ,
					type: "post",  
					data:{"sname":"HIT",
					"allkey":allkey, // 시작점을 보겠다"1" "9" "17" "25" "33"
					"allqty":allqty},
				    dataType:"json",
				    success:function(json) {
				    	
				    	let html="<div class='col'>";
				    	
				    	$.each(json, function(index, item){
									html+= "<label><input type='checkbox' class='chk_wishpro' name='sun'/><div class='card_body mx-1 my-3'>"+
														"<img src='../images/minji/전체보기/"+item.image+"' class='product_img'>"+
													"<div id='productDesc'>"+
														"<p class='productName' style='font-weight: bold;'>"+item.pname+" "+item.colname+"</p>"+
														"<p class='productPrice'>"+item.price+" 원</p>"+
													"</div>"+
													"<div class='number-input' style='margin-left: 105px; margin-top: 0;'>"+
													  "<button onclick='this.parentNode.querySelector('input[type=number]').stepDown()' ></button>"+
													  "<input  class='quantity' min='1'  name='quantity' value='"+item.qty+"' type='number'>"+
													  "<button onclick='this.parentNode.querySelector('input[type=number]').stepUp()' class='plus'></button>"+
													"</div>"+
													"<input type='hidden' class='pnum' value='"+item.pnum+"' />"+
													"<button onClick='go_purchase('"+item.pnum+"')' type='button' class='btnWish btn btn-dark'>결제하기</button>"+
													"<button onClick='deleteOne('"+item.pnum+"')' type='button' class='btnWish btn btn-light'>삭제</button>"+
												"</div></label>";
				    	}); // end of each
				    	html+= "</div>";
				    	
				    	$("div#show").html(html);
				    },
				    error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
			} // end of 장바구니 내역이 있을때만 조회함
			
			
		}// end of 비회원이라면???
		
		
		// ==== 체크박스 전체선택/전체해제 ==== //
		$("input:checkbox[id='chkAll']").click( function(e) {

			
			//	alert("확인용 : " + $(e.target).val() );
			//	alert("확인용 : " + $(this).val() );

			//	const target = $(e.target);
			//	alert("확인용 : " +target.val() );
			//	alert(`확인용 : ${target.val()}` );
			

			const target = $(e.target);
			
			// selected checked disabled => prop
			//                      나머지  => attr
			const bool = target.prop("checked");

			$("input:checkbox[name='chk_each_prod']").prop("checked", bool);
			// "name 이 person 인 모든 체크박스" 의 체크유무를 "전체선택/전체해제 체크박스" 와 동일하게 한다.
			
		}); // end of $("input:checkbox[id='chkAll']").click() --------------------------------

		
		$("input:checkbox[name='chk_each_prod']").click( (e) => {

			if( $(e.target).prop("checked") ) {
				// 클릭한 체크박스가 체크된 상태라면

				// name 이 person 인 모든 체크박스를 검사해서 모두 체크가 되어있는지 확인한다.
				let flag = false;
				$("input:checkbox[name='chk_each_prod']").each( function(index, item) {

					const b_checked = $(item).prop("checked");
					// 반복하면서 해당 체크박스가 체크되었는지 알아본다.

					if(!b_checked) { // 체크가 한개라도 풀려있는 경우
						flag = true;

						return false; // each 를 break한다.
					}

				}); // end of $("input:checkbox[name='chk_each_prod']").each() --------------------------

				if(!flag) {
					// name 이 person 인 모든 체크박스의 체크유무 검사를 마쳤을 때
					// 모든 체크박스가 체크가 된 상태라면  

					$("input:checkbox[id='chkAll']").prop("checked", true);
					// "전체선택/전체해제" 체크박스에 체크를 한다.

				}

			}
			else {
				// 클릭한 체크박스가 체크 해제된 상태라면

				$("input:checkbox[id='chkAll']").prop("checked", false);
				// "전체선택/전체해제" 체크박스에 체크를 해제한다.
				
			}


		}); // $("input:checkbox[name='chk_each_prod']").click() ----------------
		
		
		
		
	}); // end of $(document).ready() =========================================================
	
		
	// #### Function Declaration #### //
	
	
	function go_purchase(fk_pnum){ // --------------------------------
		
		let qty=$("input[name='quantity']").val();
		location.href="<%= ctxPath%>/order/cartToPurchase.sun?pnum="+fk_pnum+"&qty="+qty;
		
	} // end of go_purchase() ---------------------------------
	
	
	// 한개 상품 장바구니 DB에서 삭제하는 함수
	function deleteOne(pnum){
		$.ajax({
			url:"<%= ctxPath%>/order/cartDeleteOne.sun?pnum="+pnum ,
		//	type: "GET",  
		    dataType:"TEXT",
		    success:function(json) {
		    	window.location.reload(true);
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	} // end of 한개 상품 장바구니  DB에서 삭제하는 함수
	
	
	// 전체주문 하기 함수
	function allThings(){
		if($("input:checkbox[name='sun']").length >0){ // 장바구니가 1나라도 있을떄
			
			const arr_check = $("input:checkbox[name='sun']");
			let all_qty ="";
			let all_pnum = "";
			
			arr_check.each(function(index, item){
				var comma = (index == 0) ? "" :",";
				all_qty += comma + $(item).parent().find(".quantity").val();
				all_pnum += comma + $(item).parent().find(".pnum").val() ;
			});
			
			// console.log(all_qty);
			// console.log(all_pnum);
			
			$("input[name='all_qty']").val(all_qty);
			$("input[name='all_pnum']").val(all_pnum);
			
			const frm = document.hiddenFrm;
			
			frm.method = "post";
			frm.action ="<%= ctxPath%>/order/cartToPurchase.sun";
			frm.submit();
			
		} else {
			alert("장바구니에 상품이 없습니다");
		}
	}// end of 전체주문 하기 함수
	
	
	// 선택상품 주문 하기 함수
	function chooseThings(){
		
		if($("input:checkbox[name='sun']:checked").length >0){ // 선택된 것이 하나라도 존재하면
			
			let arr_check = [];
			arr_check = $("input:checkbox[name='sun']:checked");
			let all_qty ="";
			let all_pnum = "";
			
			arr_check.each(function(index, item){
				var comma = (index == 0) ? "" :",";
				all_qty += comma + $(item).parent().find(".quantity").val();
				all_pnum += comma + $(item).parent().find(".pnum").val() ;
			});
			
			// console.log(all_qty);
			// console.log(all_pnum);
			
			$("input[name='all_qty']").val(all_qty);
			$("input[name='all_pnum']").val(all_pnum);
			
			const frm = document.hiddenFrm;
			
			frm.method = "post";
			frm.action ="<%= ctxPath%>/order/cartToPurchase.sun";
			frm.submit();
			
		} else { // 선택된게 없을때
			alert("선택된 상품이 없습니다");
		}
		
		
	}// end of 선택상품 주문 하기 함수
	

</script>
    <!-- 인덱스 시작 -->
 
    <!-- 위시리스트 목록 -->


    <div id="wishText">장바구니(${listSize})</div>
    <%-- <c:if test="${ not empty requestScope.cartList}"> --%>
    	<div id="checkbox_choice">
        <span type="button" class="btn btn-light btn_chkbox" id="btn_chkAll" ><input type="checkbox" class="chk_wishprod" id="chkAll" value="all" /><label for="chkAll">&nbsp;전체선택/해제</label></span>
        <button type="button" class="btn btn-dark btn_chkbox" onclick="allThings()">전체상품결제</button>
        <button type="button" class="btn btn-dark btn_chkbox" onclick="chooseThings()">선택상품결제</button>
	    </div>
		<div class="album">
			<div class="box">
				<div class="wish_container row row-cols-sm-1 row-cols-md-4" id="show">
					<c:forEach var="cvo" items="${requestScope.cartList}">
						<div class="col">
						<label>
							<input type="checkbox" class="chk_wishprod" name='sun'/>
							<div class="card_body mx-1 my-3">
								<img src="../images/minji/전체보기/${cvo.allProdvo.pimage1}" class="product_img">
								<div id="productDesc">
									<p class="productName" style="font-weight: bold;">${cvo.allProdvo.parentProvo.pname}</p>
									<p class="productPrice"><fmt:formatNumber value="${cvo.allProdvo.parentProvo.price}" pattern="#,###" /> 원</p>
								</div>
								<div class="number-input" style="margin-left: 105px; margin-top: 0;">
								  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" ></button>
								  <input  class="quantity" min="1"  name="quantity" value="${cvo.qty}" type="number">
								  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
								</div>
								<input type="hidden" class="pnum" value="${cvo.fk_pnum}" />
								<button onClick="go_purchase('${cvo.fk_pnum}')" type="button" class="btnWish btn btn-dark">결제하기</button>
								<button onClick="deleteOne('${cvo.fk_pnum}')" type="button" class="btnWish btn btn-light">삭제</button>
								</div>
							</label>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
    <%-- </c:if> --%>
    <c:if test="${ empty requestScope.cartList}">
    	장바구니가 비어있습니다.
    </c:if>
	<div style="height: 50px;"></div>
<%-- 인덱스 끝 --%>
	<form name="hiddenFrm">
		<input type="hidden" name="all_qty" />
		<input type="hidden" name="all_pnum" />
	</form>

<jsp:include page="../common/footer.jsp" />