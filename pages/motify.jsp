<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<%
		   if(session.getAttribute("id") != null ){
    sql = "SELECT * FROM `member` WHERE `id`='" +session.getAttribute("id")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String id="", pwd="",name="",phone="",birth="",address="",email="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
	    id=rs.getString("id");
		pwd=rs.getString("pwd");
		name=rs.getString("member-name");
		phone=rs.getString("member-phone");
		birth=rs.getString("member-birth");
		address=rs.getString("member-address");
		email=rs.getString("member-email");
	}
    con.close();//結束資料庫連結
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="../assets/Image/logo.ico" type="image/x-icon" />
  <title>修改資料</title>
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

  <div class="title">修改資料</div>
  <div class="container">
    <div class="row">
      <div class="col-sm-6" style="margin:25px auto;">
	  <form action="update.jsp" method="POST">
        <div class="box">
          <label>姓名：</label><input name="member-name" value="<%=name%>" class="form-control" ><br />
          <label>帳號：</label><input name="id" value="<%=id%>"class="form-control" ><br />
          <label>密碼：</label><input name="pwd" value="<%=pwd%>" class="form-control" ><br />
          <label>生日：</label><input name="member-birth" value="<%=birth%>" class="form-control" ><br />
          <label>電子郵件：</label><input name="member-email" value="<%=email%>" class="form-control" ><br />
          <label>連絡電話：</label><input name="member-phone" value="<%=phone%>" class="form-control" ><br />
          <label>地址：</label><input name="member-address" value="<%=address%>" class="form-control" ><br /><br />
          <div class="text-center">
            <a href="update.jsp"><button class="btn btn-info">確認修改</button></a>
          </div>
        </div>
        <br /><br />
        <br /><br />
	  </form>
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
  <p>瀏覽人次:10人</p>
  <p>Copyright© 2021 wagashi和菓子專賣 版權所有</p>
</footer>

</html>
<%
}
else{
	con.close();//結束資料庫連結
	response.sendRedirect("sign up.html") ;
}
%>
