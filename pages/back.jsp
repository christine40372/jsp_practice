<%@ page contentType="text/html" %>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%> 
<%@ page import = "java.sql.*" %> 
<%
		
//讀取已存在Client端的Cookie
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
		
		double delivery=0;
		String new_order_store=(String)session.getAttribute("order-store");
		String new_order_address=(String)session.getAttribute("order-address");
		
		if(new_order_store!=""){
			delivery=60;
		}
		if(new_order_address!=""){
			delivery=100;
		}
		
		double total_sum=0;
		total_sum=sum+delivery;
%>
<%
	try {
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
//Step 3: 選擇資料庫   
           sql="use `demo`";
           con.createStatement().execute(sql);
		   sql="SELECT * FROM `order`"; //算出共幾筆留言
           ResultSet temp=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           //ResultSet.TYPE_SCROLL_INSENSITIVE表紀錄指標可前後移動，ResultSet.CONCUR_READ_ONLY表唯讀
           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           temp.last();
           int total_content=temp.getRow();
		   
		   sql="SELECT * from `order` where `GBNO`='"+total_content+"'";
		   ResultSet rs =con.createStatement().executeQuery(sql);
		   
		   
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="../assets/Image/logo.ico" type="image/x-icon" />
  <title>後台管理</title>
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
  <div class="title">後台管理</div>
  <div class="container">
    <div class="row">
      <div class="col-sm-6" style="margin:-30px 130px auto;">
        <div>
           <a href="./board_product_add.jsp"><button id="displaysign" >新增商品</button></a>
          <a href="./board_productone_fix.jsp"><button id="displaysign2" >修改商品</button></a>
          <a href="./board_product_delete.jsp"><button id="displaysign3">刪除商品</button></a>
        </div>

        <div class="signform" id="signform" style="display: none">
          <div class="signclose">
            <img src="../assets/Image/x.png" width="35px" height="35px" onclick="signclose()">
          </div>

          <p style="font-size: 30px;padding: 30px;">新增商品</p>
          <center>
            <table>
              <tr>
                <td>商品名稱：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入商品" name="name" required><br>
                </td>
              </tr>
              <tr>
                <td>庫存：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入商品名稱" name="price" required><br>
                </td>
              </tr>
              <tr>
                <td>庫存：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入庫存" name="stock" required><br>
                </td>
              </tr>
              <tr>
                <td>材料：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入材料" name="food" required><br>
                </td>
              </tr>
              
            </table>
          </center>
          <div class="text-center">
            <input type="add" value="新增商品" class="btn btn-info">
          </div>
        </div>


        <div class="signform2" id="signform2" style="display: none">
          <div class="signclose">
            <img src="../assets/Image/x.png" width="35px" height="35px" onclick="signclose()">
          </div>

          <p style="font-size: 30px;padding: 30px;">修改商品</p>
          <center>
            <table>
              <tr>
                <td>商品名稱：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入商品" name="name" required><br>
                </td>
              </tr>
              <tr>
                <td>售價：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入商品名稱" name="price" required><br>
                </td>
              </tr>
              <tr>
                <td>庫存：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入庫存" name="stock" required><br>
                </td>
              </tr>
              <tr>
                <td>材料：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入材料" name="food" required><br>
                </td>
              </tr>
            </table>
          </center>
          <div class="text-center">
            <input type="modify" value="修改商品" class="btn btn-info">
          </div>
        </div>

        <div class="signform3" id="signform3" style="display: none">
          <div class="signclose">
            <img src="../assets/Image/x.png" width="35px" height="35px" onclick="signclose()">
          </div>

          <p style="font-size: 30px;padding: 30px;">刪除商品</p>
          <center>
            <table>
              <tr>
                <td>商品名稱：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入商品" name="name" required><br>
                </td>
              </tr>
              <tr>
                <td>售價：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入商品名稱" name="price" required><br>
                </td>
              </tr>
              <tr>
                <td>庫存：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入庫存" name="stock" required><br>
                </td>
              </tr>
              <tr>
                <td>材料：</td>
                <td><input type="text" style="width: 200px;" class="form-control" placeholder="請輸入材料" name="food" required><br>
                </td>
              </tr>

            </table>
          </center>
          <div class="text-center">
            <input type="delete" value="刪除商品" class="btn btn-info">
          </div>
        </div>
      </div>
      <div class="col-sm-7" style="margin:150px 230px auto;">
        <div class="box">
          <center>
            <fieldset>
              <legend><b style="font-size: 30px;">訂單瀏覽</b></legend><br>
			<%if(rs.next())%>
              <table style="font-size: 20px;">
                <tr>
                  <td>訂單編號：<%=rs.getString(8)%></td>

                </tr>
                <tr>
                  <td>產品名稱：<%=p_name%></td>

                </tr>
				<tr>
                  <td>數量：<%=p_num%></td>

                </tr>

                <tr>
                  <td>姓名：<%=rs.getString(2)%></td>

                </tr>
                <tr>
                  <td>地址：<%=rs.getString(4)+rs.getString(5)+rs.getString(6)%></td>

                </tr>
                <tr>
                  <td>電話：<%=rs.getString(3)%></td>

                </tr>
                <tr>
                  <td>總價：<%=total_sum%></td>

                </tr>
              </table>


            </fieldset>
          </center>
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
  <script>
    $(function () {
      $('.change a').click(function () {
        $('.signform', '.signform2', '.signform3').animate({
          height: 'toggle',
          opacity: 'toggle'
        }, 'slow');
      });
    })


    function start() {
      document.getElementById('signform').style.display = ""


    }

    function start2() {

      document.getElementById('signform2').style.display = ""


    }

    function start3() {

      document.getElementById('signform3').style.display = ""


    }

    function signclose() {
      document.getElementById('signform').style.display = "none"
      document.getElementById('signform2').style.display = "none"
      document.getElementById('signform3').style.display = "none"
      document.getElementById('registerform').style.display = "none"
    }

    function loading() {
      document.getElementById('registerloading').style.display = ""
    }
  </script>

</body>
<footer>
  <p>瀏覽人次:10人</p>
  <p>Copyright© 2021 wagashi和菓子專賣 版權所有</p>
</footer>

</html>
<%}
//Step 6: 關閉連線
		  
          con.close();      
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   out.println("您尚未登入");
		   out.println("</br>");
		   out.println("<a href='login.html'>按此進行登入</a>");
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>