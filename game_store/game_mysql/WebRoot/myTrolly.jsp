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
				<form action="" id="form1">
					<table  width="100%" class="table table-hover">
					  <thead>
					    <tr>
					      <th  >
			              </th>  
			              <th  >
			              </th>
			              <th  >
			              
			              </th>
			              <th  >
			              
			              
			              </th>
					    </tr>
					    <tr>
					       <th scope="col" >图片</th>
					      <th  scope="col">商品</th>
					      <th  scope="col">单价</th>
					      <th scope="col">数量</th>
					      <th scope="col">操作</th>
					    </tr>
					  </thead>
					  <tbody>
					  <input type="hidden" id="itemsNum" value="${total}"/>
					       <c:if test="${total==0}">
					        购物车空了！
					       </c:if>
							<c:forEach items="${items}" var="i">
								<tr>
								<td><img  class="img-thumbnail" width="160" height="160"  src="/imgUrl/${i.imgPath }"></td>
								<td  >${i.name}</td>
								<td  >${i.price }</td>
								<td  ><input  onchange="getSum()" price="${i.price }"  name="buyNum" style="width:50px;" value="1"/></td>
								<td >
	                             <a  href="order/delTrolly.do?vegetablesId=${i.id}">删除</a>
								</td>
	                            <td >
	                            </td>								
								</tr>
							</c:forEach>    
							<tr align="right" >
							<Td colspan="4"></Td>
							<Td colspan="2">总价：<span  style="color:red;font-weight:bold;font-size:25px" id="totalMoney">${totalMoney}元</span></Td>
							</tr>
							
							<c:if test="${total>0}">
					         <tr align="right" >
						    <Td colspan="4"></Td>
						    <Td colspan="1">
						           						
					        </Td>
							</tr>	
						    <tr align="right" >
						    <Td colspan="4"></Td>
						    <Td colspan="2">
 <div class="input-group mb-3">
									  <div class="input-group-prepend">
									    <span class="input-group-text" id="inputGroup-sizing-default">联系方式：</span>
									  </div>
									  <input type="text" style="width:50px;" value="${user.phoneNum}"  name="phoneNum" id="phoneNum"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
									</div> 
                                    <div class="input-group mb-3">
									    <span class="input-group-text" id="inputGroup-sizing-default">QQ号码：</span>
									 <input type="text" style="width:50px;" value="${user.qqNum}"  name="qqNum" id="qqNum"  class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">

									</div> 									    
						    
						           <button class="btn btn-outline-warning"  type="button"  data-toggle="dropdown" id="emptyBtn">清空</button>
						           &nbsp; &nbsp; &nbsp; &nbsp;
						           <button class="btn btn-outline-danger"  type="button"  data-toggle="dropdown" id="payBtn">一键支付
					               </button>	
					        </Td>
							</tr>							
					        </c:if>
					  </tbody>
					</table>
				 </form>
</div>



  </body>
<%--   <script src = "<%=request.getContextPath() %>/jq/jquery.js" language="javascript" type="text/javascript"></script> --%>
    <script type="text/javascript">
  
 function getSum(){
	 var sum = 0;
	 $("input[name='buyNum']").each(function(){
         //遍历所有复选框，然后取值进行 !非操作
         var buyNum = $(this).val();
         if(buyNum>0){
        	 var price  =  $(this).attr("price");
        	 var sum0=price*buyNum;
        	 sum+=sum0;
         }else{
        	 alert("数量要大于0");
        	 return;
         }
     })	 
     $("#totalMoney").html(sum+"元");
 }

 $("#emptyBtn").click(function(){
	 var count = $("#itemsNum").val();
	 if(count==0){
		 alert("购物车已空");
		 return;
	 }
	 $("#form1").attr("action","order/delAllTrolly.do");
	 $("#form1").submit();   
})
 $("#payBtn").click(function(){
	 var count = $("#itemsNum").val();
	 if(count==0){
		 alert("购物车已空,请添加后再下单");
		 return;
	 }	 
	 
	  var phone =$("#phoneNum").val();
      if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone))){ 
    	  alert("手机号码格式不对");
          return false; 
      }else{
      } 		          
      
      var qqNum =$("#qqNum").val();
      if(qqNum.length>6&&qqNum>0){
    	
      }else{
    	  alert("qq号码不能为空");
    	  return;
      }
 	 $("input[name='buyNum']").each(function(){
         var buyNum = $(this).val();
 		 
         //遍历所有复选框，然后取值进行 !非操作
         if(buyNum>0){
         }else{
        	 alert("请输入正确的数量");
        	 return;
         }
     })	      
    
	 alert("付款成功！");
	 $("#form1").attr("action","order/buyAllDemos.do");
	 $("#form1").submit();   
})



  </script>
 
</html>
