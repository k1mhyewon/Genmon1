<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&display=swap" rel="stylesheet">

<style>

	* {font-family: 'Roboto Condensed', sans-serif;}
	
	.container_sq .main.seeme .text-area {
		background: none;
	}
	
	
	.main-image {
		width: 100%;
		height: 90%;
	}
	

	.text2 {
		position: absolute;
		top: 105%;
		left : 40%; 
		text-align: center;
	}
	
	
	.text-area__title {
		font-size: 24pt;
		font-weight: bold;
		color: white;
		margin-bottom: 25px;
	}
	
	.text-area__sub-title {
		font-size: 14pt;
		font-weight: bold;
		color: white;
	}
	
	.text-area__link {
		border: solid 1px white;
		padding: auto;
		color: white;
		padding: 10px 52px 10px 52px;
		background-color: rgba( 89, 89, 89, 0.2 );
		font-size: 9.5pt;
	}
	
	a:hover { text-decoration:none; color: white; }
	
	.link1 {
		margin-left: 23px;
	}
	
</style>

<%-- 인덱스 시작 --%>
<div>

<section class="main seeme font--kr active">
	<article class="main-wrapper">
		<figure>
			<img class="main-image"
				srcset="https://web-resource.gentlemonster.com/assets/stories/22_fall_campaign/image/main/main-1080-1.jpg?ver=1.1 1024w,
						https://web-resource.gentlemonster.com/assets/stories/22_fall_campaign/image/main/main-pc-1920-1-re.jpg?ver=1.0 1920w,
						https://web-resource.gentlemonster.com/assets/stories/22_fall_campaign/image/main/main-pc-2560-1-re.jpg?ver=1.0 2560w,
						https://web-resource.gentlemonster.com/assets/stories/22_fall_campaign/image/main/main-pc-3840-1-re.jpg?ver=1.0 3840w"
				sizes="(max-width:1024px) 256px"
				src="https://web-resource.gentlemonster.com/assets/stories/22_fall_campaign/image/main/main-pc-1920-1-re.jpg?ver=1.0 1920w"
				alt=""
			>
		</figure>
		<div class="text-area text2">
			<h1 class="text-area__title gm-c">22 FALL CAMPAIGN</h1>
			<div class="text-area__link-area">
				<a href="#" class="text-area__link link2">자세히 보기</a>
				<a href="#" class="text-area__link">구매하기</a>
			</div>
		</div>
	</article>
</section>
</div>
<%-- 인덱스 끝 --%>

<jsp:include page="footer.jsp" />