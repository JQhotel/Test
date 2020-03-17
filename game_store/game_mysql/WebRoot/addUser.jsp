<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
   <!-- 	jq -->
   <script src = "<%=request.getContextPath() %>/jq/jquery.js" language="javascript" type="text/javascript"></script>
		
  
  </head>
  
  <body style="color:black;background:#FFF url(images/back.jpg) no-repeat;height:100%;width:100%;background-size:cover;" >	
   <form id="signUpForm" action="<%=request.getContextPath() %>/user/addUser.do"  >
   <div align="center" style="margin-top:100">
   <h1>增加用户</h1>
         <table width="25%">
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
<!--         <Tr height="24"><th><captioN style="font-size: 30;text-align:center"><b>注册</b></captioN><th></Tr> -->
       <tr  height="50">
            <td width="20%">
				    <span class="input-group-text" id="inputGroup-sizing-default">用户：</span>
            </td>
	        <td width="70%">
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				  </div>
				  <input type="text" name="loginName" id="loginName"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				  </div> 
				  
	        </td>
	        
        </tr>
        <tr>
	        <td></td>
	        <td ><div id="loginNameError" style="color:red"></div></td>
        </tr>
       
        <tr  height="50">
	          <td>
				    <span class="input-group-text" id="inputGroup-sizing-default">密码：</span>
	          </td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				  </div>
				  <input type="password" name="passWord" id="passWord"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				</div> 
	        </td>
        </tr>
        <tr>
	        <td></td>
	        <td ><div id="pass1Error" style="color:red"></div></td>
        </tr>        
        <tr  height="50">
	          <td>
				    <span class="input-group-text" id="inputGroup-sizing-default">确认密码：</span>
	          </td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				  </div>
				  <input type="password" name="surePassWord" id="surePassWord"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				</div> 
	        </td>
        </tr>        
        <tr>
	        <td></td>
	        <td ><div id="pass2Error" style="color:red"></div></td>
        </tr>           
         <tr  height="50">
	          <td>
				    <span class="input-group-text" id="inputGroup-sizing-default">手机号：</span>
	          </td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				  </div>
				  <input   name="phoneNum" id="phoneNum"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				</div> 
	        </td>
        </tr>  
        <tr>
	        <td></td>
	        <td ><div id="phoneError" style="color:red"></div></td>
        </tr>               
         <tr  height="50">
	          <td>
				    <span class="input-group-text" id="inputGroup-sizing-default">QQ号：</span>
	          </td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				  </div>
				  <input   name="qqNum" id="qqNum"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				</div> 
	        </td>
        </tr>  
        <tr>
	        <td></td>
	        <td ><div id="qqNumError" style="color:red"></div></td>
        </tr>                  
        
        
        
        <tr  height="50"  style="text-align:center">
          <Td >
			  
          </Td>
          <Td>
            <button  id="submitBtn"  type="button"  class="btn btn-outline-primary"  >新增
			    </button>  
          <button  id="resetBtn"  type="button" class="btn btn-outline-primary"  >清空
			    </button>  
          </Td>
        </tr>
        </table>
   </div>
   
   


   
   </form>
   
  </body>
  <script type="text/javascript">
  
          (function($)
		  { 
        	$("#resetBtn").click(function(){
        	  $("#signUpForm")[0].reset();
        	})
		   	$("#submitBtn").click(function()
		  	 { 
		   	 var loginNameVal =$("#loginName").val();
	          if(loginNameVal==null||loginNameVal==''){
//	        	 alert("登录名不能为空");
	        	 $("#loginNameError").text("登录名不能为空");
	        	  return;
	          }else{
	        	  $("#loginNameError").text("");
	          }
	          
	          if(loginNameVal>0){
	        	  $("#loginNameError").text("登录名格式不对");
	        	  return;
	          }else{
	        	  $("#loginNameError").text("");

	          }
	          
	             
	          
	          var passWordVal =$("#passWord").val();
	          if(passWordVal==null||passWordVal==''||passWordVal.length<6){
	        	  $("#pass1Error").text("密码格式不对");
	        	  return;
	          }else{
	        	  $("#pass1Error").text("");

	          }		
	          
	          var surePasswordVal =$("#surePassWord").val();
	          if(surePasswordVal==passWordVal){
	        	  $("#pass2Error").text("");
	        	  
	          }else{
	        	  $("#pass2Error").text("密码不一致");
	        	  return;
	          }	
	          
	          var phone =$("#phoneNum").val();
	          if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone))){ 
	        	  $("#phoneError").text("手机格式不对");
	              return false; 
	          }else{
	        	  $("#phoneError").text("");
	        	  
	          } 		          
	          
	          var qqNum=$("#qqNum").val();
	          if(qqNum.length>6&&qqNum>0){
	        	  $("#qqNumError").text("");
	          }else{
	        	  $("#qqNumError").text("QQ号格式不对");
	              return false; 
	          }
		          $("#signUpForm").submit();
		  		
		  	 });
		  })(jQuery);
  </script>
</html>
