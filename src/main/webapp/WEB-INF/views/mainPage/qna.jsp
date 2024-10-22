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
  </style>
</head>
<body>
<h1>자주 묻는 질문</h1>
<div class="faq-container">
  <div class="faq">
    <h3 class="faq-title">상품 받아서 보고 난 후에는 환불이 안되나요?</h3>

    <p class="faq-text">네 고객님, 상품의 특성상 상품 내용을 보신 이후에는 환불 진행이 어렵습니다.<br>구매 전에 한번 더 고려해 보신 이후에 구매해주시면 감사하겠습니다.</p>

    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">진행과정이 어떻게 되나요?</h3>

    <p class="faq-text">
      회원가입 및 로그인을 진행하신 이후에<br>사이트에 있는 상품들을 천천히 보시고 마음에 드는 상품을 고르신 이후 결제 하시면<br>
      결제하신 금액은 우선 저희가 받고 구매하신 고객님께 상품을 전달합니다.<br>이 후 과정이 정상적으로 진행되었다면 금액을 저희가 판매자에게 전달합니다.<br><br>
      저희는 이 과정으로 거래간 사기를 막습니다.
    </p>

    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">결제를 해지하고 싶어요</h3>

    <p class="faq-text">
      결제 해지 및 탈퇴에 관해서는 <br>아래의 연락처로 문의 주시기를 바랍니다.<br><strong>이메일: abc@ptu.ac.kr<br> 전화: 010 - 1234 - 5678</strong>
    </p>

    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">상품은 언제 받을 수 있을까요?</h3>

    <p class="faq-text">상품을 구매한 일로부터 평균 1~2일 정도 소요되고 있습니다.</p>

    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
  <div class="faq">
    <h3 class="faq-title">주말에도 하나요?</h3>

    <p class="faq-text">네, 저희는 24시간 운영하고 있습니다.</p>

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
    <h3 class="faq-title">제품 구매 후 기존의 체계는 어떻게 하나요?</h3>

    <p class="faq-text">상품을 구매할 때 판매자와 협의 후 구매하시는 것을 권합니다.<br>여러가지의 방법이 있으며 모두 선택사항입니다.</p>

    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>

  <div class="faq">
    <h3 class="faq-title">판매 할 때 다른 걸 팔아도 되나요?</h3>

    <p class="faq-text">저희 홈페이지는 홈페이지 및 카페 등과 같은 제품을 제외하고 판매를 일체 금하고 있습니다. 만약 이 이외의 상품을 게시하여 판매할 경우 게시글이 삭제될 수 있으며 또한 계정을 정지할 수도 있습니다.</p>

    <button class="faq-toggle">
      <i class="fas fa-chevron-down"></i>
      <i class="fas fa-times"></i>
    </button>
  </div>
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
