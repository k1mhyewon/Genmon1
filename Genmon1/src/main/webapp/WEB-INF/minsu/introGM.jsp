<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% String ctxPath = request.getContextPath(); %>
 
<jsp:include page="../common/header.jsp" />


<%-- 폰트적용 --%>
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css" rel="stylesheet">

<style type="text/css">


	form#frm_intro {
		/*border: solid 1px red;*/
		width: 70%;
		margin: 3% 0 10% 15% ;
		padding: 2%;
		font-family: 'NanumBarunGothicYetHangul';
	}
	
	select#shopSearch {
		margin-left: 90%;
		border: none;
		font-weight: bold;
		width: 100px;
		text-align: center;
		
	}
	
	p {
		font-size: 13px;
		line-height: 30px;
		margin-bottom: 10%;
	}

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		// 시작하면 바로 보여주기
		showPage('하남');
		
		$( function() {
		    $( "#accordion" ).accordion();
		  } );
		
		// select 값이 바뀔때 ajax 호출하기
		$("select").change(function(){
			
			const city = $("select").val();
			showPage(city)
		});
		
		
	}); // end of $(document).ready(function() -----------------------
			
	function showPage(city){
		$.ajax({
			url:"<%= ctxPath%>/myshop/myshopdisplayJASON.sun" ,
			data:{"city":city},
		    dataType:"json",
		    success:function(json) {
		    	let html="";
		    	html+= '<section>'+
		    	
				'<video preload="none"style="width:1250px;" playsinline="" autoplay="" muted="" loop="" data-keepplaying="">'+
					'<source src="'+ json.simg +'" type="video/mp4">'+
				'</video>'+
				
				'<div id="accordion" style="display: inline-block; width: 30%; vertical-align: top; margin-top:3%;">'+
					'<h4>'+ json.sname +'</h4>'+
					'<div id="shopAdr" style="font-size: 12px;">'+ json.sadr +'</div>'+
					'<div id="shopTel" style="font-size: 12px;">'+ json.stel +'</div>'+
					'<div id="shopTime" style="font-size: 12px;">영업시간'+
						'<p>'+ json.stime +'</p>'+
					'</div>'+
				'</div>'+
			
				'<div style="display: inline-block; width: 67%; ">'+
					'<p style="margin-top: 3%;"> '+ json.sdesc +'</p>'+
				'<div>'+
		'</section>';
		
			$("div#show").html(html);
		
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
 
 </script>


<form id="frm_intro">
	
	<div>
		<img src="minsu/image/gmintro.png" style="width: 100%; " >
		<h3>브랜드소개</h3>
		<p>석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가?<br>
		   방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다.
		    그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을</p>
	</div>
	
	<div id="frm_shop">
		<span>
			<span style="margin-right: 3%;">매장찾기</span>
			<span>스토어(3)</span>
			
				<select name="shopSearch" id="shopSearch" >
					<option>하남</option>  
					<option>동탄</option>  
					<option>도산</option>  
				</select>
		</span>		
				
		<div id="show"></div>	
	<%-- 	<section>
				<img src="minsu/image/Hannam_GM_image.png"  style="width: 100%; height:auto%; margin: 2% 0;">
				<div id="accordion" style="display: inline-block; width: 30%; vertical-align: top;">
					<h4>젠틀몬스터 스타필드 하남</h4>
					<div id="shopAdr" style="font-size: 12px;">경기 하남시 미사대로 750 스타필드 하남점 1층</div>
					<div id="shopTel" style="font-size: 12px;">+82 031 8072 8236</div>
					<div id="shopTime" style="font-size: 12px;">영업시간
						<p>월요일–일요일 10:00am–10:00pm</p>
					</div>
				</div>
			
				<div style="display: inline-block; width: 67%;">
					<p>스타필드 하남 스토어는 '자기 유사성' (Self Similarity) 이라는 테마로 수학적 개념에서 영감을 받아 공간적으로 재해석한 프로젝트입니다. 
					   수학에서 자기유사성이란, 부분을 확대할 때 자기를 포함한 전체와 유사한 모습을 보여주는 성질입니다. 
					   이러한 현상과 특징에 흥미를 가지고 프랙탈구조, 만델브로집합, 줄리아 집합같은 이론들로 부터 영감을 받아 표현된 스토어 안의 다양한 조각, 이미지, 설치물은 각자의 방식으로 '확장' 이라는 가능성을 시각적으로 제시합니다. 
					   스토어 입구에 위치한 수축과 팽창을 반복하는 키네틱 설치물을 비롯하여 무한한 증식을 표현한 아트워크 영상, 로봇 설치물은 자기 유사성이라는 개념이 전달하고자하는 완전한 일치가 아닌 고도의 유사성을 젠틀몬스터의 시각으로 표현한 작업입니다. 
					   한편, 새로운 공간에는 젠틀몬스터를 비롯해 디저트로 새로운 판타지를 구현하는 '누데이크(NUDAKE)'의 국내 두번째 매장이 함께 입점합니다.
					</p>
				<div>
		</section>
		
		
			<img src="minsu/image/Dongtan_GM_image.png"  style="width: 100%; height:auto%; margin: 2% 0;">
				<div id="accordion" style="display: inline-block; width: 30%; vertical-align: top; ">
					<h4>젠틀몬스터 롯데 동탄점</h4>
					<div id="shopAdr" style="font-size: 12px;">경기도 화성시 동탄역로 160, 롯데백화점 1F</div>
					<div id="shopTel" style="font-size: 12px;">+82 031 8036 3600</div>
					<div id="shopTime" style="font-size: 12px;">영업시간
						<p>월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm</p>
					</div>
				</div>
			
				<div style="display: inline-block; width: 67%;">
					<p>젠틀몬스터 롯데 동탄 스토어는 ‘THE EVOLUTION’을 테마로, 진화의 순간, 그 중심에 있는 식물의 모습을 상상하며 디자인되었습니다.<br>
					스토어 입구에 위치한 회전운동을 반복하는 키네틱 인스톨레이션을 비롯하여 비디오 아트워크, 오브제는 
					진화의 매커니즘을 묘사하며 긴장감과 아름다움이라는 생경한 두 감정의 교차점을 경험하게합니다.
					</p>
				<div>
		</section>
		
				
		<section>
			<img src="minsu/image/Dosan_GM_image.png"  style="width: 100%; height:auto%; margin: 2% 0;">
			<div id="accordion" style="display: inline-block; width: 30%; vertical-align: top; ">
				<h4>하우스 도산</h4>
				<div id="shopAdr" style="font-size: 12px;">서울시 강남구 압구정로 46길 50</div>
				<div id="shopTel" style="font-size: 12px;">+82 070 4128 2126</div>
				<div id="shopTime" style="font-size: 12px;">영업시간
					<p>월요일–일요일 11:00am–9:00pm</p>
				</div>
			</div>
		
			<div style="display: inline-block; width: 67%;">
				<p>젠틀몬스터만의 방법으로 퓨처 리테일의 새로운 방향성을 제시하고자 합니다. <br>
				   HAUS DOSAN(하우스 도산)은 앞으로 젠틀몬스터가 선보일 또다른 퓨처리테일의 시작점입니다. 
				   해당 공간에는 젠틀몬스터와 더불어 감각적인 아름다움을 지향하는 코스메틱 브랜드 '탬버린즈'와 디저트를 통해 새로운 판타지를 구현하는 '누데이크'가 함께 입점했습니다. 
				   젠틀몬스터가 보여줄 퓨처 리테일은 HAUS DOSAN(하우스 도산)을 시작으로 중국 상하이에서 더욱 더 큰 규모의 새로운 모습으로 만나볼 수 있을 예정이며, 
				   앞으로도 소비자들은 계속하여 브랜드의 새로운 시도가 만들어낼 공간들을 마주할 수 있을 것입니다.
				</p>
			<div>
		</section> 
		
	
		
		
		
		
		--%>
		
	
	</div>
</form>


<jsp:include page="/minsu/footer.jsp" />