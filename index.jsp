<%@ page contentType="text/html" %>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%> 
<%@ page import = "java.sql.*" %> 
<%  
		ArrayList cat=new ArrayList();
//Step 1: 載入資料庫驅動程式 
            Class.forName("com.mysql.jdbc.Driver");	  
            
//Step 2: 建立連線 
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","Hank27351382");   
				String sql = "" ;
		try {
//Step 4: 執行 SQL 指令 
                    
                    ResultSet tmp =  con.createStatement().executeQuery(sql);
					session.setAttribute("id",session.getAttribute("id"));
//Step 5: 顯示結果                    
                    while(tmp.next()){			
		    //一筆一筆讀取資料，如果回傳false,表示資料讀取完畢。
		    //用回圈印出結果，getString(1)表示id,getString(2)表示name,依此類推
                        cat.add(tmp.getString(1));
						
		    }				
                    
                }  
            catch (SQLException sExec) {
                    out.println("SQL錯誤"+sExec.toString());
                }
            
        
       %>
<jsp lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="icon" href="assets/Image/logo.ico" type="image/x-icon" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Wagashi</title>
  <link rel="stylesheet" type="text/css" href="assets/Css/style.css">
  <link rel="stylesheet" type="text/css" href="assets/Css/slideshow.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

</head>

<body>

  <nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-blue">

    <a class="abs-center-x" href="./index.jsp"><img class="logo" src="./assets/Image/logo.png"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar8">
      <span class="navbar-toggler-icon"></span>
    </button>
    <span class="navbar-text">&nbsp;</span>
    <div class="navbar-collapse collapse" id="navbar8">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="./pages/about.html">關於我們</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./pages/product.html">產品介紹</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./pages/qa.html">Q&A</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./pages/contact us.jsp">聯絡我們</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="./pages/member.jsp">會員專區</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./pages/login.html">登入</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./pages/sign up.html">註冊</a>
        </li>
      </ul>
    </div>
  </nav>

  <a href="./pages/car.jsp"><img class="shoppingcart" src="assets/Image/shoppingcart.png"></a>


  <div class="slideshow-container">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="assets/Image/ad.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="assets/Image/ad2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="assets/Image/ad3.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="assets/Image/ad4.jpg" class="d-block w-100" alt="...">
        </div>
        < </div> <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
      </div>
    </div>
    <div class="container" style="margin-top: 45px;">
      <div class="row">
        <div class="col-sm-12">
          <fieldset class="scheduler-border">
            <legend class="scheduler-border" style="font-size: 40px;">人氣商品</legend>

            <div class="card-group">
              <a href="pages/dango111.jsp" class="text-decoration-none">
                <div class="card text-dark bg-light mb-3 rounded border" style="max-width: 16rem;">
                  <b style="font-size: 30px;color:gold">TOP1</b>
                  <img src="assets/Image/dango1.jpg" class="card-img-top">
                  <div class="card-body">

                    <h5 class="card-title">三色糰子
                    </h5>

                  </div>
                </div>
              </a>
              <a href="pages/daifuku3.html" class="text-decoration-none">
                <div class="card text-dark bg-light mb-3 rounded border" style="max-width: 16rem;">
                  <b style="font-size: 30px;color:rgb(136, 136, 136)">TOP2</b>
                  <img src="assets/Image/daifuku3.jpg" class="card-img-top">
                  <div class="card-body">
                    <h5 class="card-title">草莓大福</h5>

                  </div>
                </div>
              </a>
              <a href="pages/yokan2.html" class="text-decoration-none">
                <div class="card text-dark bg-light mb-3 rounded border" style="max-width: 16rem;">
                  <b style="font-size: 30px;color: goldenrod;">TOP3</b>
                  <img src="assets/Image/youkan2.jpg" class="card-img-top">
                  <div class="card-body">
                    <h5 class="card-title">大倉羊羹</h5>

                  </div>
                </div>
              </a>

            </div>
          </fieldset>
        </div>
      </div>
	  
	  <%
	  for(int i=0;i<cat.size();i++){
		  out.print("<div class='col' style='text-align: center;'><div class='dropdown'><button class='btn btn-secondary dropdown-toggle' type='button' id='dropdownMenuButton' data-toggle='dropdown'  aria-haspopup='true' aria-expanded='false' style='background-color:  #d8e3e7; border-style: none;font-size: 20px;'>");
            out.print(cat.get(i)+"</button><div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>");
			try {

//Step 4: 執行 SQL 指令 
                    sql="SELECT DISTINCT pname FROM shop.product WHERE pcat like '%"+cat.get(i)+"%';";
									
					
                    ResultSet tmp2 =  con.createStatement().executeQuery(sql);
//Step 5: 顯示結果                    
              while(tmp2.next()){			
		    //一筆一筆讀取資料，如果回傳false,表示資料讀取完畢。
		    //用回圈印出結果，getString(1)表示id,getString(2)表示name,依此類推
                        out.print("<a class='dropdown-item' href='../pages/p5good11.jsp?product="+tmp2.getString(1)+"'>"+tmp2.getString(1)+"</a>");
						
		    }				
                }  
            catch (SQLException sExec) {
                    out.println("SQL錯誤"+sExec.toString());
                }
            out.print("</div></div></div>");
			  
			}
		  %>
	  
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
	
	<%
   Random ran=new Random();
   int n=ran.nextInt(3)+1;

   if(n == 1)
       url="http://localhost:8080/final/index.jsp";
   if(n == 2)
       url="http://localhost:8080/final/index.jsp";
   if(n == 3)
       url="http://localhost:8080/final/index.jsp";
   
  
   %>
   <center><a href=<%out.print(url);%>><%out.println("<img src='/final/assets/Image/AD"+n+".GIF'>");%></a></center>
    </div>
	
	
	
</body>
<footer>

<%
Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       /* First visit */
       out.println("Welcome to wagashi!");
       hitsCount = 1;
    }else{
       /* return visit */
       out.println("Welcome back to wagashi!");
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
   %>
  
   </div>
  <marquee>Copyright© 2021 wagashi和菓子專賣 版權所有</marquee>
  <p>瀏覽人次: <%= hitsCount%> 人</p>

  
</footer>

</html>