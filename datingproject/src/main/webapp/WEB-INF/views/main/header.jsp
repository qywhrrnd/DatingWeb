<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--데마 -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gaegu&display=swap');
</style>

<!--데마  -->



<link rel="stylesheet" href="/resources/css/fontawesome.css">
<link rel="stylesheet"
	href="/resources/css/templatemo-eduwell-style.css">
<link rel="stylesheet" href="/resources/css/owl.css">
<link rel="stylesheet" href="/resources/css/lightbox.css">

<style>
.black-han-sans-regular {
  font-family: "Black Han Sans", sans-serif;
  font-weight: 400;
  font-style: normal;
  font-size: 40px;
}

.gaegu-regular2 {
  font-family: "Gaegu", sans-serif;
  font-weight: 500;
  font-style: normal;
  font-size: 20px;
  
  
  
}


</style>


</head>
<body>

	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="/" class="logo" style="width:20%"><img src="/resources/images/dema.png" style="width:40%; height:40%;"><label class="black-han-sans-regular">데마</label>
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
				
							<li class="scroll-to-section"><a href="/#services"><label class="gaegu-regular2">성공사례</label></a></li>
							<li class="scroll-to-section"><a href="/#courses"><label class="gaegu-regular2">데마란?</label></a></li>

							<li class="scroll-to-section"><a href="/#simple-cta"><label class="gaegu-regular2">이벤트</label></a></li>
							<li class="scroll-to-section"><a href="/#testimonials"><label class="gaegu-regular2">이용 리뷰</label></a></li>
							<li class="scroll-to-section"><a href="/#contact-section"><label class="gaegu-regular2">리뷰 하기</label></a></li>


							<li class="has-sub"><a href="javascript:void(0)"><label class="gaegu-regular2">이용하기</label></a>
								<ul class="sub-menu">
									<c:choose>
										<c:when test="${sessionScope.userid != null}">
											<li><a href="/info.do">데이트상대찾기</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="showAlert()">데이트상대찾기</a></li>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${sessionScope.userid != null}">
											<li><a href="/mypage/mypage.do">마이페이지</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="showAlert()">마이페이지</a></li>
										</c:otherwise>
									</c:choose>

								</ul></li>


							<c:choose>
								<c:when test="${sessionScope.userid == null }">

									<li><a href="/member/pagelogin.do"><label class="gaegu-regular2">로그인</label></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/member/logout.do"><label class="gaegu-regular2">로그아웃</label></a></li>


								</c:otherwise>
							</c:choose>

						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>

	</header>
</body>
</html>