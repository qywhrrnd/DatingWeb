<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>ADMIN</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
	rel="stylesheet">
	
</head>
<body>
	<%@ include file="../admin/header.jsp"%>
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
							<span class="text-4xl font-bold">${map.vcount}</span>
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
			<div class="rounded-lg border bg-card text-card-foreground shadow-sm"
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
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.userid}</td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${row.day}</td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">₩<fmt:formatNumber
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
	<hr>
</body>
</html>
