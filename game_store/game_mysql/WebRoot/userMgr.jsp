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
	
	
<!-- 新 Bootstrap4 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
 <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
 <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script> 
 <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
 <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> 
	

  </head>
  
  <body style="color:black;background:#FFF url(images/back.jpg) no-repeat;height:100%;width:100%;background-size:cover;" >  
  
<jsp:include  page="/frame/top.jsp"/>
<jsp:include  page="/frame/menu.jsp"/>
<div style="width:86%;height:800px;float:left">
				<form action="users/toadd.do" id="form1">
					<table  width="100%" class="table table-hover">
					  <thead>
					    <tr>
			              <th  scope="row">
			              <input   name="findname" class="form-control" >
			              </th>
			              <th  >
			              <button type="button" class="btn btn-outline-primary"  id="findBtn">查询
			              </button>
                          <button type="button" class="btn btn-outline-primary"   id="toAddBtn">新增
			              </button>	
			              </th>
			              <th  >
			              </th>
					    </tr>
					    <tr>
					      <th  scope="col">用户</th>
					      <th  scope="col">权限</th>
					      <th  scope="col">QQ号</th>
					      <th  scope="col">手机 </th>
					      <th  scope="col">操作</th>
					    </tr>
					  </thead>
					  <tbody>
							<c:forEach items="${items}" var="i">
								<tr>
								<td  >${i.loginName }</td>
								<td  >
								<c:choose>  
								<c:when test="${i.roleType==0}">
	                                管理员
	                            </c:when>
	                           <c:when test="${i.roleType!=0}">
	                            普通用户
	                            </c:when>
	                            </c:choose>
	                            </td>
							 
								 
								<td  >${i.qqNum }</td>
								<td  >${i.phoneNum }</td>
								<td>
								<button type="button" class="btn btn-outline-warning"><a  href="user/toUpdUser.do?id=${i.id}">修改</a></button>
								  <c:if test="${i.roleType!=0}">
	                                <button type="button" class="btn btn-outline-danger"><a  href="user/delUser.do?id=${i.id}">删除</a></button>
	                              </c:if>
								</td>
								</tr>
							</c:forEach>    
						    <tr align="right" >
								<td height="36" colspan="7" align="center">
									<jsp:include  page="/frame/userPage.jsp"/>
								</td>
							</tr>							
					  </tbody>
					</table>
				 </form>

</div>


  </body>
  <script src = "<%=request.getContextPath() %>/jq/jquery.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript">
  

 $("#addbutton").click(function(){
    $("#usersform").attr("action","users/toadd.do");
    $("#usersform").submit();  
})
 $("#delbutton").click(function(){
    $("#usersform").attr("action","users/del.do");
    $("#usersform").submit();  
})

 $("#findBtn").click(function(){
	 $("#form1").attr("action","user/queryUsers.do");
	 $("#form1").submit();   
})
 $("#toAddBtn").click(function(){
	 $("#form1").attr("action","user/toAddUser.do");
	 $("#form1").submit();   
})



  </script>
 
</html>
