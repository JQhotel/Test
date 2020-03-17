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
  
  <body  >

<div  style="width:9%;height:100%;float:left;border-right:1px solid #000">
<div id="list-example" class="list-group">
  <a class="list-group-item list-group-item-action"  href="demo/queryShowDemo.do">首页</a>
  <a class="list-group-item list-group-item-action"  href="order/queryMyTrolly.do">我的购物车</a>
  <a class="list-group-item list-group-item-action"  href="order/queryMyOrders.do">我的订单</a>
  
    <%
		if(request.getSession().getAttribute("loginName").equals("admin")){
	%>   
  <a class="list-group-item list-group-item-action"  href="user/queryUsers.do">用户管理</a>
  <a class="list-group-item list-group-item-action" href="demo/queryDemo.do">商品管理</a>
  <a class="list-group-item list-group-item-action" href="order/queryOrders.do">订单管理</a>
  	<%
		}
   %>
</div>   
   
</div>
  </body>
  <script src = "<%=request.getContextPath() %>/jq/jquery.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript">
    $("#userBtn").click(function(){
           window.location.href="user/queryUsers.do";
  	})
    $("#demoBtn").click(function(){
           window.location.href="demo/queryDemo.do";
  	})  	
  </script>
</html>
