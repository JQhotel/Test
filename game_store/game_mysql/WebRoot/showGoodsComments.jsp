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
   <h1>评论			<a style="color:white"  href="demo/queryShowDemo.do"><button   type="button" class="btn btn-outline-primary"  >   返回</button>  </a>  
   </h1>
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
   <div style="width:100%;height:500px;float:left;color:black;margin-top:100px;">
   <c:forEach items="${comments}" var="i">
      <div style="width:100%;height:30px;margin-bottom:10px;border-bottom: 1px solid;border-top: 1px solid"><span  style="float:left;margin-left:300px">${i.comment }</span><span style="float:right;margin-right:100px">${ i.loginName}&nbsp;${i.createTimeStr }</span></div>
   </c:forEach>
   <c:if test="${page.size>0 }">
	<jsp:include  page="/frame/showCommentPage.jsp"/>
   </c:if>
   <c:if test="${page.size==0 }">
   <h3>暂无评论</h3>
   </c:if>
   <div>
   <br>
   <div style="margin-top:50px;width:100%">
  </div>
  
   </div>
   </div>
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
		         		          
		          
		          var comment =$("#comment").val();
		          if(comment==null||comment==''){
		        	 alert("评论不能为空");
		        	  return;
		          }else{
		        	  
		          }
		          
	 		          
		          $("#demoForm").submit();

		  	 });
		  })(jQuery);
  </script>
</html>
