<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">

<style>
.faint-link {
    color: rgba(0, 0, 0, 0.5);
    text-decoration: none;
    cursor: pointer;
    transition: color 0.3s, font-weight 0.3s;
    font-size: small;
}

.faint-link:hover, .faint-link.active {
    color: rgba(0, 0, 0, 0.8);
    font-weight: bold;
}
</style>
<script>
function filterReviews(filter) {
    var successTable = document.getElementById('success-reviews');
    var mainTable = document.getElementById('main-reviews');

    if (filter === 'all') {
        successTable.style.display = '';
        mainTable.style.display = '';
    } else if (filter === 'success') {
        successTable.style.display = '';
        mainTable.style.display = 'none';
    } else if (filter === 'main') {
        successTable.style.display = 'none';
        mainTable.style.display = '';
    }
}

function setActiveLink(activeLink) {
    var links = document.querySelectorAll('.faint-link');
    links.forEach(function(link) {
        link.classList.remove('active');
    });
    activeLink.classList.add('active');
}

window.onload = function() {
    var allBtn = document.getElementById('all-btn');
    var successBtn = document.getElementById('success-btn');
    var mainBtn = document.getElementById('main-btn');

    allBtn.onclick = function() {
        filterReviews('all');
        setActiveLink(this);
    };
    successBtn.onclick = function() {
        filterReviews('success');
        setActiveLink(this);
    };
    mainBtn.onclick = function() {
        filterReviews('main');
        setActiveLink(this);
    };

    // 기본적으로 "All" 버튼 클릭 이벤트 트리거
    allBtn.click();
};
</script>

</head>
<body>
    <%@ include file="../admin/header.jsp"%>
    <main class="flex-1 p-4 md:p-6">
        <div class="flex items-center">
            <h1 class="font-semibold text-lg md:text-2xl">리뷰 목록</h1>
            &nbsp;&nbsp;&nbsp;
            <a id="all-btn" class="faint-link">All</a> / <a id="success-btn" class="faint-link">성공사례 리뷰</a> / <a id="main-btn" class="faint-link">메인 리뷰</a>
        </div>
        <div class="grid gap-4 md:gap-6 mt-4">
            <div id="success-reviews" class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                <div class="p-6">
                    <div class="relative w-full overflow-auto">
                    <h2>성공사례 리뷰</h2>
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&amp;_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">idx</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">filename</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">name1</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">name2</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">content</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${map.list}">
                                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted" data-gender="">
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.idx}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><img src="/resources/images/${row.filename}" width="150" height="150"></td>
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.name1}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.name2}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.content}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid gap-4 md:gap-6 mt-4">
            <div id="main-reviews" class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                <div class="p-6">
                    <div class="relative w-full overflow-auto">
                    <h2>메인 리뷰</h2>
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&amp;_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">idx</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">userid</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">name</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">content</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${map.list1}">
                                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted" data-gender="">
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.idx}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.userid}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.name}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.content}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <hr>
</body>
</html>
