<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인 화면</title>
    <!-- 파비콘 설정 -->
    <link rel="shortcut icon" href="./img/favicon.png">
    <link rel="apple-touch-icon" href="./img/favicon.png" sizes="48x48">
    <!-- 메타포 설정 -->
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 오픈그래프 설정 -->
 	 <meta name="title" content="교보문고"/>
	<meta name="description" content="꿈을 키우는 세상 교보문고는 온오프라인을 통틀어 대한민국 최고의 도서쇼핑몰이며 전자책, 음반, 기프트, 문화서비스까지 제공하는 종합문화기업입니다."/>
	<meta name="keywords" content="책, 도서, 베스트셀러, 인터넷 서점, 도서몰, 도서 검색, 도서 정보, 국내도서, 외국도서, 전자책, eBook, 이북, sam, 웹소설, 톡소다, 음반, DVD, 블루레이, 기프트, 문화행사, 강연, 사은품, 도서추천, Picks, 개인맞춤추천, 바로드림, 바로배송, 중고서점, 중고책, 교보문고, 예스24, YES24, 알라딘"/>
	
	<meta property="og:title" content="교보문고" />
	<meta property="og:description" content="꿈을 키우는 세상 교보문고는 온오프라인을 통틀어 대한민국 최고의 도서쇼핑몰이며 전자책, 음반, 기프트, 문화서비스까지 제공하는 종합문화기업입니다."/>
	<meta property="og:image" content="http://image.kyobobook.co.kr/ink/images/kyobobook_meta.png"/>
	<meta property="og:url" content="http://mobile.kyobobook.co.kr">
    <!-- 폰트 로딩 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- 필수 API 설정 -->
    <script src="./js/jquery-latest.js"></script>
    <!-- 외부 스타일 로딩-->
    <link rel="stylesheet"href="./css/reset2.css">
    <link rel="stylesheet"href="./css/normalize.css">
    
    <link rel="stylesheet"href="./css/grid.css">
    <link rel="stylesheet"href="./css/common.css">
</head>
<body>
	<div class="wrap">
<%   
		String u_id = (String) session.getAttribute("u_id");
		if (u_id!=null) {
%>
			<%-- <%@ include file='logonHeader.jsp'%> --%>
<%
		} else {
%>
			<%@ include file='header.jsp'%>
<%
		}
%>
       <div class="content fix">
           <figure class="vs">
               <ul class="img_box">
                   <li>
                   	   <p class="intro">교보문고에 오신 것을 환영합니다</p>
                       <a href="introduce.jsp">
                           <img src="./img/figure_introduce.jpg" alt="회사이미지" class="vs_img">
                       </a>
                   </li>
                   <li>
                   	   <p class="intro">아동 도서 모음</p>
                       <a href="">
                           <img src="./img/figure_introduce.jpg" alt="아동도서 목록" class="vs_img">
                       </a>
                   </li>
                   <li>
                   	   <p class="intro">교보문고 회원에게 드리는 혜택!<br>10% 할인쿠폰 받기</p>
                       <a href="">
                           <img src="./img/figure_coupon.jpg" alt="쿠폰받기" class="vs_img">
                       </a>
                   </li>
               </ul>
               <ul class="btn_box">
                   <li class="btn1"><button>이전</button></li>
                   <li class="btn2"><button>다음</button></li>
               </ul>
           </figure>
           <script src="./js/ban.js"></script>
           <section class="page fix" id="page1">
               
           </section> 
           <section class="page fix" id="page2">
               
           </section> 
           <section class="page fix" id="page3">
               
           </section>
       </div>
       <%@ include file="footer.jsp" %>
    </div>
</body>
</html>