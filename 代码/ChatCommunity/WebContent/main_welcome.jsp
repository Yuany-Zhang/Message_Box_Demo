<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<h1 style="text-align:center;">
	欢迎您来到主页
</h1>
<p style="text-align:center;">
	<input type="button"   value ="返回" onclick="window.location.href = 'Welcome.jsp'">
</p>
<hr>
<hr>
<body>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int is_true = 0;
	    String connectionUrl = "jdbc:mysql://localhost:3306/chatcommunity";
        String user = "system";
		String pass = "zhangyuanyi";
		try{
		    Class.forName("com.mysql.jdbc.Driver").newInstance();
		    conn = DriverManager.getConnection(connectionUrl,user,pass);
		    String sql = "select * from chat";
		    pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    rs = pstmt.executeQuery();	
		    	%>
		    	<br>
		    	<table align ="center" border="1">
		    	<tr>
		    		<th>
		    			<%out.print("序号"); %>
		    		</th>
		    		<th>
		    			<%out.print("用户名"); %>
		    		</th>
		    		
		    		<th>
		    			<%out.print("话题"); %>
		    		</th>
		    		<th>
		    			<%out.print("添加时间"); %>
		    		</th>
		    	</tr>
		    	
		    	<%int count = 1;
		    		while(rs.next()){
		    		is_true = 1;
		  		%>

		  		<tr>
		  			<td>
		  				<%out.print(count++); %>
		  			</td>
		  			<td>
		  				<%out.print(rs.getString(2)); %>
		  			</td>
		  			<td>
		  				<%out.print(rs.getString(3)); %>
		  			</td>
		  			<td>
		  				<%out.print(rs.getString(4)); %>
		  			</td>
		  		</tr>
		  		<%
		    	}
		    		%>
		    		 
		    	</table>
		    	<table align ="center">
		    	<tr>
		    		<td>
		    	<%
		    	if(is_true == 0)
			    	out.println("当前没有人提出话题");
		    	%>
		    		</td>
		    	</tr>
		    	</table>
		    	<%
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