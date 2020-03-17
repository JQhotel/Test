<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>游戏道具商城管理系统</title>
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
   <form action="<%=request.getContextPath() %>/user/signIn.do" method="post" id="signInForm">
   <div align="center" style="margin-top:100">
        <h1>游戏道具商城管理系统</h1>
        <br>
<!--         <h2>登录</h2> -->
        <table width="25%" style="margin-top:50px">
        <tr  height="50">
            <td width="25%"> 用户：</td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				   
				  </div>
				  <input type="text" name="loginName" id="loginName"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				  </div> 
	        </td>
        </tr>
        <tr  height="50">
            <td>  <span class="input-group-text" id="inputGroup-sizing-default">密码：</span></td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				  
				  </div>
				  <input type="password" name="passWord" id="passWord"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				</div> 
	        </td>
        </tr>
        <tr>
        <td> 
        </td>
        </tr>
        <tr>
	        <%
			String error = (String) request.getAttribute("errorMsg");
			if(error != null){
			%>
		       <div class="alert alert-danger" ><%=error %></div>
			<%
			}
			%>  
        </tr>        
        <tr  height="50" style="text-align:center">
          
          <Td>
          </Td>
          <td>
  <button type="button" class="btn btn-outline-primary" id="submitBtn">登录
			    </button>            
           <button type="button"  class="btn btn-outline-primary"  id="resetBtn">清空
			    </button>  	
                <a  href="user/toSignUp.do" class="btn btn-outline-dark">我要注册</a>
          </td>
          <Td>
          </Td>
        </tr>
        <tr style="text-align:left">
        <Td colspan="2">
        </td>
        </tr>
        </table>
   </div>
   </form>
  </body>
  <script src = "<%=request.getContextPath() %>/jq/jquery.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript">
  
          (function($)
		  { 
        	$("#resetBtn").click(function(){
        	  $("#signInForm")[0].reset();
        	})
		   	$("#submitBtn").click(function()
		  	 { 
		          var loginNameVal =$("#loginName").val();
		          if(loginNameVal==null||loginNameVal==''){
		        	  alert("登录名不能为空");
		        	  return;
		          }else{
		          }
		          
		          var passWordVal =$("#passWord").val();
		          if(passWordVal==null||passWordVal==''||passWordVal.length<6){
		        	  alert("密码长度要大于6");
		        	  return;
		          }else{
		          }		
		          
		          $("#signInForm").submit();
		  		
		  	 });
		  })(jQuery);
  </script>
  
</html>
