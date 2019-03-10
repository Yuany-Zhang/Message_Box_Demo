<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎/Welcome</title>

<script type="text/javascript">  
	var xmlHttp;  
	var name;  
	var password;
	var myDate = new Date();
	var hour = myDate.getHours();
	if(hour == 0 )
		hour = 24;
	var addtime = (myDate.getFullYear()).toString()+"-" +(myDate.getMonth()+1).toString()+"-" + myDate.getDate().toString()+" " + hour.toString()+":" + myDate.getMinutes().toString()+":" + myDate.getSeconds().toString();

	function createXMLHttpRequest(){  
		if(window.ActiveXObject) {  
    		xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");//创建XMLHttpRequet对象  
		}  
		else if (window.XMLHttpRequest) {  
			xmlHttp=new XMLHttpRequest();//创建XMLHttpRequet对象  
		}  
	}  
	function startRequest2() {  
		createXMLHttpRequest();       
		xmlHttp.onreadystatechange=handleStateChange;  
		xmlHttp.open("POST", "addTopic.jsp", true);  
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
		
		xmlHttp.send("name="+name+"&password="+password+"&addtime="+addtime);
 	}
	function handleStateChange() {  
  		if(xmlHttp.readyState==4) {  
 			if(xmlHttp.status==200) {  
  				if( xmlHttp.responseText == 2 )  
  					document.getElementById("nameInfo").innerHTML="<font color='green'>添加成功请手动刷新页面</font>";  
  				else  
  					document.getElementById("nameInfo").innerHTML="<font color='red'>添加失败，您的话题中存在一些</font>"; 
     		}
  		}  
	} 
	function check(){  
		if(name==""){  
			document.getElementById("nameInfo").innerHTML="<font color='red'>话题内容不能为空！</font>";  
			return false;  
		}  
		else {  
			clear();  
			return true;  
		}  
	}  
	function exec(){  
		clear();  
		name=document.getElementById("userName").value; 
		password = document.getElementById("passWord").value;
		if(check()==true){  
			startRequest2();  
		}  
	}

	function clear(){  
		document.getElementById("nameInfo").innerHTML=""; 
	}  
	out.print("name")
	out.print(password)
</script>  

<script type="text/javascript">  
	var xmlHttp_del;  
	var name_del;
	var password_del;
	
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
		xmlHttp_del.open("POST", "delTopic.jsp", true);  
		xmlHttp_del.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
		xmlHttp_del.send("name_del="+name_del+"&password_del="+password_del);
 	}
	function handleStateChange_del() {  
  		if(xmlHttp_del.readyState==4) {  
  
 			if(xmlHttp_del.status==200) {  
  				if( xmlHttp_del.responseText == 2)  
  					document.getElementById("delidInfo").innerHTML="<font color='red'>删除成功，请手动刷新页面</font>";  
  				else if( xmlHttp_del.responseText == 0) {
  					document.getElementById("delidInfo").innerHTML="<font color='red'>对不起，该话题 不是您创建的，您没有权限删除</font>";  
  					}
  				else if( xmlHttp_del.responseText == -1)    
  					document.getElementById("delidInfo").innerHTML="<font color='green'>对不起，没有您提供的DB编号</font>"; 
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
		password_del = document.getElementById("passWord").value;
		if(check_del()==true){  
				startRequest_del(); 
		} 
	}

	function clear_del(){  
		document.getElementById("delidInfo").innerHTML="";		//获取DB编号
		password_del = document.getElementById("passWord").value;   //获取用户名
	}  
	out.print("delid")
	out.print(password_del)
</script>  


</head>
<body>
	<%int pageindex = 1; %>
	<h1 style="text-align:center;">欢迎您登录我们的闲谈社区<br>Welcome to Login Our Chat Community</h1>
	<div align="right">
	<h5>
		<font color="red">点击用户名退出</font>
		<input type="button"   value =<%=session.getAttribute("accName")%> onclick="window.location.href = 'index.jsp'">
	</h5>
	</div>
	<hr>
	  <form action="#">  
		  <div align="center">  
		  <table border="1" >  
		<tr><td align="center" > 话题： <input id="userName" size="100" /><div id="nameInfo" ></div>
								<input id = "passWord" type="hidden" value = <%=session.getAttribute("accName")%>> <div id = "passwdInfo"></div>
								</td></tr>  
		 <tr><td align="center"><input type="button" value="添加"  onclick="exec();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 						<input type="button" value="主页" onclick="window.location.href = 'main_welcome.jsp'"/></td>
		 </tr>  
		  </table>  
		  </div>  
		</form>  
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
		    String sql = "select * from chat where userid='"+session.getAttribute("accName")+"'";
		    pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    rs = pstmt.executeQuery();	
		    	%>
		    	<br>
		    	<table align ="center" border="1">
		    	<tr>
		    		<th>
		    			<%out.print("DB编号"); %>
		    		</th>
		    		<th>
		    			<%out.print("话题"); %>
		    		</th>
		    		<th>
		    			<%out.print("添加时间"); %>
		    		</th>
		    	</tr>
		    	<%while(rs.next()){
		    		is_true = 1;
		  		%>

		  		<tr>
		  			<td>
		  				<%out.print(rs.getString(1)); %>
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
			    	out.println("抱歉，您没有留言话题。您可以去主页浏览其他用户的话题，或者添加自己的话题");
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