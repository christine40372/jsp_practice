<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","Hank27351382");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
            sql="USE `demo`";
            con.createStatement().execute(sql);
			
		    sql="SELECT * from `ingood` where good_name='"+session.getAttribute("good_name")+"'";
			ResultSet rs =con.createStatement().executeQuery(sql);
			String good_name="", good_price="",good_stock="",good_food="";
			while(rs.next()){
				good_name=rs.getString("good_name");
				good_price=rs.getString("good_price");
				good_stock=rs.getString("good_stock");
				good_food=rs.getString("good_food");
			}
			
    con.close();//結束資料庫連結          
%>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="../assets/Image/logo.ico" type="image/x-icon" />
  <title>修改商品</title>
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

  <div class="title">修改商品</div>
  <div class="container">
    <div class="row">
      <div class="col-sm-6" style="margin:25px auto;">
        
		<div class="box">
		 <form name="form1" method="get" action="update_productone.jsp" >
          <label>商品：<input type="text" name="good_name" class="form-control" value="<%=good_name%>"></label><br />
          <label>售價：<input type="text" name="good_price" class="form-control" value="<%=good_price%>"></label><br />
          <label>庫存：<input type="text" name="good_stock" class="form-control" value="<%=good_stock%>"></label><br />
          <label>材料：<input type="text" name="good_food" class="form-control" value="<%=good_food%>"></label><br />
          <div class="text-right">
            <button class="btn btn-info">修改商品</button>
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

<%}
    }
    catch (SQLException sExec) {
           
    }
}
catch (ClassNotFoundException err) {
   
}
%>
