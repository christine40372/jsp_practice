<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
if(session.getAttribute("id") != null ){
    if(request.getParameter("id")!=null){
    sql = "UPDATE `member` SET `id`='"+request.getParameter("id")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);
	sql = "UPDATE `member` SET `member-name`='"+request.getParameter("member-name")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member-phone`='"+request.getParameter("member-phone")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member-email`='"+request.getParameter("member-email")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member-address`='"+request.getParameter("member-address")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
    sql = "UPDATE `member` SET `pwd`='"+request.getParameter("pwd")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member-birth`='"+request.getParameter("member-birth")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);	
	
	con.close();//結束資料庫連結
	out.print("更新成功!! 請<a href='member.jsp'>按此</a>回會員頁面!!");
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("更新失敗!! 請填寫完整，<a href='member.jsp'>按此</a>回會員頁面!!");
	}
}
else{
	con.close();//結束資料庫連結
	response.sendRedirect("sign_up.html") ;

}
%>
