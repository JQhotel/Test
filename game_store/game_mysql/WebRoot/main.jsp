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
<jsp:include  page="/frame/top.jsp"/>
<jsp:include  page="/frame/menu.jsp"/>
<div style="width:91%;height:1000px;float:left;">

<div id="demo" class="carousel slide" data-ride="carousel" > 
 
  <!-- 指示符 -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
 
  <!-- 轮播图片 -->
  <div class="carousel-inner" style="margin-left:35%">
    <div class="carousel-item active">
      <img  src="<%=request.getContextPath() %>/images/1.jpg">
    </div>
    <div class="carousel-item">
      <img    src="<%=request.getContextPath() %>/images/2.jpg">
    </div>
    <div class="carousel-item">
      <img   src="<%=request.getContextPath() %>/images/3.jpg">
    </div>
  </div>
 
  <!-- 左右切换按钮 -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
 
</div>




                    <div style="width:100%;height:50px;">
                       <form action="demo/queryShowDemo.do" id="form1">

                                <c:choose>  
                                <c:when test="${goodsKind eq ''}">
						           <b>全部</b>
						           <a href="demo/queryShowDemo.do?goodsKind=LOL">LOL</a>
						           <a href="demo/queryShowDemo.do?goodsKind=DNF">DNF</a>
						           <a href="demo/queryShowDemo.do?goodsKind=CF">CF</a>
	                            </c:when>                                
								<c:when test="${goodsKind eq 'LOL'}">
						           <a href="demo/queryShowDemo.do">全部</a>
						           <b>LOL</b>
						           <a href="demo/queryShowDemo.do?goodsKind=DNF">DNF</a>
						           <a href="demo/queryShowDemo.do?goodsKind=CF">CF</a>
	                            </c:when>
								<c:when test="${goodsKind eq 'DNF'}">
							       <a href="demo/queryShowDemo.do">全部</a>
						           <a href="demo/queryShowDemo.do?goodsKind=LOL">LOL</a>
						           <b>DNF</b>
						           <a href="demo/queryShowDemo.do?goodsKind=CF">CF</a>
	                            </c:when>
								<c:when test="${goodsKind eq 'CF'}">
							       <a href="demo/queryShowDemo.do">全部</a>
						           <a href="demo/queryShowDemo.do?goodsKind=LOL">LOL</a>
						           <a href="demo/queryShowDemo.do?goodsKind=DNF">DNF</a>
						           <b>CF</b>
	                            </c:when>	                            
	                            </c:choose>
				        
                       
                       
                       
						 <table class="table">
							  <thead>
							    <tr>
							      <th scope="col" width="300px">
								        <input  name="findname" class="form-control" id="findname"   style="width:300px" >
					              </th>  
					              <th scope="col">
					                    <button type="button" class="btn btn-outline-primary"   id="findBtn">查询
					                      </button> 
					              </th>
					              <th scope="col">
					              </th>
					              <th scope="col">
					              </th>
					              <th scope="col">
					              </th>
					              <th scope="col">
					              </th>
					              <th scope="col">
					              </th>
							    </tr>
							  </thead>
						  </table>
						</form>
					 </div>
					 <div style="width:100%;height:700px;float:left;text-align:center">
					     <c:forEach items="${items}" var="i">
					       <div style="width:33%;height:330px;float:left;margin-top:20px">
							     <div style="width:100%;">
							     <img  width="300" height="200"  class="rounded"   class="img-rounded"   src="/imgUrl/${i.imgPath }">
							     </div>
							     <div  style="width:100%;float:left;font-size:13px;text-align:auto">
							               <p><span style="font-size:15px"><b style="color:black;">${i.name}</b></span>
										   <span style="font-size:30px"><b style="color:red;">${i.price}</b>元</span>
										   </p>
										   <br>
										  <a  style="color:red"  href="order/toBuyGoods.do?id=${i.id}">
												   <button type="button" class="btn btn-outline-danger"  >
												 购买
												   </button>
										   </a> 
										      <button type="button"  onclick="add(${i.id})" class="btn btn-outline-primary">放进购物车</button>
										   <a href="order/toShowComment.do?goodsId=${i.id}">
										         <button type="button"   class="btn btn-outline-success">查看评论</button>
										   </a>
										   </p>
							     </div>
					       </div>
					     </c:forEach>    
					  </div>
					  <div style="width:100%;height:50px;">
					    <jsp:include  page="/frame/demoShowPage.jsp"/>
					  </div>
					 

</div>


  </body>
  <script src = "<%=request.getContextPath() %>/jq/jquery.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript">
 
    function add(id){
        var args={goodsId:id};
    	 $.ajax({
   	        url:"<%=basePath%>order/addToTrolley.do",
   	        type:"post",
   	        dataType:"json",  
   	        async : true,
   	        data:args,
   	        success:function(result){
   	        	   if(result==1){
 	  	          	alert("已加入购物车");
   	        	   }else{
   	        		alert("加入失败");
   	        	   }
   	        }
   	    });
    }
    
    $("#findBtn").click(function(){
    	 $("#form1").attr("action","demo/queryShowDemo.do");
    	 $("#form1").submit();   
     })
    
  </script>
 
</html>
