<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("id") !=null  && request.getParameter("pwd") != null ){
	
	String myid=request.getParameter("id");
    sql = "SELECT * FROM `member` WHERE `id`='" +request.getParameter("id") + 
	      "'  AND `pwd`='" + request.getParameter("pwd") + "'"  ; 
    ResultSet rs =con.createStatement().executeQuery(sql);

    if(myid.equals("test")){
		session.setAttribute("id",request.getParameter("id"));
		con.close();//結束資料庫連結
		response.sendRedirect("back.jsp") ;
}		
    else if(rs.next()){
		session.setAttribute("id",request.getParameter("id"));
		con.close();//結束資料庫連結
		response.sendRedirect("/final/index.jsp") ;    
	}
	else{
		con.close();//結束資料庫連結
		out.println("密碼帳號不符 !! <a href='login.html'>按此</a>重新登入") ;
	}
	
}


%>



