<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
	Cookie cookies[] = request.getCookies();
        int count = cookies.length;
        String p_name = "",p_price = "",p_num = "";
		
        for(int i=0;i<count;i++){
			if(cookies[i].getName().equals("p_name"))
               //name = java.net.URLDecoder.decode(cookies[i].getValue());Cookie中文解碼
			   p_name = cookies[i].getValue();
            if(cookies[i].getName().equals("p_price"))
                p_price =cookies[i].getValue();				
            if(cookies[i].getName().equals("p_num"))
                p_num = cookies[i].getValue();				
		}
			
%>

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
		   String myid=(String)session.getAttribute("id");
		   if(myid!=null){
			   request.setCharacterEncoding("UTF-8");  
           String new_order_name=request.getParameter("order-name");  
		   String new_order_phone=request.getParameter("order-phone");		   
		   String new_order_store=request.getParameter("order-store");		   
		   String new_order_pay=request.getParameter("order-pay");
		   Object new_id=session.getAttribute("id");
		   String new_order_delivery=request.getParameter("order-delivery");
		   String new_order_address=request.getParameter("order-address");
		   
		   
		   
		   sql="INSERT `order`  (`order-name`,`order-phone`,  `order-delivery`, `order-store`,`order-address`,`order-pay`,`id`,`order-number`) ";
           sql+="VALUES ('" + new_order_name + "', ";
		   sql+="'"+new_order_phone+"', ";  
           sql+="'"+new_order_delivery+"', ";   
           sql+="'"+new_order_store+"',";
		   sql+="'"+new_order_address+"',"; 
		   sql+="'"+new_order_pay+"',"; 
		   sql+="'"+new_id+"',"; 
		   sql+="'"+p_num+"')";
		  
		    con.createStatement().execute(sql);
			session.setAttribute("order-store",new_order_store);
			session.setAttribute("order-address",new_order_address);
			if(myid.equals("test")){
				con.close();//結束資料庫連結
				response.sendRedirect("back.jsp") ;
			}		
			else{
				con.close();//結束資料庫連結
				response.sendRedirect("/final/index.jsp") ;    
			}
		   }
		   else{
			   con.close();
			   out.print("請先"+"<a href='login.html'>登入</a>"+"再下單");
		   }
		   
		   
//Step 6: 關閉連線
           
//Step 5: 顯示結果 
          //直接顯示最新的資料
			
			
				
			
			

			
			
           
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