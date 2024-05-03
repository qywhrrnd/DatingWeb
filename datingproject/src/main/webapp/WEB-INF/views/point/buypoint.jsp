<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	function buy() {
		const amount = document.querySelector("input[name='point']:checked").value;
		IMP.init('imp10032786'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		let userid = '${sessionScope.userid}';
		IMP.request_pay({
			pg : "kakaopay",
			pay_method : "card",
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : "데마(데이트 마스터)",
			amount : amount,
			buyer_name : userid
		}, function(rsp) { // callback
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				alert(msg);
				savePayment();

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});
	}

	function savePayment(amount) {
		document.form1.action = "/point/point.do";
		document.form1.submit();
	}
</script>




</head>
<body>
	<%@ include file="../main/header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<form name="form1" method="post">
		<div align="center">
			<h2>포인트 충전</h2>
			<div class="card-body bg-white mt-0 shadow">
				<p style="font-weight: bold">카카오페이 충전</p>

				<label class="box-radio-input"><input type="radio"
					name="point" value="10000"><span>10,000원(11,000P)</span></label><br>
				<label class="box-radio-input"><input type="radio"
					name="point" value="20000"><span>20,000원(22,000P)</span></label>
				<br> <label class="box-radio-input"><input type="radio"
					name="point" value="30000"><span>30,000원(33,000P)</span></label>
				<br> <label class="box-radio-input"><input type="radio"
					name="point" value="40000"><span>40,000원(44,000P)</span></label><br>
				<label class="box-radio-input"><input type="radio"
					name="point" value="50000"><span>50,000원(55,000P)</span></label>

				<p style="color: #ac2925; margin-top: 30px">현재 서비스 점검 중으로 카카오페이
					결제만 가능합니다.</p>
				<button type="button" class="btn btn-lg btn-block  btn-custom"
					id="charge_kakao" onclick="buy()">충 전 하 기</button>
				<input type="hidden" name="userid" value="${sessionScope.userid }">
			</div>
		</div>
	</form>

</body>
</html>