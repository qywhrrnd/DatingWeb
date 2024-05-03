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
    <div class="row justify-content-center">
        <c:forEach var="row" items="${list}">
            <div class="col-md-6 mb-4">
                <div class="card p-3">
                    <div class="d-flex align-items-center">
                        <div class="image">
                            <img src="/resources/images/${row.filename}?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" class="rounded" width="155">
                        </div>
                        <div class="ml-3 w-100">
                            <h4 class="mb-0 mt-0">${row.name}</h4>
                            <span>${row.job}</span>
                            <div class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats">
                                <div class="d-flex flex-column">
                                    <span class="followers">팔로워</span>
                                    <span class="number2">980</span>
                                </div>
                                <div class="d-flex flex-column">
                                    <span class="rating">AI평점</span>
                                    <span class="number3">${row.AIface}</span>
                                </div>
                            </div>
                            <div class="button mt-2 d-flex flex-row align-items-center">
                                <a class="btn btn-sm btn-outline-primary w-100"  href="/detail.do/${row.name}">VIEW</a>
                                <button class="btn btn-sm btn-primary w-100 ml-2">팔로우</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>