<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*------------------------------------
  Social color
------------------------------------*/
.text-facebook, .hover-facebook-text:hover i, .hover-facebook a:hover i
	{
	color: #3b5998;
}

.bg-facebook, .btn-facebook {
	background-color: #3b5998;
	color: #fff;
}

.text-twitter, .hover-twitter-text:hover i, .hover-twitter a:hover i {
	color: #00aced;
}

.bg-twitter, .btn-twitter {
	background-color: #00aced;
	color: #fff;
}

.text-instagram, .hover-instagram-text:hover i, .hover-instagram a:hover i
	{
	color: #b300ad;
}

.bg-instagram, .btn-instagram {
	background-color: #b300ad;
	color: #fff;
}

.text-youtube, .hover-youtube-text:hover i, .hover-youtube a:hover i {
	color: #bd0000;
}

.bg-youtube, .btn-youtube {
	background-color: #bd0000;
	color: #fff;
}

.text-gplus, .hover-gplus-text:hover i, .hover-gplus a:hover i {
	color: #eb5e4c;
}

.bg-gplus, .btn-gplus {
	background-color: #eb5e4c;
	color: #fff;
}

.text-vimeo, .hover-vimeo-text:hover i, .hover-vimeo a:hover i {
	color: #35c6ea;
}

.bg-vimeo, .btn-vimeo {
	background-color: #35c6ea;
	color: #fff;
}

.text-envelope, .hover-envelope-text:hover i, .hover-envelope a:hover i
	{
	color: #faa33d;
}

.bg-envelope, .btn-envelope {
	background-color: #faa33d;
	color: #fff;
}

.text-linkedin, .hover-linkedin-text:hover i, .hover-linkedin a:hover i
	{
	color: #6697ff;
}

.bg-linkedin, .btn-linkedin {
	background-color: #6697ff;
	color: #fff;
}

.text-telegram, .hover-telegram-text:hover i, .hover-telegram a:hover i
	{
	color: #30a8dc;
}

.bg-telegram, .btn-telegram {
	background-color: #30a8dc;
	color: #fff;
}

.text-pinterest, .hover-pinterest-text:hover i, .hover-pinterest a:hover i
	{
	color: #bd081b;
}

.bg-pinterest, .btn-pinterest {
	background-color: #bd081b;
	color: #fff;
}

.black a {
	color: #000;
}

.post-content ul {
	color: #474b5f;
}

.white a {
	color: #fff;
}
/*------------------------------------
	Member area
------------------------------------*/
.sidebar-item.active, .sidebar-item:hover {
	background-color: #fff;
	border: 1px solid #e6e7e9;
	border-right: 0;
	margin-right: -1px;
}

.sidebar-menu {
	border-bottom: 1px solid #e6e7e9;
	border-top: 1px solid #e6e7e9;
	border-right: 1px solid #e6e7e9;
	padding-bottom: 1rem;
	padding-top: 1rem;
	background-color: #f4f4f4;
}

.sidebar-item {
	position: relative;
	display: block;
	padding: 0.75rem 1.25rem;
	margin-bottom: 0.5rem;
	border: 1px solid transparent;
}

.sidebar-item.active:hover {
	background-color: #fff;
}

.card .icon-big {
	font-size: 3rem;
}

.card .icon-big .notif {
	position: absolute;
	min-width: 25px;
	border-radius: 5rem;
	font-size: 1rem;
	background: #dc3545;
	color: #fff;
}

.card .numbers {
	text-align: right;
}

.card .numbers p {
	font-size: 1rem;
	margin: 0;
}

.card .footer {
	padding: 0;
	line-height: 30px;
}

.side-notif {
	padding-left: 7px;
	padding-right: 7px;
	font-size: 0.8rem;
	border-radius: 5rem;
	background-color: #dc3545;
	color: #fff;
}

.statistics li {
	padding: 0.25rem 0;
}

.member-item:hover .card {
	background-color: #f4f4f4;
}

.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f4f4f4;
}

@media ( max-width : 767.98px) {
	.sidebar-item.active, .sidebar-item:hover {
		border-right: 1px solid #e6e7e9;
		margin-left: 0.25rem;
		margin-right: 0.25rem;
	}
}

.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	-webkit-text-stroke-width: 1.3px;
	-webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}

table {
	width: 100%; /* 테이블의 전체 너비를 사용하도록 설정 */
}

td:first-child, td:nth-child(2) {
	width: 50px; /* 원하는 길이로 조정 */
	white-space: nowrap; /* 긴 텍스트가 잘리지 않도록 설정 */
	overflow: hidden; /* 넘치는 텍스트는 숨김 처리 */
	text-overflow: ellipsis; /* 넘치는 텍스트는 ...으로 표시 */
}

/* 후기의 길이 늘리기 */
td:nth-child(3) {
	width: 300px; /* 원하는 길이로 조정 */
	white-space: normal; /* 텍스트가 줄 바꿈 될 수 있도록 설정 */
}

/*리뷰 테이블 리스트 style*/
th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #f5f5f5;
}
</style>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<script>
	function ratingToPercent(score) {
		return (score / 5) * 100;
	}

	$(document).ready(function() {
		let score = ${map.avgstar}; // 서버에서 평균 점수를 가져온다고 가정합니다.
		let percent = ratingToPercent(score);

		$('.star-ratings-fill').css('width', percent + '%');
	});
	
	

	function followerlist() {
		let follower = document.getElementById('userid').value;
		location.href = "/info/followerlist.do?follower=" + follower;
	}
	function followinglist() {
		let following = document.getElementById('userid').value;
		location.href = "/info/followinglist.do?following=" + following;
	}
	
	
	function chat() {
		   
		var url = "/chat/room.do";

	   
	    // 팝업 창 크기 설정
	    var popupWidth = 700;
	    var popupHeight = 800;

	    // 화면 가운데에 위치 계산
	    var left = (window.innerWidth - popupWidth) / 2;
	    var top = (window.innerHeight - popupHeight) / 2;

	    // 작은 팝업 창을 열기 위한 코드
	    window.open(url, '채팅', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + left + ',top=' + top);
	    }
	
</script>
</head>
<body>
	<%@ include file="../main/header.jsp"%>


	<section id="about-us" class="py-5">
		<div class="container">
			<div class="row">


				<!--Content-->
				<div class="col-md-9">
					<div class="dashboard-area">
						<div class="row">
							<div class="col-12">
								<div class="mb-3 bg-dark">
									<div class="row">
										<div class="col-12">


											<div class="row">
												<div class="col-md-6 ml-auto mr-auto">
													<div
														class="profiles p-3 my-4 rounded text-center shadow-sm">
														<div class="avatars">
															<h6 style="color: white;">대표 사진 변경을 원하시면 사진을 클릭해주세요</h6>
															<a href="/mypage/detailimg.do"> <img
																src="/resources/images/${map.ilist.filename}"
																alt="Circle Image"
																class="avatar-lg rounded-circle img-fluid"
																data-toggle="tooltip" data-placement="bottom" title=""
																data-original-title="Edit avatar images">

															</a> <a style="color: white;">얼굴 평점 :
																${map.ilist.AIface}점</a>
														</div>
														<br>
														<div class="names">
															<h3 class="title text-light">아이디 :
																${map.ilist.userid}</h3>
															<h3 class="title text-light">이름 : ${map.ilist.name}</h3>

															<h3 class="title text-light">보유 포인트 :
																${map.mlist.point}P</h3>
															<a href="/point/buypoint.do">충전하기</a>


														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane fade active show" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<div class="row">
								<div class="col-lg-4 col-sm-6">
									<a class="member-item" onclick="chat()">
										<div class="card mb-2 mb-md-5 py-3">
											<div class="content">
												<div class="row">
													<div
														class="col-6 d-flex justify-content-center align-items-center">
														<div class="icon-big text-twitter text-center"
															title="1 new messages">
															<div class="notif"></div>
															<i class="fas fa-envelope"></i>
														</div>
													</div>
													<div
														class="col-6 d-flex justify-content-center align-items-center">
														<div class="numbers">
															<p>채팅</p>
															<span>${map.mdto.countchat}</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<c:choose>
									<c:when test="${map.mdto.countfollowing >= 1}">
										<div class="col-lg-4 col-sm-6">
											<a class="member-item" onclick="followinglist()">
												<div class="card mb-2 mb-md-5 py-3">
													<div class="content">
														<div class="row">
															<div
																class="col-6 d-flex justify-content-center align-items-center">
																<div class="icon-big text-facebook text-center">
																	<i class="fas fa-star"></i>
																</div>
															</div>
															<div
																class="col-6 d-flex justify-content-center align-items-center">
																<div class="numbers">
																	<input type="hidden" name="userid"
																		value="${sessionScope.userid}">
																	<p>Following</p>
																	<span>${map.mdto.countfollowing}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div>
									</c:when>
									<c:when test="${map.mdto.countfollowing < 1}">
										<div class="col-lg-4 col-sm-6">
											<a class="member-item"
												onclick="swal.fire('알림','팔로잉 한사람이 없어요!','error')">
												<div class="card mb-2 mb-md-5 py-3">
													<div class="content">
														<div class="row">
															<div
																class="col-6 d-flex justify-content-center align-items-center">
																<div class="icon-big text-facebook text-center">
																	<i class="fas fa-star"></i>
																</div>
															</div>
															<div
																class="col-6 d-flex justify-content-center align-items-center">
																<div class="numbers">
																	<input type="hidden" name="userid"
																		value="${sessionScope.userid}">
																	<p>Following</p>
																	<span>${map.mdto.countfollowing}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${map.mdto.countfollower > 0}">
										<div class="col-lg-4 col-sm-6">
											<a class="member-item" onclick="followerlist()">
												<div class="card mb-2 mb-md-5 py-3">
													<div class="content">
														<div class="row">
															<div
																class="col-6 d-flex justify-content-center align-items-center">
																<div class="icon-big text-facebook text-center">
																	<i class="fas fa-star"></i>
																</div>
															</div>
															<div
																class="col-6 d-flex justify-content-center align-items-center">
																<div class="numbers">
																	<input type="hidden" name="userid"
																		value="${sessionScope.userid}">
																	<p>Follower</p>
																	<span>${map.mdto.countfollower}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div>
									</c:when>
									<c:when test="${map.mdto.countfollower < 1}">
										<div class="col-lg-4 col-sm-6">
											<a class="member-item"
												onclick="swal.fire('알림','팔로워가 없어요!','error')">
												<div class="card mb-2 mb-md-5 py-3">
													<div class="content">
														<div class="row">
															<div
																class="col-6 d-flex justify-content-center align-items-center">
																<div class="icon-big text-facebook text-center">
																	<i class="fas fa-star"></i>
																</div>
															</div>
															<div
																class="col-6 d-flex justify-content-center align-items-center">
																<div class="numbers">
																	<input type="hidden" name="userid"
																		value="${sessionScope.userid}">
																	<p>Following</p>
																	<span>${map.mdto.countfollower}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div>
									</c:when>
								</c:choose>
								<div class="row">
									<div class="col-12">
										<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

											<li class="nav-item"><a class="nav-link"
												id="pills-profile-tab" data-toggle="pill"
												href="#pills-profile" role="tab"
												aria-controls="pills-profile" aria-selected="false">내 정보</a></li>

											<li class="nav-item"><a class="nav-link"
												id="pills-contact-tab" data-toggle="pill"
												href="#pills-contact" role="tab"
												aria-controls="pills-contact" aria-selected="false">내 리뷰
													보기</a></li>
										</ul>
										<div class="tab-content" id="pills-tabContent">

											<div class="tab-pane fade" id="pills-profile" role="tabpanel"
												aria-labelledby="pills-profile-tab">
												<div class="p-3 border mb-3">
													<a class="position-absolute" style="right: 25px"
														onclick="showPasswordModal()" data-toggle="tooltip"
														data-placement="bottom" title=""
														data-original-title="Edit profile"><i
														class="fas fa-cog"></i></a>
													<h3>${map.ilist.name}</h3>
													<p>
														<b>직업:</b> ${map.ilist.job}
													</p>
													<p>
														<b>키:</b> ${map.ilist.height}
													</p>
													<p>
														<b>몸무게:</b> ${map.ilist.weight}
													</p>
													<p>
														<b>주소:</b> ${map.ilist.address}
													</p>
													<p>
														<b>핸드폰번호:</b> ${map.ilist.cellphone}
													</p>

												</div>
											</div>
											<div class="tab-pane fade" id="pills-contact" role="tabpanel"
												aria-labelledby="pills-contact-tab">
												<div class="p-3 border mb-3">
													<h5>나의별점</h5>
													<div class="star-ratings">
														<div class="star-ratings-fill space-x-2 text-lg">
															<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
														</div>
														<div class="star-ratings-base space-x-2 text-lg">
															<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
														</div>
														<a style="font-size: small;">${map.avgstar} / 5점</a>
													</div>
													<div class="row">
														<div class="col-12">
															<table>
																<tr>
																	<th>아이디</th>
																	<th>별점</th>
																	<th>후기</th>
																</tr>
																<c:forEach var="row" items="${map.rlist}"
																	varStatus="loop">
																	<input type="hidden" value="${row.star}"
																		id="star-${loop.index}">
																	<script>
        function ratingToPercent${loop.index}(score) {
            return (score / 5) * 100;
        }

        $(document).ready(function() {
            let score = document.getElementById('star-${loop.index}').value;
            let percent = ratingToPercent${loop.index}(score);

            $('.star-ratings-fill${loop.index}').css('width', percent + '%');
        });
    </script>
<style>
.star-ratings-fill${loop.index}{
color:#fff58c;
padding:0;
position:absolute;
z-index:1;
display:flex;
top:0;
left:0;
overflow:hidden;
-webkit-text-fill-color:gold;
}
</style>

																	<tr>
																		<td>${row.userid}</td>
																		<td>
																			<div class="star-ratings">
																				<div
																					class="star-ratings-fill${loop.index} space-x-2 text-lg">
																					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																				</div>
																				<div class="star-ratings-base space-x-2 text-lg">
																					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																				</div>
																				<a style="font-size: small;">${row.star} / 5점</a>
																			</div>
																		</td>
																		<td>${row.review}</td>
																	</tr>
																</c:forEach>

															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	</section>
	<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
		aria-labelledby="passwordModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="passwordModalLabel">비밀번호 확인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="password" id="passwordInput" class="form-control"
						placeholder="비밀번호 입력">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="validatePassword()">확인</button>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="userid" value="${map.ilist.userid}">

	<script>
		function showPasswordModal() {
			$('#passwordModal').modal('show');
		}

		function validatePassword() {
			let userid = document.getElementById('userid').value;
			let password = document.getElementById('passwordInput').value;

			if (password.trim() === "") {
				alert("비밀번호를 입력하세요.");
				return;
			}

			// 비밀번호 확인을 위한 AJAX 요청
			$.ajax({
				url : '/mypage/checkpasswd.do',
				type : 'POST',
				data : {
					userid : userid,
					passwd : password
				},
				success : function(response) {
					if (response === "correct") {
						// 비밀번호가 올바른 경우 페이지 이동
						window.location.href = "/mypage/pagesetting.do?userid="
								+ userid;
					} else if (response === "wrong") {
						alert("비밀번호를 다시 확인해주세요.");
					}
				},
				error : function(xhr, status, error) {
					console.error('비밀번호 확인 중 오류가 발생했습니다.', status, error);
				}
			});

			$('#passwordInput').val("");
			$('#passwordModal').modal('hide');
		}
	</script>
</body>
</html>