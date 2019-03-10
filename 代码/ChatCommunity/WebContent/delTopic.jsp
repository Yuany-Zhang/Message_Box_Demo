<%@ page language="java" import="java.util.*,java.io.File,java.sql.*" pageEncoding="utf-8" import ="java.util.*"%>  
<%@page contentType="text/html;charset=utf-8"%>  

<%  
  int status_del=0;  
  String userid=request.getParameter("password_del"); 
  String id=request.getParameter("name_del"); 
  String addtime = request.getParameter("addtime");
  ResultSet rs = null;
  String delsql="delete from chat where id="+id +" and userid ='" + userid + "'";
  String querysql = "select * from chat where id="+id;
  String selectsql="select * from chat where id="+id +" and userid ='" + userid + "'";
  String   dbUr1="jdbc:mysql://localhost:3306/chatcommunity";     
  String   user="system";     
  String   password="zhangyuanyi";   
  
  try{
	  Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Connection   cs=DriverManager.getConnection(dbUr1,user,password);    
	  Statement ss=cs.createStatement();  
	  rs = ss.executeQuery(querysql);
	  if(rs.next()){
		  rs = ss.executeQuery(selectsql);
		  if(rs.next()){
			  ss.executeUpdate(delsql);
			  status_del = 2;      //一切OK 要删除的话题是该用户创建的，并且有权限删除
			  ss.close(); 
			  cs.close();
		  }
		  else{
			  status_del = 0;    //要删除的topic不是该用户创建的，因此没有权限去删除
			  ss.close(); 
			  cs.close();
		  }
	  }else{
	 		status_del = -1;     //没有 DB编号
	 		ss.close(); 
			cs.close();
		}		    
  }catch(Exception e){
	  e.printStackTrace();
  }

out.print(status_del);  
%> 