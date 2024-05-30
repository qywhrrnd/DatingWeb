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

   function point(userId, otherId) {
       let otherid = otherId; // otherId를 직접 사용
       if (confirm("보고싶어?")) {
                       location.href = "/detail.do?userid=" + userId + "&otherid=" + otherid;
           }
       
   }
   
   
   function uplvl(){
	   
	   if(${sessionScope.point < 1000}){
		   alert("포인트가 부족합니다!")
		   if (confirm("포인트 충전하시겠습니까?")) {
	            // Redirect to the uplvl page
	            location.href = "/member/uplvl.do";
	        	    }
	   }else
	   
	   if(${map.b > 5.0}){
		   alert("더이상 올릴 수 없습니다");
	   }else{
	   	        if (confirm("레벨을 올리시겠습니까?")) {
	            // Redirect to the uplvl page
	            location.href = "/member/uplvl.do";
	        	    }
   }
   }
</script>

<style>
#trigger {
	font-size: 13px;
	line-height: 17px;
	letter-spacing: -.3px;
	white-space: nowrap;
	word-break: keep-all;
	text-align: right;
}
</style>
</head>
<body>

	<br>
	<br>
	<br>
	<br> ${map.alertScript}
	<input type="hidden" id="userid" value="${sessionScope.userid}">
	<input type="hidden" id="point" value="${sessionScope.point}">
	<div class="container mt-5">
		<a id="trigger">더 많은 회원을 보고 싶으싶니까?</a> <br> <a
			style="font-style: italic; font-size: x-small;">마우스를 올려보세요!</a>
		<div id="content" class="row justify-content-center"
			style="display: none;">
			<div class="col-md-8 text-center">
				<h2 class="mb-4">나의 얼굴 점수: ${map.Aiface}</h2>
				<h3 class="mb-4">나의 레벨: ${map.lvl}</h3>
				<h3 class="mb-4">볼 수 있는 점수: ${map.b}</h3>
				<p class="mb-4">레벨을 올리면 더 높은 점수의 회원들을 확인할 수 있습니다.</p>
				<button type="button" class="btn btn-primary" onclick="uplvl()">레벨
					올리기</button>
			</div>
		</div>
		<script>
    const trigger = document.getElementById('trigger');
    const content = document.getElementById('content');

    trigger.addEventListener('mouseover', function() {
        content.style.display = 'block';
    });

    content.addEventListener('mouseleave', function() {
        content.style.display = 'none';
    });
</script>


		<br> <br> <br>
		<div class="row justify-content-center">

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
													onclick="point('${sessionScope.userid}', '${row.userid}')">VIEW</a>


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
													onclick="point('${sessionScope.userid}', '${row.userid}')">VIEW</a>
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