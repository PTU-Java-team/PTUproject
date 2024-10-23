<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>고객 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f7a4a4, #f5d19c);
        }
        .container {
            margin-top: 50px;
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .confirmation-box {
            margin-top: 20px;
            padding: 15px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 10px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>고객 정보 수정</h2>
    <form action="/update" method="post" name="updateForm">

        <div class="mb-3">
            <label for="member_id" class="form-label">ID</label>
            <input type="text" class="form-control" id="member_id" name="member_id" value="${member.member_id}" readonly>
        </div>

        <div class="mb-3">
            <label for="member_Email" class="form-label">이메일</label>
            <input type="text" class="form-control" id="member_Email" name="member_Email" value="${member.member_Email}" readonly>
        </div>

        <div class="mb-3">
            <label for="member_Password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="member_Password" name="member_Password">
        </div>

        <div class="mb-3">
            <label for="member_Name" class="form-label">이름</label>
            <input type="text" class="form-control" id="member_Name" name="member_Name" value="${member.member_Name}" readonly>
        </div>

        <div class="mb-3">
            <label for="member_Age" class="form-label">나이</label>
            <input type="text" class="form-control" id="member_Age" name="member_Age" value="${member.member_Age}">
        </div>

        <div class="mb-3">
            <label for="member_Mobile" class="form-label">전화번호</label>
            <input type="text" class="form-control" id="member_Mobile" name="member_Mobile" value="${member.member_Mobile}">
        </div>

        <div class="confirmation-box">
            <p>비밀번호는 확인용입니다.</p>
        </div><br>&nbsp;

        <div class="text-center">
            <button type="button" class="btn btn-primary" onclick="update()">수정</button>
        </div>
    </form>
</div>

<script>
    const update = () => {
        const passwordDB = '${member.member_Password}';
        const password = document.getElementById("member_Password").value;
        if (passwordDB === password) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
    const redirectToPreviousPage = () => {
        location.href = '/list'; // 수정 후 돌아갈 페이지 URL
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
