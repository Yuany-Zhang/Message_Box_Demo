<%@ page language="java" import="java.util.*,java.io.File,java.sql.*" pageEncoding="utf-8" import ="java.util.*"%>  
<%@page contentType="text/html;charset=utf-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>



<script type="text/javascript">  
	var xmlHttp_del;  
	var name_del;
	
	function createXMLHttpRequest_del(){  
		if(window.ActiveXObject) {  
			xmlHttp_del= new ActiveXObject("Microsoft.XMLHTTP");//创建XMLHttpRequet对象  
		}  
		else if (window.XMLHttpRequest) {  
			xmlHttp_del=new XMLHttpRequest();//创建XMLHttpRequet对象  
		}  
	}  
	function startRequest_del() {  
		createXMLHttpRequest_del();  
		xmlHttp_del.onreadystatechange=handleStateChange_del;  
		xmlHttp_del.open("POST", "admin_del_topic.jsp", true);  
		xmlHttp_del.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
		xmlHttp_del.send("name_del="+name_del);
 	}
	function handleStateChange_del() {  
  		if(xmlHttp_del.readyState==4) {  
  
 			if(xmlHttp_del.status==200) {  
  				if( xmlHttp_del.responseText == 2)  
  					document.getElementById("delidInfo").innerHTML="<font color='red'>删除成功，请手动刷新页面</font>";  
  				else if( xmlHttp_del.responseText == -1)    
  					document.getElementById("delidInfo").innerHTML="<font color='green'>对不起，没有您提供的DB编号</font>"; 
  				else
  						document.getElementById("delidInfo").innerHTML="<font color='green'>未知错误</font>"; 
     		}
  		}  
	} 
	function check_del(){  
		if(name_del==""){  
			document.getElementById("delidInfo").innerHTML="<font color='red'>DB编号不能为空！</font>";  
			return false;  
		}  
		else {  
			 clear_del(); 
			return true;  
		}  
	}  
	function exec_del(){  
		clear_del();  
		name_del=document.getElementById("delid").value; 
		if(check_del()==true){  
				startRequest_del(); 
		} 
	}

	function clear_del(){  
		document.getElementById("delidInfo").innerHTML="";		//获取DB编号
	}  
	out.print("delid")
</script>  


</head>
<body>
<h2  style="text-align:center;">
欢迎管理员<%=session.getAttribute("accName") %>
</h2>
	<div align="right">
	<h5>
		<font color="red">点击用户名退出</font>
		<input type="button"   value =<%=session.getAttribute("accName")%> onclick="window.location.href = 'index.jsp'">
	</h5>
	</div>
<hr>

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
		    			<%out.print("DB编号"); %>
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
		  				<%out.print(rs.getString(1)); %>
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


<hr>
<hr>	


			  <form action="#_del">  
		  <div align="center">  
		  <table border="1" >  
		  
		  <tr>
					<th>
						删除指定DB编号的话题
					</th>
				</tr>
		    	<tr>
		    		<th>
		    			DB编号:<input id="delid" /><div id = "delidInfo"></div> 
		    			<input type="button" value="删除" onclick="exec_del();"/>
		    		</th>
		    	</tr>
		  </table>  
		  </div>  
		</form>  


<hr>

</body>
</html>