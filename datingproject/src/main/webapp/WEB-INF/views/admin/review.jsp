<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>ADMIN</title>
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
        .profile-photo {
            display: none;
            margin-top: 1rem;
        }
        .form-container {
            transition: max-height 0.3s ease-out;
            overflow: hidden;
        }
        .form-container.hidden {
            max-height: 0;
            padding: 0;
            margin: 0;
        }
        .form-container.visible {
            max-height: 1000px; /* 충분히 큰 값으로 설정 */
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

            // Default to "All" button click event trigger
            allBtn.click();
        };

        function upload() {
            let fileInput = document.getElementById('file');
            let preview = document.querySelector(".profile-photo");
            if (fileInput.files.length > 0) {
                let file = fileInput.files[0];
                let reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = "block";
                }
                reader.readAsDataURL(file);
            } else {
                preview.style.display = "none";
            }
        }

        function insert() {
            let form1 = document.getElementById("form1");
            let name1 = document.getElementById("name1").value;
            let name2 = document.getElementById("name2").value;
            let content = document.getElementById("content").value;
            let file = document.getElementById("file").value;

            if (name1 === "") {
                alert("Please enter Name1");
                document.getElementById("name1").focus();
                return;
            }
            if (name2 === "") {
                alert("Please enter Name2");
                document.getElementById("name2").focus();
                return;
            }
            if (content === "") {
                alert("Please enter content");
                document.getElementById("content").focus();
                return;
            }
            if (file === "") {
                alert("Please add a photo");
                document.getElementById("file").focus();
                return;
            }

            form1.action = "/admin/writereview.do";
            alert("Review added successfully.");
            form1.submit();
        }

        function toggleForm() {
            const formContainer = document.getElementById('content');
            if (formContainer.classList.contains('hidden')) {
                formContainer.classList.remove('hidden');
                formContainer.classList.add('visible');
            } else {
                formContainer.classList.remove('visible');
                formContainer.classList.add('hidden');
            }
        }
    </script>
</head>
<body>
    <%@ include file="../admin/header.jsp"%>
    <main class="flex-1 p-4 md:p-6">
        <div class="flex items-center">
            <h1 class="font-semibold text-lg md:text-2xl">Review List</h1>
            &nbsp;&nbsp;&nbsp;
            <a id="all-btn" class="faint-link">All</a> /
            <a id="success-btn" class="faint-link">Success Case Reviews</a> /
            <a id="main-btn" class="faint-link">Main Reviews</a>
        </div>
        <div class="grid gap-4 md:gap-6 mt-4">
            <div id="success-reviews" class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                <div class="p-6">
                    <div class="relative w-full overflow-auto">
                        <h1>Success Case Reviews</h1>
                        <a id="trigger" class="cursor-pointer text-blue-500 hover:underline" onclick="toggleForm()">Add Success Case</a>
                        <div id="content" class="form-container hidden row justify-content-center mt-4 p-4 border border-gray-200 rounded-lg bg-gray-50">
                            <div class="col-md-8 text-center">
                                <form id="form1" method="post" enctype="multipart/form-data" class="space-y-4">
                                    <div>
                                        <label for="name1" class="block text-sm font-medium text-gray-700">이름1</label>
                                        <input type="text" id="name1" name="name1" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                    <div>
                                        <label for="name2" class="block text-sm font-medium text-gray-700">이름2</label>
                                        <input type="text" id="name2" name="name2" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                    <div>
                                        <label for="content" class="block text-sm font-medium text-gray-700">내용</label>
                                        <input type="text" id="content" name="content" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                    <div>
                                        <label for="file" class="block text-sm font-medium text-gray-700">사진추가</label>
                                        <input type="file" id="file" name="file" accept="image/*" class="mt-1 block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer focus:outline-none" onchange="upload()">
                                    </div>
                                    <div class="mt-2">
                                        <img class="profile-photo rounded-lg shadow-sm" width="150" height="150">
                                    </div>
                                    <div>
                                        <input type="button" value="Add" onclick="insert()" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">idx</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">filename</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">name1</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">name2</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">content</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${map.list}">
                                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted" data-gender="">
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">${row.idx}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">
                                            <img src="/resources/images/${row.filename}" width="150" height="150">
                                        </td>
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">${row.name1}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">${row.name2}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">${row.content}</td>
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
                        <h2>Main Reviews</h2>
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">idx</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">userid</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">name</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">content</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${map.list1}">
                                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted" data-gender="">
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">${row.idx}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">${row.userid}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">${row.name}</td>
                                        <td style="font-size: small" class="p-4 align-middle [&:has([role=checkbox])]:pr-0">${row.content}</td>
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
