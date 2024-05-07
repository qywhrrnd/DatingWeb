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

<script>
	function showAlert() {
		alert("로그인이 필요합니다.");
		window.location.href = '/member/pagelogin.do';
	}
</script>

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
							<li class="scroll-to-section"><a href="/" class="active">Home</a></li>
							

							<li class="scroll-to-section"><a href="/#services">Services</a></li>
							<li class="scroll-to-section"><a href="/#courses">Courses</a></li>
							<li class="has-sub"><a href="javascript:void(0)">Pages</a>
								<ul class="sub-menu">
									<li><a href="about-us.html">About Us</a></li>
									<li><a href="our-services.html">Our Services</a></li>
									<li><a href="contact-us.html">Contact Us</a></li>
								</ul></li>
							<li class="scroll-to-section"><a href="/#simple-cta">이벤트</a></li>
							<li class="scroll-to-section"><a href="/#testimonials">Testimonials</a></li>
							<li class="scroll-to-section"><a href="/#contact-section">Contact
									Us</a></li>

													
							
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