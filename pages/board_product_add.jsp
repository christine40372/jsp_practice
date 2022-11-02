<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="../assets/Image/logo.ico" type="image/x-icon" />
  <title>新增商品</title>
  <link rel="stylesheet" type="text/css" href="../assets/Css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/Css/slideshow.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

</head>

<body>
  <nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-blue">

    <a class="abs-center-x" href="../index.html"><img class="logo" src="../assets/Image/logo.png"></a>

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
          <a class="nav-link" href="./contact us.html">聯絡我們</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="./member.html">會員專區</a>
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


  <a href="./shoppingcart.html"><img class="shoppingcart" src="../assets/Image/shoppingcart.png"></a>

  <div class="title">新增商品</div>
  <div class="container">
    <div class="row">
      <div class="col-sm-6" style="margin:25px auto;">
        
		<div class="box">
		  <form name="form1" method="get" action="add_productone_add.jsp" >
          <label>商品：<input type="text" name="good_name" class="form-control"></label><br />
          <label>售價：<input type="text" name="good_price" class="form-control"></label><br />
          <label>庫存：<input type="text" name="good_stock" class="form-control"></label><br />
          <label>材料：<input type="text" name="good_food" class="form-control"></label><br />
          <div class="text-right">
            <button class="btn btn-info">新增商品</button>
          </div>
          </form>
	      <form name="form2" method="get" action="add_product.jsp">
           <input type="hidden" name="GBNo" value="6"><br>
           <input type="hidden" name="ahref" value="./productone_add.jsp"><br>
	       <input type="hidden" name="aclass" value="text-decoration-none"><br>
	       <input type="hidden" name="divclass1" value="card text-dark bg-light mb-3 rounded border"><br>
	       <input type="hidden" name="divstyle" value="max-width: 18rem;"><br>
	       <input type="hidden" name="imgsrc" value="../assets/Image/daifuku6.jpg"><br>
	       <input type="hidden" name="imgclass" value="card-img-top"><br>
	       <input type="hidden" name="divclass2" value="card-body"><br>
	       <input type="hidden" name="h5class" value="card-title"><br>
	       <input type="hidden" name="h5" value="1"><br>
	       <input type="hidden" name="pclass" value="card-text"><br>
	       <input type="hidden" name="p" value="材料: 1"><br>
	       <div class="text-right">
            <button class="btn btn-info">確定送出</button>
           </div>
          </form>
	    </div>
	</div>
	  

    </div>

  </div>




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
  <p>瀏覽人次:  人</p>
  <p>Copyright© 2021 wagashi和菓子專賣 版權所有</p>
</footer>

</html>



