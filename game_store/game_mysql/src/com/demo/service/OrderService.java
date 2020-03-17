package com.demo.service;

import java.util.List;

import com.demo.entity.TComment;
import com.demo.entity.TDemo;
import com.demo.entity.TOrder;
import com.demo.util.Page;

public interface OrderService {
   public void addOrdder(TOrder order);
   public List<TOrder> queryOrders(Page page,String findname);
   public int queryOrdersCount(String findname);   
   public List<TOrder> queryMyOrders(Page page,String findname,Integer userId);
   public int queryMyOrdersCount(String findname,Integer userId);    
   public void addTrolley(Integer userId,Integer goodsId);
   public void delTrolley(Integer userId,Integer goodsId);
   public Integer getPayMoneyCount(List<TDemo> list);
   public void delAllTrolley(Integer userId);
   public void buyAllGoods(Integer userId,String phoneNum,String qqNum,int[]buyNum);
   public TOrder getOrderById(Integer orderId);
   public void delOrderById(Integer orderId);
   public void setReasonByOrderId(TOrder order);
   public void setFeedbackByOrderId(TOrder order);
   public void receive(Integer orderId);
   public void updOrderById(TOrder order);
   
   public void addComment(TComment comment);
   public int getCommentCountByGoodsId(int goodsId);
   public List<TComment> getCommentByGoodsId(Page page,Integer goodsId);
   public void delCommentById(int id);
   
}
