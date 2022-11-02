<%@ page import = "java.sql.*, java.util.*"%>
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
			
		

%>
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

  <div class="title"></div>
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-2">
        <div class="list-group">
          <a href="./product.html" class="list-group-item list-group-item-action list-group-item-warning">
            所有商品
          </a>
          <a href="./top3.html" class="list-group-item list-group-item-action list-group-item-warning">人氣商品
            TOP3</a>
          <a href="./85off.html" class="list-group-item list-group-item-action list-group-item-warning">限時85折</a>
          <a href="./dango.html" class="list-group-item list-group-item-action list-group-item-warning">糰子</a>
          <a href="./yokan.html" class="list-group-item list-group-item-action list-group-item-warning">羊羹</a>
          <a href="./daifuku.jsp" class="list-group-item list-group-item-action list-group-item-warning">大福</a>
          <a href="./other.html" class="list-group-item list-group-item-action list-group-item-warning">其他</a>
        </div>
      </div>
      <div class="col-sm-5">
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
              <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
                <img class="img-thumbnail" src="../assets/Image/dango1.jpg" style="width: 100%;">
              </div>
            </div>
          </div>
        </div>
        <a data-toggle="modal" data-target="#exampleModal"><img class="img-thumbnail product_img"
            src="../assets/Image/daifuku6.jpg"></a>
      </div>
      <div class="col-sm-5">
        <div class="product_box">
		<%if(rs.next())%>
          <h5><%=rs.getString(1)%></h5><br />
          <h5>售價：$<%=rs.getString(2)%>/串</h5><br />
          <h5>庫存量：<%=rs.getString(3)%></h5><br />
          <form class="form-inline">
            <div class="form-group">
              <div class="input-group">
                <h5>購買數量：</h5>
                <button type="button" onclick="minus()" class="btn btn-info">-</button>
                <input type="text" class="form-control" style="width: 50px; text-align: center;"
                  id="exampleInputAmount">
                <button type="button" onclick="add()" class="btn btn-info">+</button>　　
                <input type="submit" class="btn btn-info" value="加入購物車">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="container" style="margin-top: 45px;">
    <div class="row">
      <div class="col-sm-12">
        <div class="introduction">
          商品介紹
          <div class="text">
            材料: <%=rs.getString(4)%><br><br>
            <br><br>
            保存期限: 冷凍可保存1星期。
            <br />
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container" style="margin-top: 50px;">
    <div class="row">
      <div class="col-sm-12">
        <div class="introduction comment">
          商品評論
          <div class="text">
            <form name="form2" action="add.jsp" method="POST">
              姓名 <input type="text" name="name">
              <div id="stars" class="star">評價星等
                <img src="../assets/Image/empty.png" alt="">
                <img src="../assets/Image/empty.png" alt="">
                <img src="../assets/Image/empty.png" alt="">
                <img src="../assets/Image/empty.png" alt="">
                <img src="../assets/Image/empty.png" alt="">
              </div>
			  
              <textarea rows="4" cols="50"  name="content" placeholder="新增商品評論..."></textarea>
              <input type="submit" class="btn btn-info">
            </form>
            <hr />
            
            <p>王曉明</p>
            <div class="star">評價星等
              <img src="../assets/Image/shining.png" alt="">
              <img src="../assets/Image/shining.png" alt="">
              <img src="../assets/Image/shining.png" alt="">
              <img src="../assets/Image/shining.png" alt="">
              <img src="../assets/Image/shining.png" alt="">
            </div>
            評論：好吃
            <hr />
   
          
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="../assets/Js/number.js"></script>
  <script src="../assets/Js/star.js"></script>
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
		  String new_good_name=rs.getString(1);
		  session.setAttribute("good_namename",new_good_name);
		}
//Step 6: 關閉連線
		  
          con.close();      
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>