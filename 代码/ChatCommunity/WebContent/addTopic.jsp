<%@ page language="java" import="java.util.*,java.io.File,java.sql.*" pageEncoding="utf-8" import ="java.util.*"%>  
<%@page contentType="text/html;charset=utf-8"%>  

<%  
  int status=0;  
  String name=request.getParameter("name");  
  String topic =  new String(name.getBytes("ISO-8859-1"),"UTF-8");
  String top="";
  char [] cc;
 // byte cc[]=topic.getBytes("ISO-8859-1");
  cc=topic.toCharArray(); 
  for(int i=0;i<topic.length();i++){
	  if(cc[i] !='\''){
		  top = top + cc[i];
	  }
	  else{
		  top = top + "\\'";    // 转义 把 单引号转义   使得执行插入的时候不会报错
	  }
  }
  String userid=request.getParameter("password"); 
  String addtime = request.getParameter("addtime");
  String insertSql="insert into chat (userid,topic,addtime) values ('"+userid+"','"+top+"','" +addtime+ "')";

  String   dbUr1="jdbc:mysql://localhost:3306/chatcommunity";     
          String   user="system";     
          String   password="zhangyuanyi";    
          try{      
 		  Class.forName("com.mysql.jdbc.Driver").newInstance();
          Connection   c=DriverManager.getConnection(dbUr1,user,password);     
          Statement s=c.createStatement();       
          s.executeUpdate(insertSql);
          status = 2;
          s.close(); 
          c.close();
          }catch(Exception e){  
          e.printStackTrace();  
          }  
           
  out.print(status);   
%> 