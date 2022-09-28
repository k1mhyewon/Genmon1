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
	
	
	.main-images {
		width: 99%;
		height: 99%;
	}
	
	.text1 {
		position: absolute;
		top: 800px;
		left : 43%; 
	}
	
	.text2 {
		position: absolute;
		top: 1700px;
		left : 40%; 
		text-align: center;
	}
	
	.text3 {
		position: absolute;
		top: 2700px;
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
<section class="main moncler font--kr">
	<div>
	<article class="main-wrapper">
		<figure>
			<video class="main-asset main-images main-asset--pc" poster="https://web-resource.gentlemonster.com/assets/video/digital-painting/pc/poster2.jpg" autoplay playsinline muted loop crossorigin="anonymous" preload="auto">
				<source src="https://web-resource.gentlemonster.com/assets/video/digital-painting/pc/source2.mp4" type="video/mp4">
			</video>
		</figure>
		<div class="text-area text1">
			<h1 class="text-area__title gm-c">2022 ESSENTIALS</h1>
			<div class="text-area__link-area">
				<a class="text-area__link link1" href="#">구매하기</a>
			</div>
		</div>
	</article>
	</div>
</section>
	
<section class="main seeme font--kr active">
	<article class="main-wrapper">
		<figure>
			<img class="main-asset main-asset--pc main-images"
				 srcset="https://web-resource.gentlemonster.com/assets/stories/seeme/image/main/main_pad_2.jpg 1024w,
						 https://web-resource.gentlemonster.com/assets/stories/seeme/image/main/main_pc_1920_2.jpg 1920w,
						 https://web-resource.gentlemonster.com/assets/stories/seeme/image/main/main_pc_2560_2.jpg 2560w,
						 https://web-resource.gentlemonster.com/assets/stories/seeme/image/main/main_pc_3840_2.jpg 3840w"
				 sizes="(max-width:1024px) 256px"
				 src="https://web-resource.gentlemonster.com/assets/stories/seeme/image/main/main_pc_1920_2.jpg 1920w"
				 alt="">
		</figure>
		<div class="text-area text2">
			<h1 class="text-area__title gm-c">SELFIE SELECTION: SEE ME</h1>
			<div class="text-area__link-area">
				<a href="#" class="text-area__link link2">자세히 보기</a>
				<a href="#" class="text-area__link">구매하기</a>
			</div>
		</div>
	</article>
</section>
<section class="main son7 font--kr">
	<article class="main-wrapper">
		<figure>
			<video class="main-asset main-video main-asset--pc main-images" poster="https://web-resource.gentlemonster.com/assets/stories/son7/video/main/pc/poster.jpg" autoplay playsinline muted loop crossorigin="anonymous" preload="auto">
				<source src="https://web-resource.gentlemonster.com/assets/stories/son7/video/main/pc/source.mp4" type="video/mp4">
			</video>
		</figure>
		<div class="text-area text3">
			<h1 class="text-area__title">
				<span class="hidden">GENTLE MONSTER X SON7</span>
			</h1>
			<p class="text-area__sub-title font--en">Nice One Sonny, Nice One Son</p>
			<a href="#" class="text-area__link link3">자세히 보기</a>
		</div>
	</article>
</section>
<%-- 인덱스 끝 --%>

<jsp:include page="footer.jsp" />