<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	function successreview() {
		$
				.ajax({
					url : "/admin/successreview.do",
					type : "POST",
					success : function(response) {
						$('#sex').empty();
						var list = response.list;
						var tableHTML = '<form id="form1" method="post" action="/admin/writereview.do" enctype="multipart/form-data"><br><input type="file" name="file" id="file" accept="image/jpg" multiple="multiple"><br><input type="text" name="name1" placeholder="이름1"><br><input type="text" name="name2" placeholder="이름2"><br><input type="text" name="content" placeholder="내용"><br><input type="button" onclick="writereview()" value="등록"></form><br><table border="1"><tr><th>idx</th><th>사진</th><th>이름1</th><th>이름2</th><th>내용</th></tr>';
						for (var i = 0; i < list.length; i++) {
							var row = '<tr><td>'
									+ list[i].idx
									+ '</td><td><img src="/resources/images/' + list[i].filename + '" width="100" height="100"></td><td>'
									+ list[i].name1 + '</td><td>'
									+ list[i].name2 + '</td><td>'
									+ list[i].content + '</td></tr>';
							tableHTML += row;
						}
						tableHTML += '</table>';

						$('#result').html(tableHTML);
					}
				});
	}

	function writereview() {
	    var formData = new FormData($("#form1")[0]); 
	    $.ajax({
	        url: "/admin/writereview.do",
	        type: "POST",
	        data: formData,
	        contentType: false,
	        processData: false,
	        success: function(response) {
	        	$('#sex').empty();
				var list = response.list;
				var tableHTML = '<form id="form1" method="post" action="/admin/writereview.do" enctype="multipart/form-data"><input type="file" name="file" id="file" accept="image/jpg" multiple="multiple"><br><input type="text" name="name1" placeholder="이름1"><br><input type="text" name="name2" placeholder="이름2"><br><input type="text" name="content" placeholder="내용"><br><input type="submit" value="등록"></form><br><table border="1"><tr><th>idx</th><th>사진</th><th>이름1</th><th>이름2</th><th>내용</th></tr>';
				for (var i = 0; i < list.length; i++) {
					var row = '<tr><td>'
							+ list[i].idx
							+ '</td><td><img src="/resources/images/' + list[i].filename + '" width="100" height="100"></td><td>'
							+ list[i].name1 + '</td><td>'
							+ list[i].name2 + '</td><td>'
							+ list[i].content + '</td></tr>';
					tableHTML += row;
				}
				tableHTML += '</table>';

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
						var sex = '<br><input type="button" value="남자" onclick="man()"><input type="button" value="여자" onclick="woman()">';
						$('#sex').html(sex);
						var list = response.list;
						var tableHTML = '<table border="1"><tr><th>name</th><th>age</th><th>userid</th><th>cellphone</th><th>address</th><th>height</th><th>weight</th><th>MBTI</th><th>smoking</th><th>hobby</th><th>style</th><th>education</th><th>religion</th><th>job</th><th>filename</th><th>AIface</th><th>point</th><th>lvl</th></tr>';
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
						tableHTML += '</table>';
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
						var sex = '<br><input type="button" value="전체" onclick="memberinfo()"><input type="button" value="여자" onclick="woman()">';
						$('#sex').html(sex);
						var list = response.list;
						var tableHTML = '<table border="1"><tr><th>name</th><th>age</th><th>userid</th><th>cellphone</th><th>address</th><th>height</th><th>weight</th><th>MBTI</th><th>smoking</th><th>hobby</th><th>style</th><th>education</th><th>religion</th><th>job</th><th>filename</th><th>AIface</th><th>point</th><th>lvl</th></tr>';
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
						tableHTML += '</table>';
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
						var sex = '<br><input type="button" value="전체" onclick="memberinfo()"><input type="button" value="남자" onclick="man()">';
						$('#sex').html(sex);
						var list = response.list;
						var tableHTML = '<table border="1"><tr><th>name</th><th>age</th><th>userid</th><th>cellphone</th><th>address</th><th>height</th><th>weight</th><th>MBTI</th><th>smoking</th><th>hobby</th><th>style</th><th>education</th><th>religion</th><th>job</th><th>filename</th><th>AIface</th><th>point</th><th>lvl</th></tr>';
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
						tableHTML += '</table>';
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
						var tableHTML = '<br><table border="1"><tr><th>userid</th><th>포인트 충전내역</th><th>날짜</th></tr>';
						for (var i = 0; i < list.length; i++) {
							var row = '<tr><td>' + list[i].userid + '</td><td>'
									+ list[i].point + '</td><td>' + list[i].day
									+ '</td></tr>';
							tableHTML += row;
						}
						tableHTML += '</table>';
						$('#result').html(tableHTML);
					}
				});
	}

	function managereview() {
		$
				.ajax({
					url : "/admin/mainreview.do",
					type : "POST",
					success : function(response) {
						$('#sex').empty();
						let list = response.list;
						let tableHTML = '<br><table border="1"><tr><th>idx</th><th>userid</th><th>이름</th><th>리뷰</th><th>삭제</th></tr>';
						for (let i = 0; i < list.length; i++) {
							let row = '<tr><td>'
									+ list[i].idx
									+ '</td><td>'
									+ list[i].userid
									+ '</td><td>'
									+ list[i].name
									+ '</td><td>'
									+ list[i].content
									+ '</td><td><input type="button" value = "삭제" onclick="deletemainreview('
									+ list[i].idx + ')"></td></tr>';
							tableHTML += row;
						}
						tableHTML += '</table>';
						$('#result').html(tableHTML);
					}
				});
	}

	function deletemainreview(idx) {
		$
				.ajax({
					url : "/admin/deletemainreview.do",
					type : "POST",
					data : {
						idx : idx
					},
					success : function(response) {
						$('#sex').empty();
						let list = response.list;
						let tableHTML = '<br><table border="1"><tr><th>idx</th><th>userid</th><th>이름</th><th>리뷰</th><th>삭제</th></tr>';
						for (let i = 0; i < list.length; i++) {
							let row = '<tr><td>'
									+ list[i].idx
									+ '</td><td>'
									+ list[i].userid
									+ '</td><td>'
									+ list[i].name
									+ '</td><td>'
									+ list[i].content
									+ '</td><td><input type="button" value = "삭제" onclick="deletemainreview('
									+ list[i].idx + ')"></td></tr>';
							tableHTML += row;
						}
						tableHTML += '</table>';
						$('#result').html(tableHTML);
					}
				});
	}

	function logout() {
		location.href = "/member/logout.do";
	}
</script>

</head>
<body>

	<h2>관리자 페이지</h2>
	<input type="button" value="성공사례관리" onclick="successreview()">
	<input type="button" value="회원관리" onclick="memberinfo()">
	<input type="button" value="매출관리" onclick="sales()">
	<input type="button" value="리뷰관리" onclick="managereview()">
	<input type="button" value="로그아웃" onclick="logout()">
	<div id="write"></div>
	<div id="sex"></div>
	<div id="result"></div>

</body>
</html>
