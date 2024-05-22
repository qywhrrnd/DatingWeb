<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>얼굴 재평가</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩 추가 -->
<style>
body {
	padding-top: 50px; /* 헤더 제외한 상단 여백 추가 */
}

.profile-photo {
	width: 200px;
	height: 200px;
}

.btn {
	margin-top: 10px; /* 버튼 간격 조정 */
}

#AIface {
	margin-top: 10px; /* 입력란 간격 조정 */
	width: 150px; /* 입력란 너비 설정 */
}

.upload-text {
	font-size: 14px; /* 업로드 텍스트 사이즈 설정 */
	margin-top: 10px; /* 업로드 텍스트 간격 설정 */
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function movefile() {
		let fileInput = document.getElementById("file");
		var selectedFile = fileInput.files[0];
		if (selectedFile) {
			var formData = new FormData();
			formData.append("file", selectedFile);
			$.ajax({
				url : "/info/movefile.do",
				type : "POST",
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {
					console.log(response);
				},
				error : function(xhr, status, error) {
					console.error(xhr.responseText);
				}
			});
		} else {
			console.error("No file selected.");
		}
	}

	function score() {
		let timerInterval;
		Swal.fire({
		  title: "사진분석중",
		  html: "잠시만기다려주세요!",
		  timer: 2000,
		  timerProgressBar: true,
		  didOpen: () => {
		    Swal.showLoading();
		    const timer = Swal.getPopup().querySelector("b");
		    timerInterval = setInterval(() => {
		      timer.textContent = `${Swal.getTimerLeft()}`;
		    }, 100);
		  },
		  willClose: () => {
		    clearInterval(timerInterval);
		  }
		}).then((result) => {
		  /* Read more about handling dismissals below */
		  if (result.dismiss === Swal.DismissReason.timer) {
		    console.log("I was closed by the timer");
		  }
		});
		$("#AIface").val("");
		let fileInput = document.getElementById("file");
		var selectedFile = fileInput.files[0];
		if (selectedFile) {
			var filename = selectedFile.name;
			$.ajax({
				url : "/info/facescore.do",
				type : "POST",
				data : {
					file : filename
				},
				success : function(response) {
					console.log(response.prediction);
					$("#AIface").val(response.prediction);
				},
				error : function(xhr, status, error) {
					console.error(xhr.responseText);
				}
			});
		} else {
			console.error("No file selected.");
		}
	}

	function upload() {
		let fileInput = document.getElementById("file");
		if (fileInput != null) {
			$(".profile-photo").css("visibility", "visible");
			var selectedFile = fileInput.files[0];
			var filename = selectedFile.name;
			console.log("Selected file name:", filename);

			// 올린 사진의 미리보기 표시
			let reader = new FileReader();
			reader.onload = function(e) {
				$('#uploaded-image').attr('src', e.target.result);
			}
			reader.readAsDataURL(selectedFile);
		} else {
			$(".profile-photo").css("visibility", "hidden");
		}
	}

	function changeimg() {
		let form1 = $("#form1");
		let AIface = $("#AIface").val();
		let file = $("#file").val();

		if (file == "") {
			alert("사진을 등록해 점수를 평가받아보세요");
			$("#file").focus();
			return;
		}
		if (AIface == "") {
			alert("점수를 평가받아보세요");
			$("#AIface").focus();
			return;
		}
		form1.attr("action", "/mypage/changeimg.do");
		alert("변경되었습니다.");
		form1.submit();
	}

	function back() {
		location.href = "/mypage/mypage.do";
	}
</script>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<%@ include file="../main/header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<form id="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userid" value="${sessionScope.userid }">
		<div class="container">
			<div class="row justify-content-center">
				<!-- 컨테이너를 중앙 정렬 -->
				<div class="col-md-6">
					<!-- 중앙 정렬을 위한 컬럼 설정 -->
					<h2>얼굴 재평가</h2>
					<div>
						<img src="/resources/images/${ilist.filename}" alt="원형 이미지"
							class="avatar-lg rounded-circle img-fluid profile-photo"
							data-toggle="tooltip" data-placement="bottom" title=""
							data-original-title="아바타 이미지 편집"> <input type="file"
							name="file" id="file" accept="image/jpg" multiple="multiple"
							onchange="upload()">
						<p class="upload-text">이미지를 업로드하면 미리보기가 표시됩니다.</p>
					</div>

					<!-- 올린 사진의 미리보기 -->
					<div>
						<h5>올린 사진 미리보기</h5>
						<img id="uploaded-image" src="" alt="Uploaded Image"
							class="profile-photo">
					</div>

					<button type="button" class="btn btn-primary" onclick="movefile()">사진
						확정</button>
					<button type="button" class="btn btn-success" onclick="score()">점수
						확인</button>
					<br> <input type="text" id="AIface" name="AIface" readonly>
					<br>
					<button type="button" class="btn btn-success" onclick="changeimg()">사진
						변경</button>
					<button type="button" class="btn btn-success" onclick="back()">돌아가기</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
