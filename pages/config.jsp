<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","Hank27351382");
String sql="use `demo`";
con.createStatement().execute(sql);
%>