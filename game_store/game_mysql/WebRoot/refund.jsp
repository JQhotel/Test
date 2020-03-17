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
   <form id="demoForm"  method="post" action="<%=request.getContextPath() %>/order/applyRefund.do"  >
   <div align="center" style="margin-top:100">
   <h1>申请退货 </h1>
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
              <input value="${demo.id }"  name="goodsId" type="hidden">
				  ${demo.name }
            </td>
        </tr>
       
	    
       
        <tr  height="50">
            <td></td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">电话号码：</span>
				  </div>
				  <input name="orderId" value="${order.id }" type="hidden">
				  ${order.phoneNum}
				  </div> 
	        </td>
        </tr>    
        
         <tr  height="50">
            <td></td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">qq号码：</span>
				  </div>
				  <input name="id" value="${order.id }" type="hidden">
				  ${order.qqNum}
				  </div> 
	        </td>
        </tr>    
        
         
        
        <tr  height="50">
            <td>   </td>
	        <td> 
	              <div class="input-group mb-3">
				    <span class="input-group-text" id="inputGroup-sizing-default">退货理由：</span>
				    <textarea  class="form-control" name="reason" id="reason"  aria-label="原因"></textarea>
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
			   <a  href="order/queryMyOrders.do"><button  id="submitBtn"  type="button" class="btn btn-outline-primary"  >返回</button></a> 
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
		          var reason =$("#reason").val();
		          if(reason==null||reason==''){
		        	 alert("原因不能为空");
		        	  return;
		          }else{
		        	  
		          }
	 		          
		          $("#demoForm").submit();

		  	 });
		  })(jQuery);
  </script>
</html>
