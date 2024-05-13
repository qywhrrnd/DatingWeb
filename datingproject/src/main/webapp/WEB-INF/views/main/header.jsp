<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">



<link rel="stylesheet" href="/resources/css/fontawesome.css">
<link rel="stylesheet"
	href="/resources/css/templatemo-eduwell-style.css">
<link rel="stylesheet" href="/resources/css/owl.css">
<link rel="stylesheet" href="/resources/css/lightbox.css">


</head>
<body>

	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="/" class="logo"> <label>데마</label>
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
				
							<li class="scroll-to-section"><a href="/#services">성공사례</a></li>
							<li class="scroll-to-section"><a href="/#courses">데마 기능 소개</a></li>

							<li class="scroll-to-section"><a href="/#simple-cta">이벤트</a></li>
							<li class="scroll-to-section"><a href="/#testimonials">이용 리뷰</a></li>
							<li class="scroll-to-section"><a href="/#contact-section">문의 하기</a></li>


							<li class="has-sub"><a href="javascript:void(0)">데마 이용하기</a>
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

									<li><a href="/member/pagelogin.do">로그인</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/member/logout.do">로그아웃</a></li>


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