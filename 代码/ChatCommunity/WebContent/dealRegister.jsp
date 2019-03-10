<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*,com.mysql.jdbc.Driver"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册处理/DealwithRegister</title>
</head>
<body>
	<%
		String accountname = request.getParameter("accountName");
		String accountpasswd = request.getParameter("accountPasswd");
		String accountpasswdcon = request.getParameter("confirmPasswd");
		String invitecode = request.getParameter("inviteCode");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	    String connectionUrl = "jdbc:mysql://localhost:3306/chatcommunity";
        String user = "system";
		String pass = "zhangyuanyi";
		
		
		if(!accountpasswd.equals(accountpasswdcon) || (accountpasswd.length()<6 || accountpasswd.length()>20)){
			%> 
		    <h1 style="text-align:center;">两次输入的密码不匹配或者密码长度不在 6~20 个字符之间。三秒后自动跳转到注册页面</h1>
			<h5 style="text-align:center;">
			<input type="button" value="点击这里直接跳转" onclick="window.location.href = 'Register.jsp'"> </h5>
			<%
  			response.setHeader("Refresh","3;url=Register.jsp"); 
		}
		else
		{
	%>
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    conn = DriverManager.getConnection(connectionUrl,user,pass);
		    String invitecodeconfsql = "select * from invite where invitecode=?";
		    pstmt = conn.prepareStatement(invitecodeconfsql);
		    pstmt.setString(1, invitecode);
		    rs = pstmt.executeQuery();
		    if(!rs.next()){%>
		    	<h3 style="text-align:center;"> 邀请码错误,请联系管理员获取正确的邀请码后在来注册
		    	<br>
		    	<a href="http://m.scnu.edu.cn/"> brookzhyy@m.scnu.edu.cn </a> </h3>
		    	<%
		    	rs.close();
		    	pstmt.close();
		    	conn.close();
		    }
		    else{
		    		rs.close();
		    		pstmt.close();
		    	//	conn.close();
		    		 String sql = "select * from account where username=?";
				    pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				    pstmt.setString(1,accountname);
				    rs = pstmt.executeQuery();		
				    if(rs.next()){
				    	 %> 
						    <h1 style="text-align:center;">账号 <% out.println(accountname); %> 已经存在，三秒后自动跳转到注册界面</h1>
							<h5 style="text-align:center;">
							<input type="button" value="点击这里直接跳转" onclick="window.location.href = 'Register.jsp'"> </h5>
							<%
				  			response.setHeader("Refresh","3;url=Register.jsp"); 
				    }
				    else{
				    	pstmt.close();
				    	String insertsql = "insert into account values(?,?)";
				    	pstmt = conn.prepareStatement(insertsql);
				    	pstmt.setString(1, accountname);
				    	pstmt.setString(2, accountpasswd);
				    	pstmt.executeUpdate();
				    	pstmt.close();
				   	 %> 
					    <h1 style="text-align:center;">账号 <% out.println(accountname); %> 注册成功，三秒后自动跳转到登录界面</h1>
						<h5 style="text-align:center;">
						<input type="button" value="点击这里直接跳转" onclick="window.location.href = 'index.jsp'"> </h5>
						<%
						response.setHeader("Refresh","3;url=index.jsp");
				    }
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
		}
	%>
</body>
</html>