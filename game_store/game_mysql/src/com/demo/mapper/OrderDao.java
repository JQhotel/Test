package com.demo.mapper;

import java.util.List;

import com.demo.entity.TComment;
import com.demo.entity.TOrder;
import com.demo.util.Page;

public interface OrderDao {
	public void addOrder(TOrder order);
    public List<TOrder> queryOrders(Page page,String findname);
    public int queryOrdersCount(String findname);
    public List<TOrder> queryMyOrders(Page page,String findname,Integer userId);
    public int queryMyOrdersCount(String findname,Integer userId);   
    public void addTrolley(Integer userId,Integer vegetablesId);
    public void delTrolley(Integer userId,Integer vegetablesId);
    public void delAllTrolley(Integer userId); 
    public List<Integer>  selectVegetablesByUserId(Integer userId);
    public TOrder getOrderById(Integer orderId);
    public void updOrderById(TOrder order);
    public void delOrderById(Integer orderId);
    public void setReasonByOrderId(TOrder order);
    public void setFeedbackByOrderId(TOrder order);
    public void setStatusByOrderId(Integer orderId,Integer status);
    
    public void addComment(TComment comment);
    public int getCommentCountByGoodsId(int goodsId);
    public List<TComment> getCommentByGoodsId(Page page,Integer goodsId);
    public void delCommentById(int id);
    
    
}
