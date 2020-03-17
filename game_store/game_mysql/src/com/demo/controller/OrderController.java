package com.demo.controller;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entity.TOrder;
import com.demo.entity.TComment;
import com.demo.entity.TDemo;
import com.demo.entity.TUser;
import com.demo.service.DemoService;
import com.demo.service.OrderService;
import com.demo.service.UserService;
import com.demo.util.Page;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource
	private DemoService demoService;
	@Resource
	private OrderService orderService;
	@Resource
	private UserService userService;
	@RequestMapping("toBuyGoods.do")
	public String toBuyGoods(ModelMap map,TDemo demo,HttpServletRequest req) throws Exception{
	    demo = demoService.queryDemoById(demo.getId());
		map.put("demo", demo);
	    Integer userId = (Integer) req.getSession().getAttribute("userId");
	    TUser user = userService.getOneUserById(userId);
	    map.put("user", user);
		return "/buy.jsp";
	}	
	
	@RequestMapping("addOrder.do")
	public String addOrder(ModelMap map,TOrder order,HttpServletRequest req) throws Exception{
	    Integer userId = (Integer) req.getSession().getAttribute("userId");
	    order.setUserId(userId);
		orderService.addOrdder(order);
		return "redirect:/demo/queryShowDemo.do";
	}	
	
	
	@RequestMapping("queryOrders.do")
	public String queryOrders(ModelMap map,Page page,String findname,HttpServletRequest req) throws Exception{
		 if(page==null){
	  	   page=new Page();
	     }
	     if(findname==null){
	  	   findname="";
	     }
	     page.setSize(orderService.queryOrdersCount(findname));
         if(page.getSize()>0){
	  	   page.setPagecount(page.getPagecount());
	  	   if(page.getPageindex()<=0){
	  		   page.setPageindex(1);
	  	   }
	  	   if(page.getPageindex()>page.getPagecount()){
	  		   page.setPageindex(page.getPagecount());
	  	   }	
         }
         List<TOrder> list = orderService.queryOrders(page, findname);
		 map.put("items", list);
	 	 return "/orderMgr.jsp";
	}	
	@RequestMapping("queryMyOrders.do")
	public String queryMyOrders(ModelMap map,Page page,String findname,HttpServletRequest req) throws Exception{
		 if(page==null){
	  	   page=new Page();
	     }
	     if(findname==null){
	  	   findname="";
	     }
	     Integer  userId = (Integer) req.getSession().getAttribute("userId");
	     page.setSize(orderService.queryMyOrdersCount(findname,userId));
         if(page.getSize()>0){
	  	   page.setPagecount(page.getPagecount());
	  	   if(page.getPageindex()<=0){
	  		   page.setPageindex(1);
	  	   }
	  	   if(page.getPageindex()>page.getPagecount()){
	  		   page.setPageindex(page.getPagecount());
	  	   }	
         }
         List<TOrder> list = orderService.queryMyOrders(page, findname,userId);
		 map.put("items", list);
	 	 return "/myOrders.jsp";
	}
	@RequestMapping("queryMyTrolly.do")
	public String queryMyTrolly(ModelMap map,HttpServletRequest req) throws Exception{
		 Integer userId = (Integer)req.getSession().getAttribute("userId");
         List<TDemo> list =demoService.queryDemosByUserId(userId);
         Integer payMoneyCount = orderService.getPayMoneyCount(list);
 	     TUser user = userService.getOneUserById(userId);
 	     map.put("user", user);         
		 map.put("items", list);
		 map.put("totalMoney", payMoneyCount);
		 map.put("total", list.size());
	 	 return "/myTrolly.jsp";
	}	
	@RequestMapping(value = "/addToTrolley.do", method = RequestMethod.POST)
	@ResponseBody
	public String addToTrolley(Integer goodsId,HttpServletRequest req){
		System.out.println("进入addToTrolley");
		System.out.println("goodsId"+goodsId);
		Integer userId = (Integer) req.getSession().getAttribute("userId");
		orderService.addTrolley(userId, goodsId);
	    return "1";
	}	
	@RequestMapping("delTrolly.do")
	public String delTrolly(ModelMap map,HttpServletRequest req,Integer goodsId) throws Exception{
		 Integer userId = (Integer)req.getSession().getAttribute("userId");
		 orderService.delTrolley(userId, goodsId);
			return "redirect:queryMyTrolly.do";
	}
	@RequestMapping("buyAllDemos.do")
	public String buyAllDemos(ModelMap map,HttpServletRequest req,String phoneNum,String qqNum,int[] buyNum) throws Exception{
		Integer userId = (Integer)req.getSession().getAttribute("userId");
        orderService.buyAllGoods(userId, phoneNum, qqNum,buyNum);
		return "redirect:queryMyTrolly.do";
	}	
	
	@RequestMapping("delAllTrolly.do")
	public String delAllTrolly(ModelMap map,HttpServletRequest req) throws Exception{
		 Integer userId = (Integer)req.getSession().getAttribute("userId");
		 orderService.delAllTrolley(userId);
		 return "redirect:queryMyTrolly.do";
	}	
	
	@RequestMapping("toUpdMyOrder.do")
	public String toUpdMyOrder(ModelMap map,Integer orderId) throws Exception{
		TOrder order = orderService.getOrderById(orderId);
		map.put("order", order);
	    TDemo demo = demoService.queryDemoById(order.getGoodsId());
		map.put("demo", demo);		
		return "/updMyOrder.jsp";
	}	
	@RequestMapping("updMyOrder.do")
	public String updMyOrder(ModelMap map,TOrder order) throws Exception{
		orderService.updOrderById(order);
		 return "redirect:queryMyOrders.do";
	}
	
	@RequestMapping("toUpdOrder.do")
	public String toUpdOrder(ModelMap map,Integer orderId) throws Exception{
		TOrder order = orderService.getOrderById(orderId);
		map.put("order", order);
	    TDemo demo = demoService.queryDemoById(order.getGoodsId());
		map.put("demo", demo);		
		return "/updOrder.jsp";
	}	
	@RequestMapping("updOrder.do")
	public String updOrder(ModelMap map,TOrder order) throws Exception{
		orderService.updOrderById(order);
		 return "redirect:queryOrders.do";
	}	
	
	@RequestMapping("delOrder.do")
	public String delOrder(ModelMap map,Integer orderId) throws Exception{
		 orderService.delOrderById(orderId);
		 return "redirect:queryOrders.do";
	}		
	@RequestMapping("toRefund.do")
	public String toRefund(ModelMap map,Integer orderId) throws Exception{
		TOrder order = orderService.getOrderById(orderId);
		map.put("order", order);
	    TDemo demo = demoService.queryDemoById(order.getGoodsId());
		map.put("demo", demo);		
		return "/refund.jsp";
	}
	@RequestMapping("toAudit.do")
	public String toAudit(ModelMap map,Integer orderId) throws Exception{
		TOrder order = orderService.getOrderById(orderId);
		map.put("order", order);
	    TDemo demo = demoService.queryDemoById(order.getGoodsId());
		map.put("demo", demo);		
		return "/audit.jsp";
	}	
	
	@RequestMapping("applyRefund.do")
	public String applyRefund(ModelMap map,Integer orderId,String reason) throws Exception{
		 TOrder order = new TOrder();
		 order.setId(orderId);
		 order.setReason(reason);
		 orderService.setReasonByOrderId(order);
		 return "redirect:queryMyOrders.do";
	}	
	
	@RequestMapping("audit.do")
	public String audit(ModelMap map,TOrder order) throws Exception{
		 orderService.setFeedbackByOrderId(order);
		 return "redirect:queryOrders.do";
	}		
	
	@RequestMapping("receive.do")
	public String receive(ModelMap map,Integer orderId) throws Exception{
		orderService.receive(orderId);
		return "redirect:queryMyOrders.do";
	}
	
	@RequestMapping("toAddComment.do")
	public String toAddComment(ModelMap map,Integer orderId) throws Exception{
		TOrder order = orderService.getOrderById(orderId);
		map.put("order", order);
	    TDemo demo = demoService.queryDemoById(order.getGoodsId());
		map.put("demo", demo);		
		return "/addComment.jsp";
	}	
	
	//增加评论
	@RequestMapping("addComment.do")
	public String addComment(ModelMap map,TComment Comment,HttpServletRequest req) throws Exception{
	    Integer userId = (Integer) req.getSession().getAttribute("userId");
	    Comment.setUserId(userId);
	    Comment.setCreateTime(new Date());
 		orderService.addComment(Comment);
		 return "redirect:queryMyOrders.do";
	}
	
	@RequestMapping("toShowComment.do")
	public String toShowComment(ModelMap map,Integer goodsId,Page page) throws Exception{
	    TDemo demo = demoService.queryDemoById(goodsId);
		map.put("demo", demo);	
		map.put("goodsId", goodsId);	
		if(page==null){
     	   page=new Page();
		}
		int size = orderService.getCommentCountByGoodsId(goodsId);
	    page.setSize(size);
	    if(page.getSize()>0){
		  	   page.setPagecount(page.getPagecount());
		  	   if(page.getPageindex()<=0){
		  		   page.setPageindex(1);
		  	   }
		  	   if(page.getPageindex()>page.getPagecount()){
		  		   page.setPageindex(page.getPagecount());
		  	   }	
	    }
		List<TComment> comments = orderService.getCommentByGoodsId(page,goodsId);
		map.put("comments", comments);	
		map.put("page", page);	
		return "/showGoodsComments.jsp";
	}	
	@RequestMapping("toCommentMgr.do")
	public String toCommentMgr(ModelMap map,Integer goodsId,Page page) throws Exception{
	    TDemo demo = demoService.queryDemoById(goodsId);
		map.put("demo", demo);	
		map.put("goodsId", goodsId);	
		if(page==null){
     	   page=new Page();
		}
	    page.setSize(orderService.getCommentCountByGoodsId(goodsId));
	    if(page.getSize()>0){
		  	   page.setPagecount(page.getPagecount());
		  	   if(page.getPageindex()<=0){
		  		   page.setPageindex(1);
		  	   }
		  	   if(page.getPageindex()>page.getPagecount()){
		  		   page.setPageindex(page.getPagecount());
		  	   }	
	    }
		List<TComment> Comments = orderService.getCommentByGoodsId(page, goodsId);
		map.put("Comments", Comments);
		map.put("page", page);	
		
		return "/commentMgr2.jsp";
	}
	@RequestMapping("delComments.do")
	public String delComments(ModelMap map,Integer id,Integer goodsId) throws Exception{
		 orderService.delCommentById(id);
		 return "redirect:toCommentMgr.do?goodsId="+goodsId;
	}
	
	
}
