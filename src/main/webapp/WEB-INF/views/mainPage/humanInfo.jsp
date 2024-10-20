<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 17.
  Time: 오전 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal Infomation</title>
  <style>
    body {
      display: grid;
      height: 100vh; /* 전체 화면 높이 */
      place-items: center; /* 중앙 정렬 */
      margin: 0; /* 기본 여백 제거 */
      background-color: #f0f0f0; /* 배경색 추가 */
    }
    fieldset {
      width: 1100px; /* 박스 너비 조정 */
      height: 2400px; /* 박스 높이 조정 */
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
  </style>
</head>
<body>
<br><br>
  <fieldset>
    <legend>개인정보 처리방침</legend>

    <br><br>
    <h2>개인정보 처리 방침</h2><br><br>
    <strong>[쇼핑몰 이름] (이하 "회사")는 고객님의 개인정보를 소중하게 생각하며, 개인정보 보호법 및 관련 법령을 준수하여 고객님의 개인정보를 안전하게 처리합니다. 본 개인정보 처리 방침은 회사가 수집하는 개인정보의 항목, 수집 및 이용 목적, 보유 및 이용 기간, 제3자 제공, 처리 위탁, 고객님의 권리 및 행사 방법에 대해 안내합니다.</strong>

    <br><br><br>

    <h3>1. 개인정보의 수집 항목</h3><br>
    회사는 다음과 같은 개인정보를 수집합니다:<br>
    <br>
    <ul>성명</ul>
    <ul>이메일 주소</ul>
    <ul>전화번호</ul>
    <ul>주소</ul>
    <ul>결제 정보 (신용카드 정보 등)</ul>
    <ul>IP 주소 및 쿠키</ul><br><br>
    <h3>2. 개인정보의 수집 및 이용 목적</h3><br>
    회사는 수집한 개인정보를 다음과 같은 목적으로 이용합니다:<br>

    <ul>회원 가입 및 관리</ul>
    <ul>서비스 제공 및 주문 처리</ul>
    <ul>결제 및 배송</ul>
    <ul>고객 문의 및 불만 처리</ul>
    마케팅 및 프로모션 제공<br><br>
    <h3>3. 개인정보의 보유 및 이용 기간</h3><br>
    회사는 고객님의 개인정보를 수집 목적이 달성된 후에는 지체 없이 파기합니다. 단, 관계 법령에 따라 보존해야 하는 경우에는 해당 기간 동안 보관합니다.<br><br><br>

    <h3>4. 개인정보의 제3자 제공</h3><br>
    회사는 고객님의 개인정보를 제3자에게 제공하지 않습니다. 단, 다음의 경우는 예외로 합니다:<br><br>

    <ul>고객님이 사전에 동의한 경우</ul>
    <ul>법령에 의해 요구되는 경우</ul><br><br>
    <h3>5. 개인정보 처리 위탁</h3><br><br>
    회사는 서비스 제공을 위해 필요한 경우 개인정보 처리 업무를 외부에 위탁할 수 있으며, 이 경우 위탁 계약을 통해 개인정보 보호를 위해 필요한 사항을 규정합니다.<br><br><br>

    <h3>6. 고객님의 권리</h3><br>
    고객님은 언제든지 자신의 개인정보에 대한 열람, 정정, 삭제, 처리 정지를 요청할 수 있습니다. 이러한 요청은 회사의 고객센터를 통해 가능합니다.<br><br><br>

    <h3>7. 개인정보의 안전성 확보 조치</h3><br>
    회사는 고객님의 개인정보를 보호하기 위해 다음과 같은 안전성 확보 조치를 취하고 있습니다:<br><br>

    <ul>암호화</ul>
    <ul>접근 통제</ul>
    <ul>보안 프로그램 설치 및 관리</ul><br>
    <h3>8. 개인정보 처리 방침의 변경</h3><br>
    회사는 개인정보 처리 방침을 변경할 경우, 변경 사항을 웹사이트에 공지합니다. 변경된 방침은 공지한 날로부터 효력을 발생합니다.<br><br><br>

    <h3>9. 연락처</h3><br>
    개인정보 보호 관련 문의는 아래의 연락처로 해주시기 바랍니다:<br><br><br>

    <strong>이메일: abc@ptu.ac.kr<br></strong>
    <strong>전화: 010 - 1234 - 5678</strong><br><br>
  </fieldset>
</body>
</html>
