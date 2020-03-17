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
   <form id="demoForm"  method="post" action="<%=request.getContextPath() %>/order/addOrder.do"  >
   <div align="center" style="margin-top:100">
   <h1>下单 </h1>
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
	        <Td>  
              
	        </Td>
	        <td> 
	        种类：&nbsp;  ${demo.goodsKind }
	        </td>
        </tr>   
       
	    <tr>
	    <td>
	    </td>
	    </tr>
	     <tr  height="50">
	        <Td>   
	        </Td>
	        <td> 
	       单价：&nbsp; <span style="color:red;font-weight:bold;font-size:25px">${demo.price }元</span>
	                      <input value="${demo.price }" id="payMoney"  name="payMoney" type="hidden">
	        
	        </td>
        </tr>	
        <tr  height="50">
         <td></td>
         <td  >数量：<input  onchange="getSum()" price="${demo.price }"  id="buyNum" name="buyNum" style="width:50px;" value="1"/></td>
        </tr> 
        
        <tr  height="50">
         <td></td>
         <td  >
         总价：<span  style="color:red;font-weight:bold;font-size:25px" id="totalMoney">${demo.price }元</span>
         </td>
        </tr> 
        <tr  height="50">
            <td></td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">手机号码</span>
				  </div>
				  <input type="text" value="${user.phoneNum}"  name="phoneNum" id="phoneNum"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				  </div> 
	        </td>
        </tr>   
                 <tr  height="50">
            <td></td>
	        <td>
				 <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">QQ号码</span>
				  </div>
				  <input type="text" value="${user.qqNum}"  name="qqNum" id="qqNum"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				  </div> 
	        </td>
        </tr>   
        
        
          

        <tr  height="50"  style="text-align:center">
          <Td >
               	
          </Td>
          <Td>
           <button  id="submitBtn"  type="button" class="btn btn-outline-primary"  >下单
			    </button>  
			   <a  href="demo/queryShowDemo.do">
			   <button  type="button" class="btn btn-outline-primary"  > 
			     返回
			   </button>
			   </a> 
          </Td>
        </tr>
        </table>
   </div>
   
   


   
   </form>
   
  </body>
  <script type="text/javascript">
  function getSum(){
	   var buyNum  = $("#buyNum").val();
	   if(buyNum>0){
		   var price = $("#buyNum").attr("price");
		   var sum = price*buyNum;
		   $("#totalMoney").html(sum+"元");
		   $("#payMoney").val(sum);
	   }else{
		   alert("请输入正确的数量");
		   return;
	   }
  }
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
		          
		          
		          
		          var buyNum =$("#buyNum").val();
		          if(buyNum>0){
		        	 
		          }else{
		        	  alert("数量格式不对");
		        	  return;
		          }		
		          
		          var qqNum =$("#qqNum").val();
		          if(qqNum.length>6&&qqNum>0){
		        	  
		          }else{
		        	  alert("QQ号码格式不对");
		              return false; 
		          }
	 		          
                  alert("下单成功！");
		          $("#demoForm").submit();

		  	 });
		  })(jQuery);
  </script>
</html>
