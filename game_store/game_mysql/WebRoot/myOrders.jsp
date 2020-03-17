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
<h3>我的订单</h3>
				<form action="order/queryMyOrders.do" id="form1">
					<table   width="100%" class="table table-hover">
					  <thead>
					    <tr>
					      <th  >
						        <input   class="form-control" name="findname" id="findname"   placeholder="商品/订单号" >
			              </th>  
			              <th  >
			                    <button class="btn btn-outline-primary"  type="button" class="btn btn-outline-primary" data-toggle="dropdown" id="findBtn">查询
					            </button>
			              </th>
			              <th  >
			              
			              </th>
			              <th  >
			              
			              
			              </th>
					    </tr>
					    <tr>
					       <th scope="col" >订单号</th>
					       <th scope="col" >图片</th>
					      <th  scope="col">商品</th>
					      <th  scope="col">下单时间</th>
					      <th  scope="col">单价</th>
					      <th  scope="col">数量</th>
					       <th  scope="col">花费(元)</th>
					       <th  scope="col">状态</th>
					      <th scope="col">操作</th>
					    </tr>
					  </thead>
					  <tbody>
							<c:forEach items="${items}" var="i">
								<tr>
								<td  >${i.id}</td>
								<td><img  class="img-thumbnail" width="120" height="120"  src="/imgUrl/${i.imgPath }"></td>
								<td  >${i.goodsName}</td>
								<td  >${i.createTimeStr }</td>
								<td  >${i.price }</td>
								<td  >${i.buyNum }</td>
								<td  >${i.payMoney }</td>
								<td  >
<!-- 								status 1交易成功   2申请退款  3退款通过 4   退款失败 -->
								 <c:choose>  
								<c:when test="${i.status==1}">
	                               交易成功
	                            </c:when>
	                           <c:when test="${i.status==2}">
	                       申请退款
	                            </c:when>
	                           <c:when test="${i.status==3}">
	                       退货成功
	                            </c:when>	 
	                           <c:when test="${i.status==4}">
	                        退款失败
	                            </c:when>
	                            </c:choose>
								</td>
								<td  style="text-align:left">
								  <c:if test="${i.status==1}">
	                                  <a  href="order/toRefund.do?orderId=${i.id}"><button type="button" class="btn btn-outline-primary">申请退货</button></a>
	                                  	 <a  href="order/toAddComment.do?orderId=${i.id}"><button type="button" class="btn btn-outline-primary">我要评论</button></a>
	                                  
	                              </c:if>
								</td>
	                            <td >
	                            </td>								
								</tr>
							</c:forEach>    
						    <tr align="right" >
								<td height="36" colspan="7" align="center">
									<jsp:include  page="/frame/myOrdersPage.jsp"/>
								</td>
							</tr>							
					  </tbody>
					</table>
				 </form>
</div>



  </body>
  <script src = "<%=request.getContextPath() %>/jq/jquery.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript">
  
 

 $("#findBtn").click(function(){
	 $("#form1").attr("action","order/queryMyOrders.do");
	 $("#form1").submit();   
})



  </script>
 
</html>
