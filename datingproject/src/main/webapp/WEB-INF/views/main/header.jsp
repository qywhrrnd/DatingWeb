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
<script src="/resources/jquery/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/js/isotope.min.js"></script>
<script src="/resources/js/owl-carousel.js"></script>
<script src="/resources/js/lightbox.js"></script>
<script src="/resources/js/tabs.js"></script>
<script src="/resources/js/video.js"></script>
<script src="/resources/js/slick-slider.js"></script>
<script src="/resources/js/custom.js"></script>
<script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
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

							<li class="scroll-to-section"><a href="#services">Services</a></li>
							<li class="scroll-to-section"><a href="#courses">Courses</a></li>
							<li class="has-sub"><a href="javascript:void(0)">Pages</a>
								<ul class="sub-menu">
									<li><a href="about-us.html">About Us</a></li>
									<li><a href="our-services.html">Our Services</a></li>
									<li><a href="contact-us.html">Contact Us</a></li>
								</ul></li>
							<li class="scroll-to-section"><a href="#simple-cta">이벤트</a></li>
							<li class="scroll-to-section"><a href="#testimonials">Testimonials</a></li>
							<li class="scroll-to-section"><a href="#contact-section">Contact
									Us</a></li>

							<li><a href="/info.do">남자여자</a></li>
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