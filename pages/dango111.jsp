<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript" src="/final/assets/js/star.js"></script>
<%
	    request.setCharacterEncoding("UTF-8");//從表單傳中文
//取得Form參數
        String strname = request.getParameter("p_name");
        String strprice = request.getParameter("p_price");
        String strnum = request.getParameter("p_num");		
		
//建立Cookie
        Cookie nameCookie = new Cookie("p_name", strname);
        Cookie priceCookie = new Cookie("p_price",strprice);
        Cookie numCookie = new Cookie("p_num",strnum);
//將Cookie寫入client端
        response.addCookie(nameCookie);
        response.addCookie(priceCookie);
        response.addCookie(numCookie);
//導入另一個jsp網頁
		if(strnum!=null){
			response.sendRedirect("car.jsp");
		}
%>

<%try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
		String numsql="";
		
		Connection conn=DriverManager.getConnection(url,"root","Hank27351382");
        Connection con=DriverManager.getConnection(url,"root","Hank27351382");
        if(con.isClosed()||conn.isClosed())
           out.println("連線建立失敗");
        else {
			conn.createStatement().execute("USE `demo`");
			con.createStatement().execute("USE `demo`");
			numsql="SELECT `good_stock` - SUM(`order-number`)  from `order`,`ingood`  where `good_name`='"+"三色糰子"+"'";
			ResultSet temp=conn.createStatement().executeQuery(numsql);
//Step 4:  執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="SELECT * FROM `guestbook`"; //算出共幾筆留言
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           //ResultSet.TYPE_SCROLL_INSENSITIVE表紀錄指標可前後移動，ResultSet.CONCUR_READ_ONLY表唯讀
           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
          
		  //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
           
		   
		   
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
           for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
			   out.print("<a href='dango111.jsp?page="+i+"'></a>&nbsp;"); //&nbsp;html的空白

           
		   
		   
			
           //讀取page變數          
		   
           String page_string=request.getParameter("page");
           if (page_string == null) 
               page_string = "0";   
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
		   
		                 
	       out.print("<p>");
		   
		      
	       //計算開始記錄位置   
		   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM `guestbook` ORDER BY `GBName` DESC LIMIT ";
           sql+=start_record+",5";
           rs=con.createStatement().executeQuery(sql);

%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="../assets/Image/logo.ico" type="image/x-icon" />
  <title>三色糰子</title>
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
          <a href="./daifuku.html" class="list-group-item list-group-item-action list-group-item-warning">大福</a>
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
            src="../assets/Image/dango1.jpg"></a>
      </div>
      <div class="col-sm-5">
        <div class="product_box">
          <h5>三色糰子</h5><br />
		  <%if(temp.next())%>
          <h5>售價：$50/串</h5><br />
          <h5>庫存量：<%=temp.getString(1)%> </h5><br />
          <form class="form-inline" action="dango111.jsp" method="POST">
            <div class="form-group">
              <div class="input-group">
				<input type="hidden" value="三色糰子" name="p_name">
				<input type="hidden" value="50" name="p_price">
                <h5>購買數量：</h5>
                <button type="button" onclick="minus()" class="btn btn-info">-</button>
                <input type="text" class="form-control" name="p_num" style="width: 50px; text-align: center;"
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
            材料: 糯米粉、櫻花花瓣、艾草。<br><br>
            以櫻花花瓣與艾草等植物改變糰子顏色，通常為紅綠白三色組合。通常於花見（觀賞櫻花）的時候食用。
            粉色、白色為好運的顏色，而綠色代表除邪病,有避邪之意。因此吃了花見糰子,也會將好運、健康一起吃下肚。<br><br>
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
            <form action="add.jsp" method="POST"> <!--action內容清空，有問題 資料輸入送到後端資料庫--> 
              姓名 <input type="text" name="name">
              <div id="stars" class="star">評價星等
                <img src="../assets/Image/empty.png" alt="">
                <img src="../assets/Image/empty.png" alt="">
                <img src="../assets/Image/empty.png" alt="">
                <img src="../assets/Image/empty.png" alt="">
                <img src="../assets/Image/empty.png" alt="">
              </div>
			  <!--修改name="commentxt"--> 
              <textarea rows="4" cols="50"  name="content" placeholder="新增商品評論..."></textarea>
              <input type="submit" class="btn btn-info">
            </form>
            <hr />
			<%while(rs.next()){
            out.println("<p>"+rs.getString(1)+"</p>");
            out.println("<div class='star'>評價星等");
            out.println("<img src='../assets/Image/shining.png' alt=''>");
            out.println("<img src='../assets/Image/shining.png' alt=''>");
            out.println("<img src='../assets/Image/shining.png' alt=''>");
            out.println("<img src='../assets/Image/shining.png' alt=''>");  
            out.println("<img src='../assets/Image/shining.png' alt=''>");  
            out.println("</div>");
            out.println("評論："+rs.getString(2)+"</br>");
			out.println("時間："+rs.getString(3));
            out.println("<hr />");
			}
			%>
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
			session.setAttribute("id",session.getAttribute("id"));
		}
//Step 6: 關閉連線
		  
          con.close();
		  conn.close();
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>

