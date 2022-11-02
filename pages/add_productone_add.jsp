<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>

<%
try {
 
    Class.forName("com.mysql.jdbc.Driver");
    try {
 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","Hank27351382");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {		
           sql="use demo";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8"); 	   
           String new_good_name=request.getParameter("good_name");
		   String new_good_price=request.getParameter("good_price");
		   String new_good_stock=request.getParameter("good_stock");
		   String new_good_food=request.getParameter("good_food");


           
		   //舊版MySQL從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
           //String new_good_name=new String(request.getParameter("good_name").getBytes("ISO-8859-1"),"UTF-8");           
           //String new_good_price=new String(request.getParameter("good_price").getBytes("ISO-8859-1"),"UTF-8");
           //String new_good_stock=new String(request.getParameter("good_stock").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_good_food=new String(request.getParameter("good_food").getBytes("ISO-8859-1"),"UTF-8");
		   
//Step 4: 執行 SQL 指令
	
           sql="INSERT ingood (`good_name`,  `good_price`, `good_stock`, `good_food`) ";
           sql+="VALUES ('" + new_good_name + "', ";
		   sql+="'"+new_good_price+"', ";
           sql+="'"+new_good_stock+"', ";   
           sql+="'"+new_good_food+"')";
		   
           con.createStatement().execute(sql);
		   
		   session.setAttribute("good_name",new_good_name);
		   
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("productone_add.jsp");
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
