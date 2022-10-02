<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<% String ctxPath = request.getContextPath(); %>
    
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myinfo_mainMenu.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">

<style>

/* 추가 */
	* {font-family: 'Noto Sans KR', sans-serif; !important}

    div#myPageNav{
        
        /* border: solid 1px gray; */
        padding-top: 100px;
        padding-bottom: 100px;
    }


    div#wishText{
        /* border: solid 1px green; */
        padding: 6% 0 2% 10%;
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
    	width: 150px; 
        height: 30px;
    }
    
	#empty_wishlist {
    	/* border: solid 1px pink; */
    	width: 400px;
    	height: 300px;
    	padding-top: 80px;
    	/* margin: auto; */
    	margin-left: 300px;
    	text-align: center;
    }
    
    #go_shopping {
		font-size: 10pt;
		margin: 50px 0 0 0;
		width: 300px;
		height: 40px;
	}
	

    /* 추가 */

</style>
<script>

	$(document).ready(function(){ // ==========================================================
		
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
	
	function refresh(){
		location.reload();
	}
	
	function goDelete(fk_userid, fk_pnum){ // ------------------------
		
		$.ajax({
			url:"<%= request.getContextPath()%>/member/wishlistOneDelete.sun",
			data:{ "fk_userid":fk_userid, "fk_pnum":fk_pnum },
			type: "GET",
			dataType:"text",
		    success:function(json) {
		    	
		    	alert('삭제되었습니다.');
		    	refresh();
		    	
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
			
		});
	
	} // end of function goDelete() ----------------
	
	
	function selectDelete(){ // ------------------------
		
		const chkBoxArr = [];
		
		$("input:checkbox[name='chk_each_prod']:checked").each(function() {
			chkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
			console.log(chkBoxArr);
		})
		
		
		$.ajax({
			url:"<%= request.getContextPath()%>/member/wishlistSelectDel.sun",
			data:{ "chkBoxArr":chkBoxArr },
			type: "GET",
			traditional: true,
			dataType:"text",
		    success:function(json) {
		    	
		    	alert('삭제되었습니다.');
		    	refresh();
		    	
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
			
		});
	
		
	} // end of function goDelete() ----------------
	
	
	
	
	/*
	function goDelete(fk_userid, fk_pnum){ // -----------------------------------
		
		const deleteConfirm = confirm('선택한 상품을 삭제하시겠습니까?');
		
			if (deleteConfirm) {
			 	
			    location.href="/Genmon1/member/wishlistDelete.sun?fk_userid="+fk_userid+"&fk_pnum="+fk_pnum; 
				
				alert('삭제되었습니다.');
			}
			else {
				alert('삭제가 취소되었습니다.');
			}
		
		// 위시리스트의 상품을 삭제해주는 페이지로 이동
		
		
	} // end of function goDelete() ---------------------------
	*/

</script>
    <!-- 인덱스 시작 -->
 
    <!-- 위시리스트 목록 -->

	<c:if test="${not empty requestScope.wishList }">
    	<div id="wishText">위시리스트(0)</div>
	    <div id="checkbox_choice">
	        <span type="button" class="btn btn-light btn_chkbox" id="btn_chkAll" ><input type="checkbox" class="chk_wishprod" id="chkAll" value="all" /><label for="chkAll">&nbsp;전체선택/해제</label></span>
	        <button type="button" class="btn btn-dark btn_chkbox" onClick="selectDelete()")>선택삭제</button>
	        <button type="button" class="btn btn-dark btn_chkbox">전체삭제</button>
	    </div>
		<div class="album">
			<div class="box">
				<div class="wish_container row row-cols-sm-1 row-cols-md-4">
					<c:forEach var="wishvo" items="${requestScope.wishList}">
						<div class="col">
							<input type="hidden" name="fk_userid" value="${wishvo.fk_userid}" />
							<input type="hidden" name="pnum" value="${wishvo.fk_pnum}" />
							<input type="checkbox" name="chk_each_prod" value="${wishvo.fk_pnum}" class="chk_wishprod" />
							<div class="card_body mx-1 my-3">
								<img src="../images/${wishvo.cpvo.pimage1}" class="product_img">
								<div id="productDesc">
									<p class="productName" style="font-weight: bold;">${wishvo.cpvo.parentProvo.pname}</p>
									<p class="productPrice"><fmt:formatNumber value="${wishvo.cpvo.parentProvo.price}" pattern="#,###" /> 원</p>
								</div>
								<button type="button" class="btnWish btn btn-dark">장바구니에 추가</button>
								<button type="button" class="btnWish btn btn-light" id="prod_${wishvo.fk_pnum}" onClick="goDelete('${wishvo.fk_userid}','${wishvo.fk_pnum}');">삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${empty requestScope.wishList }">
		<div id="wishText">위시리스트(0)</div>
		<div id="empty_wishlist">
			<div>위시리스트에 담긴 상품이 없습니다.</div>
			<button type="button" class="btn btn-dark" id="go_shopping">쇼핑하러가기</button>
		</div>
	</c:if>
	<div style="height: 70px;"></div>
<%-- 인덱스 끝 --%>

<jsp:include page="../common/footer.jsp" />