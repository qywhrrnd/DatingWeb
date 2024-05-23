<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script>
	$(document).ready(function() {
		$('#signup').click(function() {
			$('.pinkbox').css('transform', 'translateX(80%)');
			$('.signin').addClass('nodisplay');
			$('.signup').removeClass('nodisplay');
		});

		$('#signin').click(function() {
			$('.pinkbox').css('transform', 'translateX(0%)');
			$('.signup').addClass('nodisplay');
			$('.signin').removeClass('nodisplay');
		});

		// Enter key press event for login form
		$("#form1 input").keydown(function(event) {
			if (event.keyCode === 13) { // Enter key
				event.preventDefault();
				$("#btnLogin").click();
			}
		});

		// Enter key press event for signup form
		$(".signup input").keydown(function(event) {
			if (event.keyCode === 13) { // Enter key
				event.preventDefault();
				$("#sendButton").click();
			}
		});
	});
</script>
<script>
	function check() {
		let form1 = $("#form1");
		let email = $("#email").val();
		let passwd1 = $("#passwd1").val();
		let passwd2 = $("#passwd2").val();
		if (email == "") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return;
		}

		if (passwd1 == "") {
			alert("비밀번호를 입력하세요.");
			$("#passwd1").focus();
			return;
		}
		if (passwd2 == "") {
			alert("비밀번호 확인란을 입력하세요.");
			$("#passwd2").focus();
			return;
		}
		$
				.ajax({
					url : "/member/emailcheck.do",
					type : "POST",
					data : {
						email : email
					},
					success : function(response) {
						alert(response.message);
						if (response.message == "메일이 발송되었습니다.인증번호를 입력해주세요") {
							$(
									'<input type="text" id="verificationCode" placeholder="인증번호">')
									.insertAfter("#passwd2");
							$(
									'<button class="button" onclick="verifyCode()">인증 확인</button>')
									.insertAfter("#verificationCode");
							$("#sendButton").hide();
							$("#passwordresult").hide();
						}
					}
				});
	}

	function verifyCode() {
		let verificationCode = $("#verificationCode").val();
		let email = $("#email").val();
		let passwd1 = $("#passwd1").val();
		// 서버로 인증번호를 전송하여 확인
		$.ajax({
			url : "/member/verifyCode.do",
			type : "POST",
			data : {
				code : verificationCode,
				email : email
			},
			success : function(response) {
				if (response.message == "ok") {
					alert("인증이 완료되었습니다.");
					window.location.href = "/member/join.do?email=" + email
							+ "&passwd=" + passwd1;
				} else {
					alert("인증번호가 틀렸습니다. 처음부터 진행해주세요.");
					window.location.href = "/member/pagelogin.do";
				}
			}
		});
	}

	function checkpwd() {
		let password1 = document.getElementById("passwd1").value;
		let password2 = document.getElementById("passwd2").value;
		let passwordresult = document.getElementById("passwordresult");
		if (password1 != password2) {
			passwordresult.innerHTML = "비밀번호가 일치하지 않습니다";
		} else {
			passwordresult.innerHTML = "비밀번호가 일치합니다.";
		}
	}

	$(document).ready(function() {
		// 비밀번호 확인란 값 입력 시 비교하여 전송 버튼 활성화 여부 결정
		$("#passwd2").keyup(function() {
			let passwd1 = $("#passwd1").val();
			let passwd2 = $("#passwd2").val();
			if (passwd1 != passwd2) {
				$("#sendButton").prop("disabled", true); // 비밀번호 불일치 시 버튼 비활성화
			} else {
				$("#sendButton").prop("disabled", false); // 비밀번호 일치 시 버튼 활성화
			}
		});
	});

	$(function() {
		$("#btnLogin").click(function() {
			userid = $("#userid").val();
			var passwd = $("#password").val();
			if (userid == "") {
				alert("아이디를 입력하세요");
				$("#userid").focus(); //입력포커스 이동

				return; //함수 종료
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요");
				$("#password").focus();
				return;
			}
			//폼 내부의 데이터를 전송할 주소
			document.form1.action = "/member/login.do";
			document.form1.submit(); //제출
		});
	});
</script>
<style>
/* 하이퍼링크 스타일링 */
a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 링크의 색상을 상위 요소로부터 상속 */
}
</style>

</head>
<body>
	<div class="container">
		<div class="welcome">
			<div class="pinkbox">
				<div class="signup nodisplay">

					<h1>회원가입</h1>
					<form autocomplete="off" method="post">
						<input type="email" id="email" name="email"
							placeholder="아이디(email형식)"> <input type="password"
							id="passwd1" name="passwd1" placeholder="password"> <input
							type="password" id="passwd2" name="passwd2"
							placeholder="confirm password" oninput="checkpwd()">
						<div id="passwordresult"></div>
						<input type="button" id="sendButton" onclick="check()"
							value="인증 번호 전송">
					</form>
				</div>
				<div class="signin">

					<h1>로그인</h1>
					<form name="form1" id="form1" class="more-padding"
						autocomplete="off">
						<input type="text" id="userid" name="userid" placeholder="아이디">
						<input type="password" id="password" name="password"
							placeholder="password">

						<button type="button" id="btnLogin" class="button submit">login</button>
						<c:if test="${message == 'error'}">
							<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
						</c:if>
					</form>
				</div>
			</div>
			<div class="leftbox">
				<a href="/">
					<h2 class="title">
						<span>데이트</span><br>마스터
					</h2>
				</a>
				<p class="desc">
					데이트 상대를 골라보세요 <span>데마</span>
				</p>
				<img class="flower smaller"
					src="https://image.ibb.co/d5X6pn/1357d638624297b.jpg"
					alt="1357d638624297b" border="0">
				<p class="account">have an account?</p>
				<button class="button" id="signin">로그인</button>
			</div>
			<div class="rightbox">
				<a href="/">
					<h2 class="title">
						<span>데이트</span><br>마스터
					</h2>
				</a>
				<p class="desc">
					데이트 상대를 골라보세요 <span>데마</span>
				</p>
				<img class="flower"
					src="https://preview.ibb.co/jvu2Un/0057c1c1bab51a0.jpg" />
				<p class="account">don't have an account?</p>
				<button class="button" id="signup">회원가입</button>
			</div>
		</div>
	</div>


</body>


</html>