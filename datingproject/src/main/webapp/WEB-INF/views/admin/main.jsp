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
		$.ajax({
					url : "/admin/successreview.do",
					type : "POST",
					success : function(response) {
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
		$.ajax({
			url : "/admin/memberinfo.do",
			type : "POST",
			success : function(response) {
				displayTable(response);
			}
		});
	}

	
	
	function sales() {
		$.ajax({
			url : "/admin/sales.do",
			type : "POST",
			success : function(response) {
				displayTable(response);
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
	<div id="result"></div>

</body>
</html>