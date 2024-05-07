<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Open+Sans:300,400|Lora");

body {
	background: #CBC0D3;
}

/* div box styling */
.container {
	margin: auto;
	width: 650px;
	height: 550px;
	position: relative;
}

.welcome {
	background: #f6f6f6;
	width: 650px;
	height: 415px;
	position: absolute;
	top: 25%;
	border-radius: 5px;
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
}

.pinkbox {
	position: absolute;
	top: -10%;
	left: 5%;
	background: #EAC7CC;
	width: 320px;
	height: 500px;
	border-radius: 5px;
	box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
	transition: all 0.5s ease-in-out;
	z-index: 2;
}

.nodisplay {
	display: none;
	transition: all 0.5s ease;
}

.leftbox, .rightbox {
	position: absolute;
	width: 50%;
	transition: 1s all ease;
}

.leftbox {
	left: -2%;
}

.rightbox {
	right: -2%;
}

/* font & button styling */
h1 {
	font-family: "Open Sans", sans-serif;
	text-align: center;
	margin-top: 95px;
	text-transform: uppercase;
	color: #f6f6f6;
	font-size: 2em;
	letter-spacing: 8px;
}

.title {
	font-family: "Lora", serif;
	color: #8E9AAF;
	font-size: 1.8em;
	line-height: 1.1em;
	letter-spacing: 3px;
	text-align: center;
	font-weight: 300;
	margin-top: 20%;
}

.desc {
	margin-top: -8px;
}

.account {
	margin-top: 45%;
	font-size: 10px;
}

p {
	font-family: "Open Sans", sans-serif;
	font-size: 0.7em;
	letter-spacing: 2px;
	color: #8E9AAF;
	text-align: center;
}

span {
	color: #EAC7CC;
}

.flower {
	position: absolute;
	width: 120px;
	height: 120px;
	top: 46%;
	left: 29%;
	opacity: 0.7;
}

.smaller {
	width: 90px;
	height: 100px;
	top: 48%;
	left: 38%;
	opacity: 0.9;
}

button {
	padding: 12px;
	font-family: "Open Sans", sans-serif;
	text-transform: uppercase;
	letter-spacing: 3px;
	font-size: 11px;
	border-radius: 10px;
	margin: auto;
	outline: none;
	display: block;
}

button:hover {
	background: #EAC7CC;
	color: #f6f6f6;
	transition: background-color 1s ease-out;
}

.button {
	margin-top: 3%;
	background: #f6f6f6;
	color: #ce7d88;
	border: solid 1px #EAC7CC;
}

/* form styling */
form {
	display: flex;
	align-items: center;
	flex-direction: column;
	padding-top: 7px;
}

.more-padding {
	padding-top: 35px;
}

.more-padding input {
	padding: 12px;
}

.more-padding .submit {
	margin-top: 45px;
}

.submit {
	margin-top: 25px;
	padding: 12px;
	border-color: #ce7d88;
}

.submit:hover {
	background: #CBC0D3;
	border-color: #bfb1c9;
}

input {
	background: #EAC7CC;
	width: 65%;
	color: #ce7d88;
	border: none;
	border-bottom: 1px solid rgba(246, 246, 246, 0.5);
	padding: 9px;
	margin: 7px;
}

input::placeholder {
	color: #f6f6f6;
	letter-spacing: 2px;
	font-size: 1.3em;
	font-weight: 100;
}

input:focus {
	color: #ce7d88;
	outline: none;
	border-bottom: 1.2px solid rgba(206, 125, 136, 0.7);
	font-size: 1em;
	transition: 0.8s all ease;
}

input:focus::placeholder {
	opacity: 0;
}

label {
	font-family: "Open Sans", sans-serif;
	color: #ce7d88;
	font-size: 0.8em;
	letter-spacing: 1px;
	display: inline-block;
	margin-right: 10px;
}

.checkbox {
	display: inline;
	white-space: nowrap;
	position: relative;
	left: -62px;
	top: 5px;
}

input[type=checkbox] {
	width: 7px;
	background: #ce7d88;
}

.checkbox input[type=checkbox]:checked+label {
	color: #ce7d88;
	transition: 0.5s all ease;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function showPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						let fullAddr = "";
						let extraAddr = "";
						if (data.userSelectedType === "R") {
							fullAddr = data.roadAddress;
						} else {
							fullAddr = data.jibunAddress;
						}
						if (data.userSelectedType === "R") {
							if (data.bname !== "") {
								extraAddr += data.bname;
							}
							if (data.buildingName !== "") {
								extraAddr += (extraAddr !== "" ? ", "
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== "" ? " (" + extraAddr
									+ ")" : "");
						}
						document.getElementById("post_code").value = data.zonecode;
						document.getElementById("address1").value = fullAddr;
						document.getElementById("address2").focus();
					}
				}).open();
	}

	function upload() {//이미지 업로드 하면 미리보기 부분 보이게/안보이게
		let fileInput = document.getElementById("file");
		if (fileInput != null) {
			$(".profile-photo").css("visibility", "visible");
			var selectedFile = fileInput.files[0];
			// 파일 이름 추출
			var filename = selectedFile.name;

			// 파일 이름 표시 (선택 사항)
			console.log("선택된 파일 이름:", filename);
		} else {
			$(".profile-photo").css("visibility", "hidden");
		}
	}

	function back() {
		location.href = "/mypage/mypage.do";
	}
	
	
	function updateinfo(){
		let form1 = $("#form1");
    	let name = $("#name").val();
    	let age = $("#age").val();
    	let height = $("#height").val();
    	let weight = $("#weight").val();
    	let cellphone = $("#cellphone").val();
    	let address = $("#address").val();
    	let MBTI = $("#MBTI").val();
    	let hobby = $("#hobby").val();
    	let style = $("#style").val();
    	let education = $("#education").val();
    	let religion = $("#religion").val();
    	let job = $("#job").val();
    	let description = $("#description").val();
		
    	if(name==""){
    		alert("이름을 입력하세요");
			$("#name").focus();
			return;
    	}
    	if(age==""){
    		alert("나이를 입력하세요");
			$("#age").focus();
			return;
    	}
    	
    	if(height==""){
    		alert("키를 입력하세요");
			$("#height").focus();
			return;
    	}
    	if(weight==""){
    		alert("몸무게를 입력하세요");
			$("#weight").focus();
			return;
    	}
    	if(cellphone==""){
    		alert("전화번호를 입력하세요");
			$("#cellphone").focus();
			return;
    	}
    	if(address==""){
    		alert("주소를 입력하세요");
			$("#address").focus();
			return;
    	}
    	if(MBTI==""){
    		alert("MBTI를 입력하세요");
			$("#MBTI").focus();
			return;
    	}
    	
    	if(hobby==""){
    		alert("취미를 입력하세요");
			$("#hobby").focus();
			return;
    	}
    	if(style==""){
    		alert("스타일을 입력하세요");
			$("#style").focus();
			return;
    	}
    	if(education==""){
    		alert("학벌을 입력하세요");
			$("#education").focus();
			return;
    	}
    	if(religion==""){
    		alert("종교를 입력하세요");
			$("#religion").focus();
			return;
    	}
    	if(job==""){
    		alert("직업을 입력하세요");
			$("#job").focus();
			return;
    	}
    	
    	form1.attr("action", "/mypage/updateinfo.do");
    	alert("수정되었습니다.");
		form1.submit();
    } 
	

	function change_passwd(userid) {
		var userId = "${dto.userid}";
		var url = "/mypage/detail_passwd.do?userid=" + userId;

		// 팝업 창 크기 설정
		var popupWidth = 600;
		var popupHeight = 700;

		// 화면 가운데에 위치 계산
		var left = (window.innerWidth - popupWidth) / 2;
		var top = (window.innerHeight - popupHeight) / 2;

		// 작은 팝업 창을 열기 위한 코드
		window.open(url, '비밀번호 변경', 'width=' + popupWidth + ',height='
				+ popupHeight + ',left=' + left + ',top=' + top);
	}
</script>

<div class="container">
${alertScript}
	<h2 align="center">개인정보 수정</h2>
	<hr style="text-align: left; margin-left: 0">
	<form id="form1" method="post" enctype="multipart/form-data">

		<input type="hidden" name="userid" value="${sessionScope.userid}">

		<table>
			<tr>
				<th>이름</th>
			</tr>
			<tr>
				<td><input type="text" name="name" id="name"
					value="${dto.name}"></td>
			</tr>
			<tr>
				<th>나이</th>
			</tr>
			<tr>
				<td><input type="number" name="age" id="age" value="${dto.age}"></td>
			</tr>

			<tr>
				<th>키</th>
			</tr>
			<tr>
				<td><input type="number" name="height" id="height"
					value="${dto.height}"></td>
			</tr>
			<tr>
				<th>몸무게</th>
			</tr>
			<tr>
				<td><input type="number" name="weight" id="weight"
					value="${dto.weight}"></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
			</tr>
			<tr>
				<td><input type="text" name="cellphone" id="cellphone"
					value="${dto.cellphone}"></td>
			</tr>
			<tr>
				<th>주소</th>
			</tr>
			<tr>
				<td><input placeholder="우편번호" name="zipcode" id="post_code"
					readonly>&nbsp;&nbsp;&nbsp; <input type="button"
					onclick="showPostcode()" value="우편번호 찾기">
			</tr>
			<tr>
				<td><input placeholder="주소" name="address1" id="address1"
					size="60" value="${dto.address}"> <br> <input
					name="address2" id="address2"></td>
			</tr>
			<tr>
				<th>MBTI</th>
			</tr>
			<tr>
				<td><input type="text" name="MBTI" id="MBTI"
					value="${dto.MBTI}"></td>
			</tr>

			<tr>
				<th>취미</th>
			</tr>
			<tr>
				<td><input type="text" name="hobby" id="hobby"
					value="${dto.hobby}"></td>
			</tr>
			<tr>
				<th>스타일</th>
			</tr>
			<tr>
				<td><input type="text" name="style" id="style"
					value="${dto.style}"></td>
			</tr>
			<tr>
				<th>학력</th>
			</tr>
			<tr>
				<td><input type="text" name="education" id="education"
					value="${dto.education}"></td>
			</tr>
			<tr>
				<th>종교</th>
			</tr>
			<tr>
				<td><input type="text" name="religion" id="religion"
					value="${dto.religion}"></td>
			</tr>
			<tr>
				<th>직업</th>
			</tr>
			<tr>
				<td><input type="text" name="job" id="job" value="${dto.job}"></td>
			</tr>

			<tr>
				<th>한마디</th>
			</tr>

			<tr>
				<td><textarea rows="5" cols="60" id="description"
						name="description">${dto.description}</textarea> <script>
							CKEDITOR.replace("description", {
								filebrowserUploadUrl : "/info/imageUpload.do"
							});
						</script></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="수정하기" onclick="updateinfo()"></td>
				<td colspan="2" align="center"><input type="button"
					value="비밀번호 변경" onclick="change_passwd('${ilist.userid}')"></td>
				<td colspan="2" align="center"><input type="button"
					value="돌아가기" onclick="back()"></td>
			</tr>
		</table>
	</form>
</div>
</body>




</html>