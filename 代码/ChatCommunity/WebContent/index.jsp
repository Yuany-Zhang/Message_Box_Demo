<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ChatCommunity</title>
</head>

<body style="background-image:url('1.jpg') no-repeat;">
	<br><br><br>
	<form action="" method="post" style="text-align:center;" name = "form1">
		<p>账户：<input type="text" name="name"></p>
		<p>密码：<input type="password" name="password"></p>
		 <input type="button" value="登录/Login" type = "submit" onclick="form1.action='confirmAccount.jsp';form1.submit();"/>
		<input type="button" value="注册/Register" onclick="window.location.href = 'Register.jsp'"/><br/><br/>
		<input type="button" value="以管理员身份登录" type="submit" onclick="form1.action='admin_index.jsp';form1.submit();"/>
	</form>
</body>
</html>