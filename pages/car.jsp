<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%
//讀取已存在Client端的Cookie
try{
        Cookie cookies[] = request.getCookies();
        int count = cookies.length;
        String p_name = "",p_price = "",p_num = "";
		double Iprice=0;
		double Inum=0;
		double sum=0;
        for(int i=0;i<count;i++){
			if(cookies[i].getName().equals("p_name"))
               //name = java.net.URLDecoder.decode(cookies[i].getValue());Cookie中文解碼
			   p_name = cookies[i].getValue();
            if(cookies[i].getName().equals("p_price"))
                p_price =cookies[i].getValue();				
            if(cookies[i].getName().equals("p_num"))
                p_num = cookies[i].getValue();				
		}
		 
		Iprice=Double.parseDouble(p_price);
		Inum=Double.parseDouble(p_num);
		sum=Iprice*Inum;
		session.setAttribute("id",session.getAttribute("id"));

%>
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
          <img class="img-thumbnail shopping_img" src="../assets/Image/dango1.jpg">
        </div>
        <div class="col-sm-6" style="margin:45px auto;">
          <div class="shopping_box">
            <form class="form-inline">
              <div class="form-group">
                <div class="content">
                  <h5><%=p_name%></h5>
                  <h5>售價：$<%=p_price%>/串</h5>
                  <h5>購買數量：<%=p_num%></h5>
                  <h5>單項商品總價：$<%=sum%></h5>
                  <div class="input-group">
                    <button type="button" onclick="minus()" class="btn btn-info">-</button>
                    <input type="text" class="form-control" style="width: 50px; text-align: center;"
                      id="exampleInputAmount" value=<%=p_num%>>
                    <button type="button" onclick="add()" class="btn btn-info">+</button>　
			</form>
                    <a href='removecar.jsp'><input type="button" class="btn btn-info" value="從購物車中刪除"></a>
                  </div>
                </div>
              </div>
            
          </div>
        </div>
      </div><!--這裡-->
      <hr />
      
    </div>

    <div class="text-center">
      <a href="../pages/delivery.jsp"> <input type="send" value="送出訂單" class="btn btn-info"></a>
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
<%
}
catch (Exception e) {
           out.println("尚未登入，請先登入！");
		   out.println("</br>");
		   out.println("<a href='/final/pages/login.html'>按此進行登入</a>");
		   out.println("</br>");
		   out.println("<a href='/final/index.jsp'>按此回到首頁</a>");
		   
    }



%>   