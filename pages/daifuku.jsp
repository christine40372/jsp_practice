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
            sql="SELECT * FROM `product`"; 
           ResultSet r=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           //ResultSet.TYPE_SCROLL_INSENSITIVE表紀錄指標可前後移動，ResultSet.CONCUR_READ_ONLY表唯讀
           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
          
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="../assets/Image/logo.ico" type="image/x-icon" />
  <title>大福</title>
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
          <a class="nav-link active" href="./about.jsp">關於我們</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./product.jsp">產品介紹</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./qa.jsp">Q&A</a>
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

  <div class="title">大福</div>
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
          <a href="./daifuku.jsp" class="list-group-item list-group-item-action bg-warning">大福</a>
          <a href="./other.html" class="list-group-item list-group-item-action list-group-item-warning">其他</a>
        </div>
      </div>
      <div class="col-sm-10">
        <div class="card-group">
          <%
						    
							
								while(r.next()){
									
								out.println("<a href='"+r.getString(2)+"' ");
                                out.println("class ='"+r.getString(3)+ "'>");
                                out.println("<div class='"+r.getString(4)+"' ");
                                out.println("style='"+r.getString(5)+ "'>");
                                out.println("<img src ='"+r.getString(6)+"' ");
                                out.println("class ='"+r.getString(7)+ "'>");
                                out.println("<div class='"+r.getString(8)+ "'>");
                                out.println("<h5 class='"+r.getString(9)+ "'>"+r.getString(10)+"</h5>");
                               
                                out.println("<p class='"+r.getString(11)+ "'>"+r.getString(12)+ "</p></div></div></a>");
                                
							    }
							%>
		  		  
		  <!--

          <a href="./daifuku2.html" class="text-decoration-none">
            <div class="card text-dark bg-light mb-3 rounded border" style="max-width: 18rem;">
              <img src="../assets/Image/daifuku2.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">核桃大福</h5>
                <p class="card-text ">材料: 糯米、糖、紅豆、核桃</p>
              </div>
            </div>
          </a> <a href="./daifuku3.html" class="text-decoration-none">
            <div class="card text-dark bg-light mb-3 rounded border" style="max-width: 18rem;">
              <img src="../assets/Image/daifuku3.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">草莓大福</h5>
                <p class="card-text ">材料: 糯米、糖、紅豆、草莓</p>
              </div>
            </div>
          </a>
          <a href="./daifuku4.html" class="text-decoration-none">
            <div class="card text-dark bg-light mb-3 rounded border" style="max-width: 18rem;">
              <img src="../assets/Image/daifuku4.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">栗子大福</h5>
                <p class="card-text ">材料: 糯米、糖、紅豆、栗子</p>
              </div>
            </div>
          </a>

          <a href="./daifuku5.html" class="text-decoration-none">
            <div class="card text-dark bg-light mb-3 rounded border" style="max-width: 18rem;">
              <img src="../assets/Image/daifuku5.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">抹茶大福</h5>
                <p class="card-text ">材料: 糯米、糖、紅豆、抹茶</p>
              </div>
            </div>
          </a>
-->	  
		  
		  
		  
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
  <p>瀏覽人次:10人</p>
  <p>Copyright© 2021 wagashi和菓子專賣 版權所有</p>
</footer>

</html>
<%
//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>
%>