<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="../assets/Image/logo.ico" type="image/x-icon" />
  <title>購物車</title>
  <link rel="stylesheet" type="text/css" href="../assets/Css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/Css/slideshow.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

</head>

<body>
  <nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-blue">

    <a class="abs-center-x" href="../index.jsp"><img class="logo" src="../assets/Image/logo.png"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar8">
      <span class="navbar-toggler-icon"></span>
    </button>
    <span class="navbar-text">&nbsp;</span>
    <div class="navbar-collapse collapse" id="navbar8">

      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="./about.html">關於我們</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./product.html">產品介紹</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./qa.html">Q&A</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./contact us.jsp">聯絡我們</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="./member.jsp">會員專區</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./login.html">登入</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./sign up.html">註冊</a>
        </li>
      </ul>
    </div>
  </nav>


  <a href="./car.jsp"><img class="shoppingcart" src="../assets/Image/shoppingcart.png"></a>

  <div class="title">購物車</div>
  <div class="container">
    <div class="box col-sm-10" style="margin:45px auto;">
       <div class="row"><!--這裡-->
        
        <div class="col-sm-6" style="margin:45px auto;">
          
            <h5><% out.print("您還沒有加入喜歡的商品喔QQ");%></h5>
            
          
        </div>
      </div><!--這裡-->
      
      
    </div>

    <div class="text-center">
      <a href="../pages/delivery.html"> <input type="send" value="送出訂單" class="btn btn-info"></a>
    </div>
  </div>

  <script src="../assets/Js/number.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
    integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous">
  </script>
</body>
<footer>
  <p>瀏覽人次:10人</p>
  <p>Copyright© 2021 wagashi和菓子專賣 版權所有</p>
</footer>

</html>
    