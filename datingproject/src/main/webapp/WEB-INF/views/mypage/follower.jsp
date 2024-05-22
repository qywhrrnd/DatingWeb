<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <%@ include file="../main/header.jsp"%>
    <style>
        .image img {
            width: 100%; /* Make images fill their container */
            max-width: 155px; /* Limit maximum width */
            height: auto; /* Maintain aspect ratio */
        }

        .user-card {
            border-radius: 10px;
            overflow: hidden; /* Hide overflow from rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
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
    <div class="container mt-5">
        <table class="table">
            <tbody>
            <c:choose>
                    <c:when test="${map.mdto.countfollower == 0}">
                        <tr>
                            <td>
                                <h1>나를 팔로우한 사람이 없습니다!</h1>
                            </td>
                        </tr>
                    </c:when>
                    <c:when test="${map.mdto.countfollower >= 1}">
					<c:forEach var="row" items="${map.list}">
						<tr>
							<td>
								<div class="user-card">
									<div class="d-flex align-items-center p-3">
										<div class="image">
											<img
												src="/resources/images/${row.filename}?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
												class="rounded">
										</div>
										<div class="ml-3 w-100">
											<input type="hidden" value="${row.userid}">
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
												<input type="hidden" id="userid"
													value="${sessionScope.userid}">
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
							</td>
						</tr>
					  </c:forEach>
                    </c:when>
                </c:choose>
			</tbody>
        </table>
    </div>
</body>
</html>
