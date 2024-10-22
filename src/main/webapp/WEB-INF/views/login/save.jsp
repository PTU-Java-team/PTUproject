<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 16.
  Time: 오후 8:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>login</title>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <!--이건 jQuery 이고 CDN 을 받아 온 것이다. 이메일 중복체크에 사용된다 이때 ajax 기능을 사용하기 위해 하는 것임-->
  <!--ajax는 DB에 동일한 이메일이 있는지 체크, 이메일을 입력하고 입력창을 벗어나면 확인하는 것-->
  <style>
    body {
      display: grid;
      height: 100vh; /* 전체 화면 높이 */
      place-items: center; /* 중앙 정렬 */
      margin: 0; /* 기본 여백 제거 */
      background-color: #f0f0f0; /* 배경색 추가 */
    }
    fieldset {
      width: 500px; /* 박스 너비 조정 */
      height: 600px; /* 박스 높이 조정 */
      padding: 40px; /* 패딩 추가 */
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
      border-radius: 10px; /* 모서리 둥글게 */
      background-color: white; /* 배경색 흰색 */
      flex-direction: column; /* 세로 방향 정렬 */
      justify-content: center; /* 세로 중앙 정렬 */
      align-items: center; /* 가로 중앙 정렬 */
    }

    legend {
      font-size: 40px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: 90%; /* 입력 필드 너비 */
      margin: 10px 0; /* 여백 */
      padding: 10px; /* 패딩 */
    }
    input[type="submit"],
    input[type="reset"] {
      width: 45%; /* 버튼 너비 */
      padding: 10px; /* 패딩 */
    }
  </style>
</head>
<body>
<form action="/save" method="post">
  <fieldset>
    <legend>회원가입</legend>

    이메일 : <br>
    <input type="text" name="member_Email" placeholder="이메일" id="member_Email" onblur="emailCheck()">
    <p id="check-result"></p>
    <c:if test="${not empty error}">
      <p style="color:red;">${error}</p>
    </c:if>
    <br>

    비밀번호 : <br>
    <input type="text" name="member_Password" placeholder="비밀번호"><br><br>    <!--이거 타입을 password로 해야하는데 영상에서 이러니 참고바람/나중에 수정해볼 예정 일단 홀드-->

    이름 : <br>
    <input type="text" name="member_Name" placeholder="이름"><br><br>

    나이 : <br>
    <input type="text" name="member_Age" placeholder="나이"><br><br>

    전화번호 : <br>
    <input type="text" name="member_Mobile" placeholder="전화번호"><br><br>


    <div align="center">
      <input type="submit" value="회원가입">&nbsp;&nbsp;
      <input type="reset" value="다시작성">
    </div>
    <br><br>

    </div>
  </fieldset>
  <br><br><br><br>
</form>
</body>

<script>
  // 과정은
  // 이메일 입력값을 가져오고 => 입력값을 서버로 전송하고 똑같은 이메일이 있는지 체크한 후
  // 사용 가능 여부를 이메일 입력창 아래에 표시  이다.

  // ajax의 목적은 화면에 변화가 없이 서버와 http 요청을 주고받자는 것
  // 이러한 것을 비동기 통신이라고 함

  const emailCheck = () => {
    const email = document.getElementById("member_Email").value;   //이곳에 입력값을 가져옴
    const checkResult = document.getElementById("check-result");  //출력을 위한 요소를 가져옴, 위에 p태그에 관련
    console.log("입력한 이메일", email);  //그냥 확인용 콘솔임...
    $.ajax({
      // 요청방식: post, url: "email-check", 데이터: 이메일
      type: "post",
      url: "/email-check",
      data: {
        "member_Email": email
      },
      success: function(res) {
        console.log("요청성공", res);
        if (res == "ok") {      // 만약 DB에 입력된 이메일이 없는 상황이면
          console.log("사용가능한 이메일");   // 사용이 가능하다는 것
          checkResult.style.color = "green";
          checkResult.innerHTML = "사용가능한 이메일";
        } else {
          console.log("이미 사용중인 이메일");
          checkResult.style.color = "red";
          checkResult.innerHTML = "이미 사용중인 이메일";
        }
      },
      error: function(err) {
        console.log("에러발생", err);
      }
    });
  }
</script>

</html>
