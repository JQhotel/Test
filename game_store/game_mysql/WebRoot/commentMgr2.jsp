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
	
   <!-- 	jq -->
   <script src = "<%=request.getContextPath() %>/jq/jquery.js" language="javascript" type="text/javascript"></script>
		
<!-- 新 Bootstrap4 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
 <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
 <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script> 
 <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
 <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> 
	
		
  
  </head>
  
  <body style="color:blue;background:#FFF url(images/back.jpg) no-repeat;height:100%;width:100%;background-size:cover;" >	
   <form id="demoForm"  method="post" action="<%=request.getContextPath() %>/order/addMyComment.do"  >
   <div align="center" style="margin-top:100">
   <h1>评论			<button   type="button" class="btn btn-outline-primary"  >   <a style="color:white"  href="demo/queryDemo.do">返回</a>  </button>  
   </h1>
 
 
   <br>
 
 <table width="25%"  class="table table-hover">
        <tr>
        <%
		String error = (String) request.getAttribute("errorMsg");
		if(error != null){
		%>
	       <div ><font color=red><%=error %></font></div>
		<%
		}
		%>  
        </tr>
        <tr>
        <td></td>
        <td>
	         <img   id="showImg" class="img-thumbnail" width="200" height="200"  src="/imgUrl/${demo.imgPath }">
        </td>
        </tr>        
        <tr  height="50">
	        <td>  
	        </td>
            <td> 
           商品：
            &nbsp;
              <input value="${demo.id }"  name="goodsId" type="hidden">              
				  ${demo.name }
            </td>
        </tr>
        </table>
   <div style="width:100%;height:500px;float:left;color:black">
   
   
   
   					<table  width="100%" class="table table-hover">
					  <thead>
					    <tr height="20px" >
					      <th  scope="col">评论</th>
					       <th scope="col" >用户</th>
					      <th  scope="col">时间</th>
					      <th scope="col">操作</th>
					    </tr>
					  </thead>
					  <tbody>
							<c:forEach items="${Comments}" var="i">
								<tr  height="30px" >
								<td  >${i.comment}</td>
								<td  >${i.loginName }</td>
								<td  >${i.createTimeStr }</td>
								<td >
	                             <a  href="order/delComments.do?id=${i.id}&goodsId=${i.goodsId}">删除</a>
								</td>
	                            <td >
	                            </td>								
								</tr>
							</c:forEach>    
						    <tr align="right" >
								<td height="36" colspan="7" align="center">
	<jsp:include  page="/frame/commentMgrPage.jsp"/>
								</td>
							</tr>							
					  </tbody>
					</table>
 
 
 
  
   </div>
 
   


   
   </form>
   
  </body>
</html>
