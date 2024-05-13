<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="resources/css/detail.css" rel="stylesheet">
<script>
	function chat(userid, otherid) {
		location.href = "/chat/createchatbox.do?userid=" + userid + "&otherid="
				+ otherid;
	}
</script>


</head>
<body>




	<%@ include file="../main/header.jsp"%>


	<div class="main-content">
		<!-- Top navbar -->

		<!-- Header -->
		<div
			style="min-height: 800px; background-image: url('../resources/images/디마리아.jpg'); background-size: cover; background-position: center top;">
			<!-- Mask -->
			<span></span>
			<!-- Header container -->
			<div class="container-fluid d-flex align-items-center">
				<div class="row">
					<div class="col-lg-7 col-md-10"></div>
				</div>
			</div>
		</div>
		<!-- Page content -->
		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
					<div class="card card-profile shadow">
						<div class="row justify-content-center">
							<div class="col-lg-3 order-lg-2">
								<div class="card-profile-image">
									<a href="#"> <img src="resources/images/${dto.filename}"
										class="rounded-circle">
									</a>
								</div>
							</div>
						</div>
						<div
							class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
							<div class="d-flex justify-content-between">
								<a onclick="chat('${sessionScope.userid}', '${dto.userid}')"
									class="btn btn-sm btn-info mr-4">채팅 쪾~~~♥</a>
							</div>
						</div>
						<div class="card-body pt-0 pt-md-4">
							<div class="row">
								<div class="col">
									<div
										class="card-profile-stats d-flex justify-content-center mt-md-5">
										<div>
											<span class="heading">${sessionScope.follower}</span> <span
												class="description">followers</span>
										</div>
										<div>
											<span class="heading">10</span> <span class="description">Photos</span>
										</div>
										<div>
											<span class="heading">89</span> <span class="description">Comments</span>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center">
								<h3>
									${dto.name}<span class="font-weight-light">, ${dto.age}</span>
								</h3>
								<div class="h5 font-weight-300">
									<i class="ni location_pin mr-2"></i>${dto.address}
								</div>
								<div class="h5 mt-4">
									<i class="ni business_briefcase-24 mr-2"></i>${dto.job}
								</div>
								<div>
									<i class="ni education_hat mr-2"></i>University of Computer
									Science
								</div>
								<hr class="my-4">
								<p>Ryan — the name taken by Melbourne-raised, Brooklyn-based
									Nick Murphy — writes, performs and records all of his own
									music.</p>
								<a href="#">Show more</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-8 order-xl-1">
					<div>
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">My account</h3>
								</div>

							</div>
						</div>
						<div class="card-body">
							<form>
								<h6 class="heading-small text-muted mb-4">User information</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label" for="input-username">키</label>
												<input type="text" id="input-username"
													class="form-control form-control-alternative"
													placeholder="Username" value="${dto.height}"
													readonly="readonly">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" for="input-email">몸무게</label>
												<input type="text" id="input-email"
													class="form-control form-control-alternative"
													value="${dto.weight}" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label" for="input-first-name">학력</label>
												<input type="text" id="input-first-name"
													class="form-control form-control-alternative"
													readonly="readonly" value="${dto.education}">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label" for="input-last-name">직업</label>
												<input type="text" id="input-last-name"
													class="form-control form-control-alternative"
													readonly="readonly" value="${dto.job}">
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4">
								<!-- Address -->
								<h6 class="heading-small text-muted mb-4">Contact
									information</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group focused">
												<label class="form-control-label" for="input-address">스타일</label>
												<input id="input-address"
													class="form-control form-control-alternative"
													readonly="readonly" value="${dto.style}" type="text">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group focused">
												<label class="form-control-label" for="input-address">취미</label>
												<input id="input-address"
													class="form-control form-control-alternative"
													readonly="readonly" value="${dto.hobby}" type="text">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4">
											<div class="form-group focused">
												<label class="form-control-label" for="input-city">MBTI</label>
												<input type="text" id="input-city"
													class="form-control form-control-alternative"
													readonly="readonly" value="${dto.MBTI}">
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group focused">
												<label class="form-control-label" for="input-country">종교</label>
												<input type="text" id="input-country"
													class="form-control form-control-alternative"
													readonly="readonly" value="${dto.religion}">
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label class="form-control-label" for="input-country">흡연</label>
												<c:choose>
													<c:when test="${dto.smoking == 1}">
														<input type="text" id="input-postal-code"
															class="form-control form-control-alternative"
															readonly="readonly" value="흡연">
													</c:when>
													<c:when test="${dto.smoking == 2}">
														<input type="text" id="input-postal-code"
															class="form-control form-control-alternative"
															readonly="readonly" value="비흡연">
													</c:when>
												</c:choose>

											</div>
										</div>
									</div>
								</div>
								<hr class="my-4">
								<!-- Description -->
								<h6 class="heading-small text-muted mb-4">About me</h6>
								<div class="pl-lg-4">
									<div class="form-group focused">
										<label>나의 한마디</label>
										<textarea rows="4"
											class="form-control form-control-alternative"
											readonly="readonly">${dto.description}</textarea>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="row align-items-center justify-content-xl-between">
			<div class="col-xl-6 m-auto text-center">
				<div class="copyright">
					<p>
						Made with <a
							href="https://www.creative-tim.com/product/argon-dashboard"
							target="_blank">Argon Dashboard</a> by Creative Tim
					</p>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>