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
td:hover {
	transform: scale(1.5);
	transition-duration: 0.5s;
}
img:hover {
transform: scale(2.5);
	transition-duration: 0.5s;
}
</style>
<script>

</script>
</head>
<body>
	<%@ include file="../admin/header.jsp"%>
	<main class="flex-1 p-4 md:p-6">
		<div class="flex items-center">
			<h1 class="font-semibold text-lg md:text-2xl">User List</h1>&nbsp;&nbsp;&nbsp;
			<a onclick="man()">man</a>/
			<a onclick="woman()">woman</a>
		</div>
		<div class="grid gap-4 md:gap-6 mt-4">
			<div class="rounded-lg border bg-card text-card-foreground shadow-sm"
				data-v0-t="card">
				<div class="p-6">
					<div class="relative w-full overflow-auto">
						<table class="w-full caption-bottom text-sm">
							<thead class="[&amp;_tr]:border-b">
								<tr
									class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										name</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										userid</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										age</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										cellphone</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										address</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										height</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										weight</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										MBTI</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										hobby</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										style</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										education</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										religion</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										job</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										filename</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										AIface</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										point</th>
									<th
										class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
										lvl</th>
								</tr>
							</thead>
							<c:forEach var="row" items="${map.list}">
								<tbody class="[&amp;_tr:last-child]:border-0">
									<tr
										class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.name}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.userid}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.age}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.cellphone}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.address}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.height}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.weight}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.MBTI}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.hobby}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.style}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.education}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.religion}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.job}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><img
											src="/resources/images/${row.filename}" width="100"
											height="100"></td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.AIface}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.point}</td>
										<td style="font-size: x-small"
											class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.lvl}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<hr>
</body>
</html>
