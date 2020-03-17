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
    
    <title>My JSP 'page.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

 
</style>
  </head>
  
  <body>
  <center>
  <div style="margin-top: 10px;font-size: 25px;">
 
<%--    第${page.pageindex}页/共${page.pagecount}页 --%>
 
    <button type="button" class="btn btn-outline-primary"><a href="demo/queryDemo.do?pageindex=1" style="color:black">首页</a></button>
    <c:if test="${page.pageindex>1 }"><button type="button" class="btn btn-outline-primary"><a style="color:black"  href="demo/queryDemo.do?pageindex=${page.pageindex-1}" >上一页</a></button></c:if>
    <c:if test="${page.pageindex<page.pagecount }"><button type="button" class="btn btn-outline-primary"><a style="color:black"  href="demo/queryDemo.do?pageindex=${page.pageindex+1}" >下一页</a></button></c:if>
    <button type="button" class="btn btn-outline-primary"><a href="demo/queryDemo.do?pageindex=${page.pagecount}" style="color:black">尾页</a></button>
    ${page.pageindex}/${page.pagecount}页
    
  </div>
  </center>
  
   <input type="hidden" name="pagecount" id="pagecount" value="${page.pagecount}"/>
   <input type="hidden" id="pagesize" value="${page.pagesize}"/>
  </body>
     
</html>
