<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


  </head>
  
  <body>
  
<div style="width:100%;height:50px;text-align:left;border-bottom:1px solid #000">
	 
   					             
   
   
   


	
	
	<span id="userSpan" style="float:right">
欢迎您，<%=request.getSession().getAttribute("loginName") %>
   	  
	<button type="button" class="btn btn-light"  ><a href="user/logOut.do"   style="color:blue">退出登录</a></span></button>
	    
	
</div>


  </body>
   
</html>
