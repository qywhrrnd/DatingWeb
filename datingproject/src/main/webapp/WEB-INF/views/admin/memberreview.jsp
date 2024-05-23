<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
	rel="stylesheet">
<title>Member Review</title>

<style>
.star-ratings {
   color: #aaa9a9;
   position: relative;
   unicode-bidi: bidi-override;
   width: max-content;
   -webkit-text-fill-color: transparent;
   -webkit-text-stroke-width: 1.3px;
   -webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
   color: #fff58c;
   padding: 0;
   position: absolute;
   z-index: 1;
   display: flex;
   top: 0;
   left: 0;
   overflow: hidden;
   -webkit-text-fill-color: gold;
}


.star-ratings-base {
   z-index: 0;
   padding: 0;
}
</style>
</head>
<body>
	<h1 class="font-semibold text-lg md:text-2xl">Member Review</h1>
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
									Userid</th>
								<th
									class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
									Reviewer</th>
								<th
									class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
									Star</th>
									
								<th
									class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
									Review</th>
								<th
									class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
									Regidate</th>


							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="row" items="${list}" varStatus="loop">
																	<input type="hidden" value="${row.star}"
																		id="star-${loop.index}">
																	<script>
        function ratingToPercent${loop.index}(score) {
            return (score / 5) * 100;
        }

        $(document).ready(function() {
            let score = document.getElementById('star-${loop.index}').value;
            let percent = ratingToPercent${loop.index}(score);

            $('.star-ratings-fill${loop.index}').css('width', percent + '%');
        });
    </script>
    <style>
    .star-ratings-fill${loop.index} {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}
    </style>
																	<tr>
																		<td>${row.userid}</td>
																		<td>
																			<div class="star-ratings">
																				<div
																					class="star-ratings-fill${loop.index} space-x-2 text-lg">
																					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																				</div>
																				<div class="star-ratings-base space-x-2 text-lg">
																					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																				</div>
																				<a style="font-size: small;">${row.star} / 5점</a>
																			</div>
																		</td>
																		<td>${row.review}</td>
																	</tr>
																</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>