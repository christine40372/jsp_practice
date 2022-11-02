<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>DELETE</title>
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
           sql="use demo";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8"); 

           
            if(request.getParameter("GBNo")!=null){
            sql = "DELETE FROM `product` WHERE `GBNo` ='6'";
	        con.createStatement().execute(sql);	
	        out.print("刪除成功!! 請<a href='daifuku.jsp'>按此</a>回商品總覽頁面!!");
	        }
	        else{
	  	
	        out.print("刪除失敗!! 請填寫完整，<a href='daifuku.jsp'>按此</a>回商品總覽頁面!!");
	        }
        

	con.close();//結束資料庫連結
	response.sendRedirect("daifuku.jsp") ;


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
