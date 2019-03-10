<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册/Register</title>
</head>
<body>
	<br><br><br><br><br>
	<form action="dealRegister.jsp" method="post" style="text-align:center;">
		<p> 账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" name="accountName" ></p>
		<p> 密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="accountPasswd"> </p>
		<p> 确认密码：<input type="password" name="confirmPasswd"></p>
		<p> 邀请号码：<input type="text" name="inviteCode" value="请输入八个字母"> </p>
		
		<input type="submit" value="确定" id="confirmPasswd">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" id="registerReset">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="返回" onclick="window.location.href = 'index.jsp'"> 
		
		<h5>
		<div id="infomation">
			需要邀请码请发邮件到 <a href="http://m.scnu.edu.cn/"> brookzhyy@m.scnu.edu.cn </a>作者会在两个工作日内给您发送邀请码<br>
		</div>
		</h5>
		<style type="text/css">
			#infomation {
				position:absolute;
				bottom:0;
				text-align:center;
			}
		</style>
	</form>
	
</body>
</html>