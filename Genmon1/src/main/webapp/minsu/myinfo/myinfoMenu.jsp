<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

	form#frm_infoupdate {
		border-top: solid 1px gray; 
		width: 80%;
		align-content: center;
		margin: 2% 0 10% 5%;
		padding-top: 2%;
	}	
	
	div#frm_setting {
	/* 	border: solid 1px blue;  */
		margin: 6% 0;
		width: 15%;
		line-height: 40px;
		display: inline-block;
		
	}
	div#frm_setting > ul{
		font-size: 13px;
	}

	
	span#main_menu > span >a,
	div#frm_setting > ul > a{ 
		  color: #000;
		  display:inline-block; 
		  margin:0;
		  text-transform:uppercase; 
		  text-decoration: none;
	  }
	span#main_menu > span >a:after,
	div#frm_setting > ul > a:after {
		  display:block;
		  content: '';
		  margin-top:-7px;
		  border-bottom: solid 1px black;  
		  transform: scaleX(0);  
		  transition: transform 250ms ease-in-out;
	}
	span#main_menu > span >a:after{
		margin-top:-2px;
	}
	
	span#main_menu > span >a:hover:after,
	div#frm_setting > ul > a:hover:after { 
		transform: scaleX(1); 
	}
	

	button:hover {
		cursor: pointer;
	}
	
	span#main_menu {
	  /* border: solid 1px purple; */
	    margin: 30% 30%;
	    width: 60%;
	   
	}
	
	span#main_menu > span {
		vertical-align:top;
		 margin: 0 3%;
	
	}
	
	span#main_menu > span > a{
		border: none;
		 text-decoration:none; 
		 font-size: 16px;
		 color: black;
	}

</style>



<form id="frm_infoupdate">

	<span id="main_menu">
		<span><a href="my_myinfo.jsp">회원정보</a></span>
		<span><a href="#">주문/배송</a></span>
		<span><a href="#">위시리스트</a></span>
		<span><a href="#">상품문의</a></span>
	</span>

	<div id="frm_setting">
	
		<h4>계정설정</h4>
		<ul><a href="infoUpdate1.jsp">회원정보</a></ul>
		<ul><a href="adrUpdate1.jsp">주소록</a></ul>
		<ul><a href="pwdUpdate.jsp">비밀번호 변경</a></ul>
	</div>
		
	


