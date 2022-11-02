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

           
            if(request.getParameter("good_name")!=null){
            sql ="UPDATE `ingood` SET `good_name`='"+request.getParameter("good_name")+"' WHERE `good_name`='"+session.getAttribute("good_name")+"'";			
	        con.createStatement().execute(sql);	
			sql ="UPDATE `ingood` SET `good_price`='"+request.getParameter("good_price")+"' WHERE `good_name`='"+session.getAttribute("good_name")+"'";			
	        con.createStatement().execute(sql);
			sql ="UPDATE `ingood` SET `good_stock`='"+request.getParameter("good_stock")+"' WHERE `good_name`='"+session.getAttribute("good_name")+"'";			
	        con.createStatement().execute(sql);
			sql ="UPDATE `ingood` SET `good_food`='"+request.getParameter("good_food")+"' WHERE `good_name`='"+session.getAttribute("good_name")+"'";			
	        con.createStatement().execute(sql);
			
			
	        out.print("更新成功!! 請<a href='productone_add.jsp'>按此</a>回商品總覽頁面!!");
	        }
	        else{
	  	
	        out.print("更新失敗!!");
	        }
        

	con.close();//結束資料庫連結
	response.sendRedirect("productone_add.jsp") ;


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
