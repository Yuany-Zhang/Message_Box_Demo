<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录失败</title>
</head>
<body style="text-align:center">
		<h1 style="text-align:center;">抱歉，您输入的账号或者密码有误，请重新输入<br> 两秒后自动跳转到登录页面</h1>
		<h5 style="text-align:center;">
			<input type="button" value="点击这里直接跳转" onclick="window.location.href = 'index.jsp'"> 
		</h5>
		<% response.setHeader("Refresh","3;url=index.jsp");  %>
</body>
</html>