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
 
  
    <a href="order/toCommentMgr.do?pageindex=1&goodsId=${goodsId}" style="color:black"><button type="button" class="btn btn-outline-primary">首页</button></a>
    <c:if test="${page.pageindex>1 }"><a style="color:black"  href="order/toCommentMgr.do?pageindex=${page.pageindex-1}&goodsId=${goodsId}" ><button type="button" class="btn btn-outline-primary">上一页</button></a></c:if>
    <c:if test="${page.pageindex<page.pagecount }"><a style="color:black"  href="order/toCommentMgr.do?pageindex=${page.pageindex+1}&goodsId=${goodsId}" ><button type="button" class="btn btn-outline-primary">下一页</button></a></c:if>
    <a href="order/toCommentMgr.do?pageindex=${page.pagecount}&goodsId=${goodsId}" style="color:black"><button type="button" class="btn btn-outline-primary">尾页</button></a>
    
            ${page.pageindex}/${page.pagecount}页
  </div>
  </center>
  
   <input type="hidden" name="pagecount" id="pagecount" value="${page.pagecount}"/>
   <input type="hidden" id="pagesize" value="${page.pagesize}"/>
  </body>
     
</html>
