<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<%@ include file="../main/header.jsp"%>
<style>
.image {
	text-align: center; /* 이미지를 중앙으로 정렬하기 위한 스타일 */
}
</style>
<script>
   function follow(follower) {
      let following = document.getElementById('userid').value;
      console.log(following);
      console.log(follower);
      location.href = "/follow.do?following=" + following + "&follower="
            + follower;
   }

   function checkfollow(follower) {
      let following = document.getElementById('userid').value;
      location.href = "/checkfollow.do?following=" + following + "&follower="
            + follower;
   }
   function cancelfollow(follower) {
      let following = document.getElementById('userid').value;
      location.href = "/cancelfollow.do?following=" + following
            + "&follower=" + follower;
   }

   function point(pointValue, userId, otherId) {
       let otherid = otherId; // otherId를 직접 사용
       if (confirm("보고싶어?")) {
           if (pointValue < 500) {
               alert("포인트를 충전하세요");
               location.href = "/point/buypoint.do";
           } else {
               location.href = "/detail.do?userid=" + userId + "&otherid=" + otherid;
           }
       }
   }
   function uplvl(){
	   
	   if (${map.lvl} == 5) {
	        alert("더 이상 레벨을 올릴 수 없습니다.");
	    } else {
	        if (confirm("레벨을 올리시겠습니까?")) {
	            // Redirect to the uplvl page
	            window.location.href = "/member/uplvl.do";
	        }
	    }
	}

</script>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<input type="hidden" id="userid" value="${sessionScope.userid}">
	<input type="hidden" id="point" value="${sessionScope.point}">
	<div class="container mt-5">
		<div class="row justify-content-center">
			<h2>나의 얼굴 점수 : ${map.Aiface}</h2>
			<h3>나의 레벨 : ${map.lvl}</h3>
			<h6>레벨을 올리면 더 높은 점수의 회원들을 확인할 수 있습니다.</h6>
			<input type="button" value="레벨 올리기" onclick="uplvl()">
			<c:choose>
				<c:when test="${sessionScope.gender == 1}">
					<!-- 성별이 여성일 때만 실행될 부분 -->
					<c:forEach var="row" items="${map.list}">
						<!-- 여기에 여성 사용자 정보를 보여주는 코드 추가 -->
						<c:if test="${row.gender == 2}">
							<div class="col-md-6 mb-4">
								<div class="card p-3">
									<div class="d-flex align-items-center">
										<div class="image">
											<img
												src="/resources/images/${row.filename}?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
												style="width: 200px; height: 200px;" class="rounded"
												width="155">
										</div>
										<div class="ml-3 w-100">
											<h4 class="mb-0 mt-0">${row.name}</h4>
											<span>${row.job}</span>
											<div
												class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats">
												<div class="d-flex flex-column">
													<span class="followers">팔로워</span> <span class="number2">${map.idao.countfollow(row.userid)}</span>
												</div>
												<div class="d-flex flex-column">
													<span class="rating">AI평점</span> <span class="number3">${row.AIface}</span>
												</div>
											</div>
											<div class="button mt-2 d-flex flex-row align-items-center">
												<a class="btn btn-sm btn-outline-primary w-100"
													onclick="point(${sessionScope.point}, '${sessionScope.userid}', '${row.userid}')">VIEW</a>


												<c:choose>
													<c:when
														test="${map.idao.checkfollow(sessionScope.userid, row.userid) == 1}">
														<input type="button"
															class="btn btn-sm btn-primary w-100 ml-3"
															onclick="cancelfollow('${row.userid}')" value="팔로잉"
															style="background-color: #EB3324; border-color: #EB3324;">
													</c:when>
													<c:when
														test="${map.idao.checkfollow(sessionScope.userid, row.userid) == 0}">
														<input type="button"
															class="btn btn-sm btn-primary w-100 ml-2"
															onclick="follow('${row.userid}')" value="팔로우">
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:when>

				<c:when test="${sessionScope.gender == 2}">
					<!-- 성별이 여성일 때만 실행될 부분 -->
					<c:forEach var="row" items="${map.list}">
						<!-- 여기에 여성 사용자 정보를 보여주는 코드 추가 -->
						<c:if test="${row.gender == 1}">
							<div class="col-md-6 mb-4">
								<div class="card p-3">
									<div class="d-flex align-items-center">
										<div class="image">
											<img
												src="/resources/images/${row.filename}?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
												class="rounded" width="155">
										</div>
										<div class="ml-3 w-100">
											<h4 class="mb-0 mt-0">${row.name}</h4>
											<span>${row.job}</span>
											<div
												class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats">
												<div class="d-flex flex-column">
													<span class="followers">팔로워</span> <span class="number2">${map.idao.countfollow(row.userid)}</span>
												</div>
												<div class="d-flex flex-column">
													<span class="rating">AI평점</span> <span class="number3">${row.AIface}</span>
												</div>
											</div>
											<div class="button mt-2 d-flex flex-row align-items-center">
												<a class="btn btn-sm btn-outline-primary w-100"
													onclick="point(${sessionScope.point}, '${sessionScope.userid}', '${row.userid}')">VIEW</a>
												<c:choose>
													<c:when
														test="${map.idao.checkfollow(sessionScope.userid, row.userid) == 1}">
														<input type="button"
															class="btn btn-sm btn-primary w-100 ml-3"
															onclick="cancelfollow('${row.userid}')" value="팔로잉"
															style="background-color: #EB3324; border-color: #EB3324;">
													</c:when>
													<c:when
														test="${map.idao.checkfollow(sessionScope.userid, row.userid) == 0}">
														<input type="button"
															class="btn btn-sm btn-primary w-100 ml-2"
															onclick="follow('${row.userid}')" value="팔로우">
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>

</body>
</html>