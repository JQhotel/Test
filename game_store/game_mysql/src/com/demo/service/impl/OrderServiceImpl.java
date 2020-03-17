package com.demo.service.impl;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.entity.TOrder;
import com.demo.entity.TComment;
import com.demo.entity.TDemo;
import com.demo.mapper.DemoDao;
import com.demo.mapper.OrderDao;
import com.demo.service.OrderService;
import com.demo.util.Page;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Resource
	private DemoDao demoDao;
	@Resource
	private OrderDao orderDao;
	@Override
	public void addOrdder(TOrder order) {
		order.setCreateTime(new Date());
		//status 1已支付   2申请退款  3退款通过 4退款不通过
		order.setStatus(1);
		orderDao.addOrder(order);
	}
	@Override
	public List<TOrder> queryOrders(Page page, String findname) {
		// TODO Auto-generated method stub
		List<TOrder> list = orderDao.queryOrders(page, findname);
		list.forEach(t->{
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
			 String createTimeStr = formatter.format(t.getCreateTime());
			 t.setCreateTimeStr(createTimeStr);
		});
		  
		return list;
	}
	@Override
	public int queryOrdersCount(String findname) {
		// TODO Auto-generated method stub
		return orderDao.queryOrdersCount(findname);
	}
	@Override
	public List<TOrder> queryMyOrders(Page page, String findname, Integer userId) {
		List<TOrder> list = orderDao.queryMyOrders(page, findname, userId);
		list.forEach(t->{
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
			 String createTimeStr = formatter.format(t.getCreateTime());
			 t.setCreateTimeStr(createTimeStr);
		});		
		return list;
	}
	@Override
	public int queryMyOrdersCount(String findname, Integer userId) {
		return orderDao.queryMyOrdersCount(findname,userId);
	}
	public void buyAllGoods(Integer userId,String phoneNum,String qqNum,int[]buyNum) {
		List<TDemo> goods = demoDao.queryDemosByUserId(userId);
		for(int i=0;i<goods.size();i++) {
			Integer goodsId = goods.get(i).getId();
			Integer price = goods.get(i).getPrice();
			TOrder order = new TOrder();
			order.setGoodsId(goodsId);
			order.setUserId(userId);
			order.setCreateTime(new Date());
			order.setPhoneNum(phoneNum);
			order.setStatus(1);
			order.setBuyNum(buyNum[i]);
			order.setPrice(price);
			order.setQqNum(qqNum);
			order.setPayMoney(price*buyNum[i]);
			orderDao.addOrder(order);
		}
		orderDao.delAllTrolley(userId);
	}

	public void addTrolley(Integer userId,Integer goodsId) {
		orderDao.addTrolley(userId, goodsId);
	}
	public void delTrolley(Integer userId,Integer goodsId) {
		orderDao.delTrolley(userId, goodsId);
	}	
	public Integer getPayMoneyCount(List<TDemo> list) {
		Integer count=0;
		for(int i=0;i<list.size();i++) {
			count+=list.get(i).getPrice();
		}
		return count;
	}
	public void delAllTrolley(Integer userId) {
		orderDao.delAllTrolley(userId);
	}
	public TOrder getOrderById(Integer orderId) {
		return orderDao.getOrderById(orderId);
	}
	@Override
	public void updOrderById(TOrder order) {
		// TODO Auto-generated method stub
		order.setPayMoney(order.getBuyNum()*order.getPrice());
		orderDao.updOrderById(order);
	}
	public void delOrderById(Integer orderId) {
		orderDao.delOrderById(orderId);
	}
	public void setReasonByOrderId(TOrder order) {
		order.setStatus(2);
		orderDao.setReasonByOrderId(order); 
	}
	public void setFeedbackByOrderId(TOrder order) {
		orderDao.setFeedbackByOrderId(order);
	}
	public void receive(Integer orderId) {
		orderDao.setStatusByOrderId(orderId, 5);
	}
	@Override
	public void addComment(TComment comment) {
		// TODO Auto-generated method stub
		orderDao.addComment(comment);
	}
	@Override
	public int getCommentCountByGoodsId(int goodsId) {
		// TODO Auto-generated method stub
		return orderDao.getCommentCountByGoodsId(goodsId);
	}
	@Override
	public List<TComment> getCommentByGoodsId(Page page, Integer goodsId) {
		List<TComment> list = orderDao.getCommentByGoodsId(page, goodsId);
		list.forEach(t->{
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
			 String createTimeStr = formatter.format(t.getCreateTime());
			 t.setCreateTimeStr(createTimeStr);
		  });
		return list;
	}
	@Override
	public void delCommentById(int id) {
		// TODO Auto-generated method stub
		orderDao.delCommentById(id);
	}
	 
	
}
