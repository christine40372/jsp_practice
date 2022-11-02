<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
		   String new_id=request.getParameter("id");
		   String new_pwd=request.getParameter("pwd");
		   String new_member_name=request.getParameter("member-name");
		   String new_member_birth=request.getParameter("member-birth");
		   String new_member_email=request.getParameter("member-email");
		   String new_member_phone=request.getParameter("member-phone");
		   String new_member_address=request.getParameter("member-address");
		   new_member_birth=new_member_birth.replace("/","-");
		   
//Step 4: 執行 SQL 指令	
		   
           sql="INSERT member (`id`, `member-name`, `member-phone`, `member-email`, `member-address`, `pwd`, `member-birth`)";
        sql+="VALUES ('" + new_id + "', ";
        sql+="'"+new_member_name+"', ";
        sql+="'"+new_member_phone+"', ";
        sql+="'"+new_member_email+"', ";   
        sql+="'"+new_member_address+"', ";  
		sql+="'"+new_pwd+"', "; 
		sql+="'"+new_member_birth+"')";   
		

           con.createStatement().execute(sql);
		   
		   session.setAttribute("id",request.getParameter("id"));
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("member.jsp") ;
		   
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


