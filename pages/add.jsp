<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/final/assets/js/star.js"></script>
<html>
<head>
<title>add</title>
</head>
<body>
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
		   if(session.getAttribute("id")!=null){
			   sql="SELECT * from `member` where id='"+session.getAttribute("id")+"'";
		   con.createStatement().execute(sql);
		   
		   request.setCharacterEncoding("UTF-8");  
           String new_name=request.getParameter("name");  
		   String new_content=request.getParameter("content");
		   String new_star=request.getParameter("var1");
		  
		   java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT `guestbook`  (`GBName`,  `Content`, `Putdate`,`star`,`id`) ";
           sql+="VALUES ('" + new_name + "', ";
           sql+="'"+new_content+"', ";   
           sql+="'"+new_date+"',";
		   sql+="'"+new_star+"',";  		   
		   sql+="'"+session.getAttribute("id")+"')"; 
           con.createStatement().execute(sql);
		   
		   session.setAttribute("name",new_name);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("dango111.jsp?page=1");
		   }
		   else{
			   con.close();
			   out.println("請先登入再留言");
			   out.println("</br>");
		       out.println("<a href='login.html'>按此進行登入</a>");
		   }
		   
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
</body>
</html>
