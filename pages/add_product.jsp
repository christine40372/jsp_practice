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
           String new_GBNo=request.getParameter("GBNo");		   
           String new_ahref=request.getParameter("ahref");
		   String new_aclass=request.getParameter("aclass");
		   String new_divclass1=request.getParameter("divclass1");
		   String new_divstyle=request.getParameter("divstyle");
		   String new_imgsrc=request.getParameter("imgsrc");
		   String new_imgclass=request.getParameter("imgclass");
		   String new_divclass2=request.getParameter("divclass2");
		   String new_h5class=request.getParameter("h5class");
		   String new_h5=request.getParameter("h5");
		   String new_pclass=request.getParameter("pclass");
		   String new_p=request.getParameter("p");
		   
		   new_p=new_p.replace("\n","<br>");
		   
		   //舊版MySQL從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
		   //String new_GBNo=new String(request.getParameter("GBNo").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_ahref=new String(request.getParameter("ahref").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_aclass=new String(request.getParameter("aclass").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_divclass1=new String(request.getParameter("divclass1").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_divstyle=new String(request.getParameter("divstyle").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_imgsrc=new String(request.getParameter("imgsrc").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_imgclass=new String(request.getParameter("imgclass").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_divclass2=new String(request.getParameter("divclass2").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_h5class=new String(request.getParameter("h5class").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_h5=new String(request.getParameter("h5").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_pclass=new String(request.getParameter("pclass").getBytes("ISO-8859-1"),"UTF-8");
		   //String new_p=new String(request.getParameter("p").getBytes("ISO-8859-1"),"UTF-8");
           
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT `product` (`GBNo`,`ahref`,  `aclass`, `divclass1`, `divstyle`,  `imgsrc`,  `imgclass`,  `divclass2`,  `h5class`,  `h5`,  `pclass`,  `p`) ";
           sql+="VALUES ('" + new_GBNo + "', ";
		   sql+="'"+new_ahref+"', ";
		   sql+="'"+new_aclass+"', ";
           sql+="'"+new_divclass1+"', "; 
		   sql+="'"+new_divstyle+"', ";
		   sql+="'"+new_imgsrc+"', ";
           sql+="'"+new_imgclass+"', "; 
		   sql+="'"+new_divclass2+"', ";
           sql+="'"+new_h5class+"', "; 
		   sql+="'"+new_h5+"', ";
		   sql+="'"+new_pclass+"', "; 
		   sql+="'"+new_p+"') ";

		   
           con.createStatement().execute(sql);
		   
		   session.setAttribute("ahref",new_ahref);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("daifuku.jsp?page=1");
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
