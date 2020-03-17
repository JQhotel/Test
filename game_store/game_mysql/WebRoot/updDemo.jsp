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
  
  <body style="color:black;background:#FFF url(images/back.jpg) no-repeat;height:100%;width:100%;background-size:cover;" >	
   <form id="demoForm"  method="post" action="<%=request.getContextPath() %>/demo/updDemo.do" enctype="multipart/form-data" >
   <div align="center" style="margin-top:100">
   <h1>修改 </h1>
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
	         <img   id="showImg" class="img-thumbnail" width="300" height="300"  src="/imgUrl/${demo.imgPath }">
        </td>
        </tr> 
       <tr  height="50">
	        <Td>  
	        </Td>
	        <td>
	          图片
	        	          <input type="file" name="imgFile" id="demoImgFile" class="form-control"  accept=".jpg,.png">
	        </td>
        </tr>
              
        <tr  height="50">
	        <td>  
	        </td>
            <td> 
                  <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">商品：</span>
				  </div>
				  <input value="${demo.name }"  name="oldName" type="hidden">
				  <input value="${demo.id }"  name="id" type="hidden">
				  <input type="text" name="name" id="name" value="${demo.name }" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				  </div> 
            </td>
        </tr>
        <tr  height="50">
	        <Td>   
	        </Td>
	        <td> 
	              <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">价格：</span>
				  </div>
				  <input type="text" name="price" id="price" value="${demo.price }"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
				  </div> 
	        </td>
        </tr>
        <tr  height="50">
	        <Td>  
              
	        </Td>
	        <td> 
	             <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">品质</span>
				  </div>
				     <c:choose>  
								<c:when test="${demo.goodsKind eq 'LOL'}">
  <input style="width:20px;height:20px"  name="goodsKind"  checked="checked" value="LOL" type="radio"/>LOL
				  <input style="width:20px;height:20px" name="goodsKind" value="DNF" type="radio"/>DNF
                  <input style="width:20px;height:20px" name="goodsKind" value="CF" type="radio"/>	CF	 								
													
	                            </c:when>
								<c:when test="${demo.goodsKind eq 'DNF'}">
  <input style="width:20px;height:20px"  name="goodsKind"   value="LOL" type="radio"/>LOL
				  <input style="width:20px;height:20px" checked="checked" name="goodsKind" value="DNF" type="radio"/>DNF
                  <input style="width:20px;height:20px" name="goodsKind" value="CF" type="radio"/>	CF	 								
													
	                            </c:when>
								<c:when test="${demo.goodsKind eq 'CF'}">
  <input style="width:20px;height:20px"  name="goodsKind" value="LOL" type="radio"/>LOL
				  <input style="width:20px;height:20px" name="goodsKind" value="DNF" type="radio"/>DNF
                  <input style="width:20px;height:20px" checked="checked" name="goodsKind" value="CF" type="radio"/>	CF	 								
													
	                            </c:when>	                            
	                            </c:choose>
				        
				        
				  

					  
				  
				  </div>    
	        </td>
        </tr>        
        <tr  height="50">
	        <Td>   
	        </Td>
	        <td> 
	          <span class="input-group-text" id="inputGroup-sizing-default">描述</span>
				    <textarea class="form-control" name="goodsDesc" id="goodsDesc"  value="${demo.goodsDesc }"   aria-label="描述">${demo.goodsDesc }</textarea>
	        </td>
        </tr> 
       
        <tr  height="50"  style="text-align:center">
          <Td >
			   
               	
          </Td>
          <Td>
           <button  id="submitBtn"  type="button" class="btn btn-outline-primary"  >保存
		 </button>  
          </Td>
        </tr>  
       
	    <tr>
	    <td>
	    </td>
	    </tr>        
        </table>
   </div>
   
   


   
   </form>
   
  </body>
  <script type="text/javascript">
  
          (function($)
		  { 
        	  $("#imgFile").change(function(){
   			   $("#showImg").attr("src",URL.createObjectURL($(this)[0].files[0]));
   			  });             	  
        	  
        	$("#resetBtn").click(function(){
        	  $("#addGoodsForm")[0].reset();
        	})
		   	$("#submitBtn").click(function()
		  	 { 
		          var name =$("#name").val();
		          if(name==null||name==''){
		        	 alert("商品名不能为空");
		        	  return;
		          }else{
		          }
		          
		          var price =$("#price").val();
		          if(price>0&&price%1 === 0){
		        	  
		          }else{
		        	  alert("价格要大于0");
		        	  return;		        	  
		          }		
		          
		         
		          
	 		          
 
		          $("#demoForm").submit();

		  	 });
		  })(jQuery);
  </script>
</html>
