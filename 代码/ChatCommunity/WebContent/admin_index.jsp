<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*,com.mysql.jdbc.Driver"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员账号确认</title>
</head>
<body>
	<%
		String accountName=request.getParameter("name");
		String accountPassword = request.getParameter("password"); 
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	    String connectionUrl = "jdbc:mysql://localhost:3306/chatcommunity";
        String user = "system";
		String pass = "zhangyuanyi";
		try{
		    Class.forName("com.mysql.jdbc.Driver").newInstance();
		    conn = DriverManager.getConnection(connectionUrl,user,pass);
		    String sql = "select * from admin where adminid=? and adminpasswd=?";
		    pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    pstmt.setString(1,accountName);
		    pstmt.setString(2,accountPassword);
		    rs = pstmt.executeQuery();		 
		    if(rs.next()){ 
		    	rs.close();
	    		pstmt.close();
	    		conn.close();
	    		request.setAttribute("str", accountName);
	    		session.setAttribute("accName",accountName);
		     %> 
		    <h1 style="text-align:center;">管理员账号 <% out.println(accountName); %> 登录成功，三秒后自动跳转到管理员主界面</h1>
			<h5 style="text-align:center;">
			<input type="button" value="点击这里直接跳转" onclick="window.location.href = 'admin.jsp'"> </h5>
			<%
  			response.setHeader("Refresh","3;url=admin.jsp"); 
		    }else{
		    		rs.close();
		    		pstmt.close();
		    		conn.close();
		    		response.sendRedirect("loginFail.jsp");
		    }
		   }catch(SQLException e){
		    e.printStackTrace();
		   }finally{
		     if(rs != null){
		      try{
		       rs.close();
		      }catch(SQLException sqlEx){}
		      rs = null;
		     }
		     if(pstmt != null){
		      try{
		       pstmt.close();
		      }catch(SQLException sqlEx){}
		      pstmt = null;
		     }
		     if(conn != null){
		      try{
		       conn.close();
		      }catch(SQLException sqlEx){}
		      conn = null;
		     }
		   }
	%>
</body>
</html>