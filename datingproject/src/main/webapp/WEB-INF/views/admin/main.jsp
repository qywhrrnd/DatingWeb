<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function successreview() {
		$
				.ajax({
					url : "/admin/successreview.do",
					type : "POST",
					success : function(response) {
						$('#sex').empty();
						var list = response.list;
						// 테이블을 생성할 HTML 코드
						var tableHTML = '<table border="1"><tr><th>idx</th><th>사진</th><th>이름1</th><th>이름2</th><th>내용</th></tr>';
						// 리스트의 각 요소에 대해 테이블 행 추가
						for (var i = 0; i < list.length; i++) {
							var row = '<tr><td>'
									+ list[i].idx
									+ '</td><td><img src="/resources/images/' + list[i].filename + '" width="100" height="100"></td><td>'
									+ list[i].name1 + '</td><td>'
									+ list[i].name2 + '</td><td>'
									+ list[i].content + '</td></tr>';

							tableHTML += row;
						}

						// 테이블을 닫음
						tableHTML += '</table>';
						tableHTML += '<input type="button" value="성공사례등록하기" onclick="location.href=\'/writesreview.do\'">';

						// 테이블을 출력할 HTML 요소에 추가
						$('#result').html(tableHTML);
					}
				});
	}

	function memberinfo() {
		$
				.ajax({
					url : "/admin/memberinfo.do",
					type : "POST",
					success : function(response) {
						var sex = '<input type="button" value="남자" onclick="man()"><input type="button" value="여자" onclick="woman()">'
						$('#sex').html(sex);
						var list = response.list;
						// 테이블을 생성할 HTML 코드
						var tableHTML = '<table border="1"><tr><th>name</th><th>age</th><th>userid</th><th>cellphone</th><th>address</th><th>height</th><th>weight</th><th>MBTI</th><th>smoking</th><th>hobby</th><th>style</th><th>education</th><th>religion</th><th>job</th><th>filename</th><th>AIface</th><th>point</th><th>lvl</th></tr>';
						// 리스트의 각 요소에 대해 테이블 행 추가
						for (var i = 0; i < list.length; i++) {
							var row = '<tr><td>'
									+ list[i].name
									+ '</td><td>'
									+ list[i].age
									+ '</td><td>'
									+ list[i].userid
									+ '</td><td>'
									+ list[i].cellphone
									+ '</td><td>'
									+ list[i].address
									+ '</td><td>'
									+ list[i].height
									+ '</td><td>'
									+ list[i].weight
									+ '</td><td>'
									+ list[i].mbti
									+ '</td><td>'
									+ list[i].smoking
									+ '</td><td>'
									+ list[i].hobby
									+ '</td><td>'
									+ list[i].style
									+ '</td><td>'
									+ list[i].education
									+ '</td><td>'
									+ list[i].religion
									+ '</td><td>'
									+ list[i].job
									+ '</td><td><img src="/resources/images/' + list[i].filename + '" width="100" height="100"></td><td>'
									+ list[i].aiface + '</td><td>'
									+ list[i].point + '</td><td>' + list[i].lvl
									+ '</td></tr>';

							tableHTML += row;
						}

						// 테이블을 닫음
						tableHTML += '</table>';

						// 테이블을 출력할 HTML 요소에 추가
						$('#result').html(tableHTML);
					}
				});
	}

	function man() {
		$
				.ajax({
					url : "/admin/memberinfo.do",
					type : "POST",
					success : function(response) {
						var sex = '<input type="button" value="전체" onclick="memberinfo()"><input type="button" value="여자" onclick="woman()">'
						$('#sex').html(sex);
						var list = response.list;
						// 테이블을 생성할 HTML 코드

						var tableHTML = '<table border="1"><tr><th>name</th><th>age</th><th>userid</th><th>cellphone</th><th>address</th><th>height</th><th>weight</th><th>MBTI</th><th>smoking</th><th>hobby</th><th>style</th><th>education</th><th>religion</th><th>job</th><th>filename</th><th>AIface</th><th>point</th><th>lvl</th></tr>';
						// 리스트의 각 요소에 대해 테이블 행 추가
						for (var i = 0; i < list.length; i++) {
							if (list[i].gender === 1) {
								var row = '<tr><td>'
										+ list[i].name
										+ '</td><td>'
										+ list[i].age
										+ '</td><td>'
										+ list[i].userid
										+ '</td><td>'
										+ list[i].cellphone
										+ '</td><td>'
										+ list[i].address
										+ '</td><td>'
										+ list[i].height
										+ '</td><td>'
										+ list[i].weight
										+ '</td><td>'
										+ list[i].mbti
										+ '</td><td>'
										+ list[i].smoking
										+ '</td><td>'
										+ list[i].hobby
										+ '</td><td>'
										+ list[i].style
										+ '</td><td>'
										+ list[i].education
										+ '</td><td>'
										+ list[i].religion
										+ '</td><td>'
										+ list[i].job
										+ '</td><td><img src="/resources/images/' + list[i].filename + '" width="100" height="100"></td><td>'
										+ list[i].aiface + '</td><td>'
										+ list[i].point + '</td><td>'
										+ list[i].lvl + '</td></tr>';

								tableHTML += row;
							}
						}

						// 테이블을 닫음
						tableHTML += '</table>';

						// 테이블을 출력할 HTML 요소에 추가
						$('#result').html(tableHTML);
					}
				});
	}

	function woman() {
		$
				.ajax({
					url : "/admin/memberinfo.do",
					type : "POST",
					success : function(response) {
						var sex = '<input type="button" value="전체" onclick="memberinfo()"><input type="button" value="남자" onclick="man()">'
						$('#sex').html(sex);
						var list = response.list;
						// 테이블을 생성할 HTML 코드

						var tableHTML = '<table border="1"><tr><th>name</th><th>age</th><th>userid</th><th>cellphone</th><th>address</th><th>height</th><th>weight</th><th>MBTI</th><th>smoking</th><th>hobby</th><th>style</th><th>education</th><th>religion</th><th>job</th><th>filename</th><th>AIface</th><th>point</th><th>lvl</th></tr>';
						// 리스트의 각 요소에 대해 테이블 행 추가
						for (var i = 0; i < list.length; i++) {
							if (list[i].gender === 2) {
								var row = '<tr><td>'
										+ list[i].name
										+ '</td><td>'
										+ list[i].age
										+ '</td><td>'
										+ list[i].userid
										+ '</td><td>'
										+ list[i].cellphone
										+ '</td><td>'
										+ list[i].address
										+ '</td><td>'
										+ list[i].height
										+ '</td><td>'
										+ list[i].weight
										+ '</td><td>'
										+ list[i].mbti
										+ '</td><td>'
										+ list[i].smoking
										+ '</td><td>'
										+ list[i].hobby
										+ '</td><td>'
										+ list[i].style
										+ '</td><td>'
										+ list[i].education
										+ '</td><td>'
										+ list[i].religion
										+ '</td><td>'
										+ list[i].job
										+ '</td><td><img src="/resources/images/' + list[i].filename + '" width="100" height="100"></td><td>'
										+ list[i].aiface + '</td><td>'
										+ list[i].point + '</td><td>'
										+ list[i].lvl + '</td></tr>';

								tableHTML += row;
							}
						}
						// 테이블을 닫음
						tableHTML += '</table>';

						// 테이블을 출력할 HTML 요소에 추가
						$('#result').html(tableHTML);
					}
				});
	}

	function sales() {
		$
				.ajax({
					url : "/admin/sales.do",
					type : "POST",
					success : function(response) {
						$('#sex').empty();
						var list = response.list;
						// 테이블을 생성할 HTML 코드
						var tableHTML = '<table border="1"><tr><th>userid</th><th>포인트 충전내역</th><th>날짜</th></tr>';
						// 리스트의 각 요소에 대해 테이블 행 추가
						for (var i = 0; i < list.length; i++) {
							var row = '<tr><td>' + list[i].userid + '</td><td>'
									+ list[i].point + '</td><td>' + list[i].day
									+ '</td></tr>';

							tableHTML += row;
						}

						// 테이블을 닫음
						tableHTML += '</table>';

						// 테이블을 출력할 HTML 요소에 추가
						$('#result').html(tableHTML);
					}
				});
	}

	function managereview() {
		$.ajax({
			url : "/admin/managereview.do",
			type : "POST",
			success : function(response) {
				displayTable(response);
			}
		});
	}
</script>

</head>
<body>

	<h2>관리자 페이지</h2>
	<input type="button" value="성공사례관리" onclick="successreview()">
	<input type="button" value="회원관리" onclick="memberinfo()">
	<input type="button" value="매출관리" onclick="sales()">
	<input type="button" value="리뷰관리" onclick="managereview()">
	<div id="sex"></div>
	<div id="result"></div>

</body>
</html>