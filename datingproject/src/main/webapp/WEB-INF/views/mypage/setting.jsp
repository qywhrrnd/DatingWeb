<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personal Information Update</title>
<style>
@import url("https://fonts.googleapis.com/css?family=Open+Sans:300,400|Lora");

body {
    background: #CBC0D3;
    font-family: "Open Sans", sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    overflow: hidden; /* Prevents body scrolling */
}

.container-wrapper {
    height: 100%;
    width: 100%;
    overflow: auto; /* Enables scrolling within the container */
}

.container {
    background: #f6f6f6;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    max-width: 700px;
    width: 100%;
    padding: 20px;
    margin: 20px; /* Adds some margin for better spacing on small screens */
}

h2 {
    text-align: center;
    color: #8E9AAF;
    font-family: "Lora", serif;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    text-align: left;
    padding: 10px;
}

th {
    background: #EAC7CC;
    color: #fff;
    border-radius: 5px 5px 0 0;
}

td input[type="text"],
td input[type="number"],
td input[type="button"],
td textarea {
    width: calc(100% - 22px);
    padding: 10px;
    border: 1px solid #EAC7CC;
    border-radius: 5px;
    margin-bottom: 10px;
    font-size: 1em;
}

td input[type="button"] {
    background: #EAC7CC;
    color: #fff;
    cursor: pointer;
    transition: background 0.3s ease;
}

td input[type="button"]:hover {
    background: #ce7d88;
}

textarea {
    resize: none;
}

input[type="button"].submit {
    background: #8E9AAF;
    color: #fff;
}

input[type="button"].submit:hover {
    background: #5f6770;
}

hr {
    border: none;
    height: 1px;
    background: #EAC7CC;
    margin: 20px 0;
}
.button-group {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.button-group input[type="button"] {
    flex: 1;
    max-width: 150px; /* Adjust the maximum width as needed */
    padding: 10px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function showPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                        extraAddr += (extraAddr !== "" ? ", " + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== "" ? " (" + extraAddr + ")" : "");
                }
                document.getElementById("post_code").value = data.zonecode;
                document.getElementById("address1").value = fullAddr;
                document.getElementById("address2").focus();
            }
        }).open();
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

        if(name==""){ alert("이름을 입력하세요"); $("#name").focus(); return; }
        if(age==""){ alert("나이를 입력하세요"); $("#age").focus(); return; }
        if(height==""){ alert("키를 입력하세요"); $("#height").focus(); return; }
        if(weight==""){ alert("몸무게를 입력하세요"); $("#weight").focus(); return; }
        if(cellphone==""){ alert("전화번호를 입력하세요"); $("#cellphone").focus(); return; }
        if(address==""){ alert("주소를 입력하세요"); $("#address").focus(); return; }
        if(MBTI==""){ alert("MBTI를 입력하세요"); $("#MBTI").focus(); return; }
        if(hobby==""){ alert("취미를 입력하세요"); $("#hobby").focus(); return; }
        if(style==""){ alert("스타일을 입력하세요"); $("#style").focus(); return; }
        if(education==""){ alert("학벌을 입력하세요"); $("#education").focus(); return; }
        if(religion==""){ alert("종교를 입력하세요"); $("#religion").focus(); return; }
        if(job==""){ alert("직업을 입력하세요"); $("#job").focus(); return; }

        form1.attr("action", "/mypage/updateinfo.do");
        alert("수정되었습니다.");
        form1.submit();
    } 

    function change_passwd(userid) {
        var userId = "${dto.userid}";
        var url = "/mypage/detail_passwd.do?userid=" + userId;
        var popupWidth = 600;
        var popupHeight = 700;
        var left = (window.innerWidth - popupWidth) / 2;
        var top = (window.innerHeight - popupHeight) / 2;
        window.open(url, '비밀번호 변경', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + left + ',top=' + top);
    }

    function back() {
        location.href = "/mypage/mypage.do";
    }
</script>
</head>
<body>
<div class="container-wrapper" align="center">
    <div class="container">
        ${alertScript}
        <h2>개인정보 수정</h2>
        <hr>
        <form id="form1" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userid" value="${sessionScope.userid}">
            <table>
                <tr>
                    <th>이름</th>
                </tr>
                <tr>
                    <td><input type="text" name="name" id="name" value="${dto.name}"></td>
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
                    <td><input type="number" name="height" id="height" value="${dto.height}"></td>
                </tr>
                <tr>
                    <th>몸무게</th>
                </tr>
                <tr>
                    <td><input type="number" name="weight" id="weight" value="${dto.weight}"></td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                </tr>
                <tr>
                    <td><input type="text" name="cellphone" id="cellphone" value="${dto.cellphone}"></td>
                </tr>
                <tr>
                    <th>주소</th>
                </tr>
                <tr>
                    <td><input type="text" placeholder="우편번호" name="zipcode" id="post_code" readonly>&nbsp;&nbsp;&nbsp;<input type="button" onclick="showPostcode()" value="우편번호 찾기"></td>
                </tr>
                <tr>
                    <td><input type="text" placeholder="주소" name="address1" id="address1" size="60" value="${dto.address}"><br><input type="text" name="address2" id="address2"></td>
                </tr>
                <tr>
                    <th>MBTI</th>
                </tr>
                <tr>
                    <td><input type="text" name="MBTI" id="MBTI" value="${dto.MBTI}"></td>
                </tr>
                <tr>
                    <th>취미</th>
                </tr>
                <tr>
                    <td><input type="text" name="hobby" id="hobby" value="${dto.hobby}"></td>
                </tr>
                <tr>
                    <th>스타일</th>
                </tr>
                <tr>
                    <td><input type="text" name="style" id="style" value="${dto.style}"></td>
                </tr>
                <tr>
                    <th>학력</th>
                </tr>
                <tr>
                    <td><input type="text" name="education" id="education" value="${dto.education}"></td>
                </tr>
                <tr>
                    <th>종교</th>
                </tr>
                <tr>
                    <td><input type="text" name="religion" id="religion" value="${dto.religion}"></td>
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
                    <td><textarea rows="5" cols="60" id="description" name="description">${dto.description}</textarea><script>CKEDITOR.replace("description", { filebrowserUploadUrl : "/info/imageUpload.do" });</script></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <div class="button-group">
                            <input type="button" class="submit" value="수정하기" onclick="updateinfo()">
                            <input type="button" class="submit" value="비밀번호 변경" onclick="change_passwd('${ilist.userid}')">
                            <input type="button" class="submit" value="돌아가기" onclick="back()">
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
