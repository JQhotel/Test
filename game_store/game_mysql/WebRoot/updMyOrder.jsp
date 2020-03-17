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
  
  <body style="color:black;background:#FFF url(images/back.jpg) no-repeat;height:100%;width:100%;background-size:cover;" >	
   <form id="demoForm"  method="post" action="<%=request.getContextPath() %>/order/updMyOrder.do"  >
   <div align="center" style="margin-top:100">
   <h1>修改地址 </h1>
        <table width="25%">
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
              <input value="${demo.id }"  name="phoneId" type="hidden">
				  ${demo.name }
            </td>
        </tr>
       
	    
       
        <tr  height="50">
            <td></td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">联系方式：</span>
				  </div>
				  <input name="id" value="${order.id }" type="hidden">
				  <input type="text" value="${order.phoneNum}"  name="phoneNum" id="phoneNum"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				  </div> 
	        </td>
        </tr>    
        <tr  height="50">
         <td></td>
         <td  >配送时间（时）：<input   value="${order.sendTime}"   id="sendTime" name="sendTime" style="width:50px;" value="1"/></td>
        </tr>   
        
        <tr  height="50">
            <td>   </td>
	        <td> 
	              <div class="input-group mb-3">
				    <span class="input-group-text" id="inputGroup-sizing-default">地址</span>
				    <textarea  class="form-control" name="address" id="address"  aria-label="地址">
				     ${order.address}
				    </textarea>
				  </div> 
	        </td>
            <td> </td>
        </tr>         
        <tr  height="50"  style="text-align:center">
          <Td >
               	
          </Td>
          <Td>
           <button  id="submitBtn"  type="button" class="btn btn-outline-primary"  >提交
			    </button>  
			   <a  href="order/queryMyOrders.do">返回</a> 
          </Td>
        </tr>
        </table>
   </div>
   
   


   
   </form>
   
  </body>
  <script type="text/javascript">
  
          (function($)
		  { 
        	  
		   	$("#submitBtn").click(function()
		  	 { 
		          var phone =$("#phoneNum").val();
		          if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone))){ 
		        	  alert("手机号码格式不对");
		              return false; 
		          }else{
		          } 		          
		          
		          var address =$("#address").val();
		          if(address==null||address==''){
		        	 alert("地址不能为空");
		        	  return;
		          }else{
		        	  
		          }
		          var sendTime =$("#sendTime").val();
		          if(0<sendTime&&sendTime<24){
		        	 
		          }else{
		        	  alert("配送时间请填写1到24");
		        	  return;
		          }	
	 		          
		          $("#demoForm").submit();

		  	 });
		  })(jQuery);
  </script>
</html>
