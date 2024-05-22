<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
	rel="stylesheet">

<style>
body {
	font-family: "KimjungchulGothic-Bold";
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #808080;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #363636;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #A9CFE2;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	transition: margin-left .5s;
	padding: 16px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>
<script>

window.addEventListener('DOMContentLoaded', (event) => {
  openNav();
});

function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>
</head>
<body>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#">Dashboard</a> <a href="#">Users</a> <a href="#">Review</a>
		<a href="/member/logout.do">Logout</a>
	</div>

	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;
			Admin</span>
		<hr>
		<main class="flex-1 p-4 md:p-6">
			<div class="flex items-center">
				<h1 class="font-semibold text-lg md:text-2xl">Dashboard</h1>
			</div>
			<div class="grid gap-4 md:gap-6 mt-4">
				<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
					<div
						class="rounded-lg border bg-card text-card-foreground shadow-sm"
						data-v0-t="card">
						<div class="flex flex-col space-y-1.5 p-6 pb-4">
							<h3
								class="whitespace-nowrap text-2xl font-semibold leading-none tracking-tight">Total
								Users</h3>
							<p class="text-sm text-muted-foreground">
								<span class="text-4xl font-bold">${map.totalmember}</span>
							</p>
						</div>
					</div>
					<div
						class="rounded-lg border bg-card text-card-foreground shadow-sm"
						data-v0-t="card">
						<div class="flex flex-col space-y-1.5 p-6 pb-4">
							<h3
								class="whitespace-nowrap text-2xl font-semibold leading-none tracking-tight">Visitor</h3>
							<p class="text-sm text-muted-foreground">
								<span class="text-4xl font-bold">234??</span>
							</p>
						</div>
					</div>
					<div
						class="rounded-lg border bg-card text-card-foreground shadow-sm"
						data-v0-t="card">
						<div class="flex flex-col space-y-1.5 p-6 pb-4">
							<h3
								class="whitespace-nowrap text-2xl font-semibold leading-none tracking-tight">Matching</h3>
							<p class="text-sm text-muted-foreground">
								<span class="text-4xl font-bold">${map.totalmatching}</span>
							</p>
						</div>
					</div>
					<div
						class="rounded-lg border bg-card text-card-foreground shadow-sm"
						data-v0-t="card">
						<div class="flex flex-col space-y-1.5 p-6 pb-4">
							<h3
								class="whitespace-nowrap text-2xl font-semibold leading-none tracking-tight">Revenue</h3>
							<p class="text-sm text-muted-foreground">
								<span class="text-4xl font-bold">₩<fmt:formatNumber
										value="${map.totalpoint}" pattern="#,###" /></span>
							</p>
						</div>
					</div>
				</div>
				<div
					class="rounded-lg border bg-card text-card-foreground shadow-sm"
					data-v0-t="card">
					<div class="flex flex-col space-y-1.5 p-6">
						<h3
							class="whitespace-nowrap text-2xl font-semibold leading-none tracking-tight">Recent
							Orders</h3>
					</div>
					<div class="p-6">
						<div class="relative w-full overflow-auto">
							<table class="w-full caption-bottom text-sm">
								<thead class="[&amp;_tr]:border-b">
									<tr
										class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
										<th
											class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
											Customer</th>
										<th
											class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
											Date</th>
										<th
											class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
											Amount</th>
									</tr>
								</thead>
								<c:forEach var="row" items="${map.list}">
									<tbody class="[&amp;_tr:last-child]:border-0">
										<tr
											class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
											<td
												class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.userid}</td>
											<td
												class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.day}</td>
											<td
												class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">₩<fmt:formatNumber
													value="${row.point}" pattern="#,###" /></td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<hr>


</body>
</html>
