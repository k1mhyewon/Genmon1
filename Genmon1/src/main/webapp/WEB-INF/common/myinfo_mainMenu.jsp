<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath =request.getContextPath();  %>
<style>

	div#frm_myinfoMainmenu {
		/* border-top: solid 1px gray;  */
		align-content: center;
		margin: 0% 0%;
		padding: 2%;
	}	
	
	span#main_menu > span > a{ 
		  color: #000;
		  display:inline-block; 
		  text-transform:uppercase; 
		  text-decoration: none;
	 }
	  
	span#main_menu > span >a:after {
		  display:block;
		  content: '';
		  margin-top:3px;
		  border-bottom: solid 1px black;
		  transform: scaleX(0);  
		  transition: transform 250ms ease-in-out;
	}
	
	span#main_menu > span >a:hover:after { 
		transform: scaleX(1); 
	}
	

	button:hover {
		cursor: pointer;
	}
	
	span#main_menu {
	  /*  border: solid 1px purple;  */
	   margin: 30px 0 0 650px;
	    
	}
	
	span#main_menu > span {
		/* border: solid 1px gray; */
		margin-right: 3%;
	}
	
	span#main_menu > span > a {
		 border: none;
		 text-decoration:none; 
		 font-size: 16px;
		 color: black;
	}

</style>



<div id="frm_myinfoMainmenu">
	<span id="main_menu">
		<span><a href="my_myinfo.jsp">회원정보</a></span>
		<span id="order_deli"><a href="javascript:location.href='<%=ctxPath %>/myinfo/orderList.sun'">주문/배송</a></span>
		<span><a href="#">위시리스트</a></span>
		<span><a href="#">상품문의</a></span>
	</span>

</div>		
	


