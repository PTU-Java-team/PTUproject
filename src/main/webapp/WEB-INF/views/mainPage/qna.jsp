<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 22.
  Time: 오전 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous"/>
  <title>자주 묻는 질문</title>

  <style>
    @import url('https://fonts.googleapis.com/css?family=Muli&display=swap');

    * {
      box-sizing: border-box;
    }

    body {
      font-family: 'Muli', sans-serif;
      background-color: #f0f0f0;
    }

    h1 {
      margin: 50px 0 30px;
      text-align: center;
    }

    .faq-container {
      max-width: 600px;
      margin: 0 auto;
    }

    .faq {
      background-color: transparent;
      border: 1px solid #9fa4a8;
      border-radius: 10px;
      margin: 20px 0;
      padding: 30px;
      position: relative;
      overflow: hidden;
      transition: 0.3s ease;
    }

    .faq.active {
      background-color: #fff;
      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
    }

    .faq.active::before,
    .faq.active::after {
      content: '\f075';
      font-family: 'Font Awesome 5 Free';
      color: #2ecc71;
      font-size: 7rem;
      position: absolute;
      opacity: 0.2;
      top: 20px;
      left: 20px;
      z-index: 0;
    }

    .faq.active::before {
      color: #3498db;
      top: -10px;
      left: -30px;
      transform: rotateY(180deg);
    }

    .faq-title {
      margin: 0 35px 0 0;
    }

    .faq-text {
      display: none;
      margin: 30px 0 0;
    }

    .faq.active .faq-text {
      display: block;
    }

    .faq-toggle {
      background-color: transparent;
      border: 0;
      border-radius: 50%;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 16px;
      padding: 0;
      position: absolute;
      top: 30px;
      right: 30px;
      height: 30px;
      width: 30px;
    }

    .faq-toggle:focus {
      outline: 0;
    }

    .faq-toggle .fa-times {
      display: none;
    }

    .faq.active .faq-toggle .fa-times {
      color: #fff;
      display: block;
    }

    .faq.active .faq-toggle .fa-chevron-down {
      display: none;
    }

    .faq.active .faq-toggle {
      background-color: #9fa4a8;
    }

    .button-container {
      text-align: center;
      margin: 40px 0;
    }

    .button {
      background-color: #4CAF50;
      color: white;
      padding: 15px 30px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      border-radius: 5px;
      margin: 0 10px;
      transition: background-color 0.3s;
    }

    .button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<h1>자주 묻는 질문</h1>
<div class="faq-container">
  <div class="faq">
    <h3 class="faq-title">티켓 결제한 다음에는 환불이 안되나요?</h3>
    <p class="faq-text">행사일로부터 7일 전까지 환불이 100% 환불이 가능합니다. <br>6일전부터 행사일까지는 50% 환불이 가능하고 행사 당일에는 환불이 불가능 한 점을 양해바랍니다.</p>
    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">학생도 참여할 수 있는 행사가 있나요?</h3>
    <p class="faq-text">
      네 고객님, 저희가 홍보하고 있는 많은 행사들이 학생도 참여할 수 있는 행사들로 구성되어있습니다.<br> 또한 학생들을 위한 행사들도 어느정도 마련이 되어있습니다.<br> 부담없이 즐기셔도 됩니다.
    </p>
    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">탈퇴하고 싶어요</h3>
    <p class="faq-text">
      탈퇴에 관해서는 <br>아래의 연락처로 문의 주시기를 바랍니다.<br><strong>이메일: abc@ptu.ac.kr<br> 전화: 010 - 1234 - 5678</strong>
    </p>
    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">개인 행사는 어떻게 등록되는 건가요</h3>
    <p class="faq-text">개인 행사는 기본적으로 행사를 주최하는 사람이 행사 홍보에 관한 글을 올립니다.<br> 만약 홍보글에 목적과 맞지 않은 내용이 있을 경우 관리자에 의해 삭제를 할 수 있습니다.</p>
    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">주말에도 하나요?</h3>
    <p class="faq-text">네, 저희는 24시간 운영하고 있습니다. 환불, 문의, 등록 등 언제든지 가능합니다.</p>
    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">회원가입은 누구나 할 수 있나요?</h3>
    <p class="faq-text">연령 상관 없이 누구나 가입 후 이용할 수 있습니다.</p>
    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">개인 행사가 취소될 경우 어떻게 하나요?</h3>
    <p class="faq-text">저희는 입장권 결제 시 바로 돈이 행사 주최자에게 입금되는 방식이 아닌<br>행사가 안전하게 끝났을 경우 저희가 주최측에 전달하는 방식입니다.<br>그러므로 만약 천재지변에 의해 행사가 취소되었을 경우 전액 환불해 드립니다.</p>
    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">행사 홍보할 때 다른 걸 팔아도 되나요?</h3>
    <p class="faq-text">저희 홈페이지는 기타 다른 호객 행위를 일체 금지하고 있습니다.<br> 행사에 참여하거나 우승했을 때 주는 경품이나 상금 등과 같은 것을 제외하고는 내용을 소개하실 수 없습니다.</p>
    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
</div>

<div class="button-container">
  <a href="/b_list" class="button">문의글 보러가기</a>
  <a href="/b_save" class="button">문의글 작성하기</a>
</div>

<script>
  const toggles = document.querySelectorAll(".faq-toggle");

  toggles.forEach((toggle) => {
    toggle.addEventListener("click", () => {
      toggle.parentNode.classList.toggle("active");
    });
  });
</script>
</body>
</html>
