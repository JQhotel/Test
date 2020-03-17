package com.demo.mapper.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.demo.entity.TOrder;
import com.demo.entity.TComment;
import com.demo.entity.TDemo;
import com.demo.mapper.OrderDao;
import com.demo.util.Page;
@Repository("orderDao")
public class OrderDaoImpl implements OrderDao{
	@Resource
	private SqlSessionFactory sqlSessionFactory;

	@Override
	public void addOrder(TOrder order) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("ordermap.addOrder", order);
		session.commit();
	}

	@Override
	public List<TOrder> queryOrders(Page page, String findname) {
		 SqlSession session = sqlSessionFactory.openSession();
		 Map map=new HashMap();  
		 map.put("findname", findname);
	     int a=(page.getPageindex()-1)*page.getPagesize();
	     if(a>0) {
	    	 a+=1;
	     }
	     int b=(page.getPageindex())*page.getPagesize();
	     map.put("a", a);
	     map.put("b", b);
		 List<TOrder> list = session.selectList("ordermap.queryOrders",map);
		 return list;
	}

	@Override
	public int queryOrdersCount(String findname) {
		 SqlSession session = sqlSessionFactory.openSession();
		 Map map=new HashMap();  
		 map.put("findname", findname);
		 int count = session.selectOne("ordermap.queryOrdersCount", map);
		 return count;
	}

	@Override
	public List<TOrder> queryMyOrders(Page page, String findname, Integer userId) {
		 SqlSession session = sqlSessionFactory.openSession();
		 Map map=new HashMap();  
		 map.put("findname", findname);
		 map.put("userId", userId);		 
	     int a=(page.getPageindex()-1)*page.getPagesize();
	     if(a>0) {
	    	 a+=1;
	     }
	     int b=(page.getPageindex())*page.getPagesize();
	     map.put("a", a);
	     map.put("b", b);
		 List<TOrder> list = session.selectList("ordermap.queryMyOrders",map);
		 return list;
	}

	@Override
	public int queryMyOrdersCount(String findname, Integer userId) {
		 SqlSession session = sqlSessionFactory.openSession();
		 Map map=new HashMap();  
		 map.put("findname", findname);
		 map.put("userId", userId);		 
		 int count = session.selectOne("ordermap.queryMyOrdersCount", map);
		 return count;
	}
    public void addTrolley(Integer userId,Integer goodsId) {
    	 Map map=new HashMap();  
		 map.put("goodsId", goodsId);
		 map.put("userId", userId);	
		 SqlSession session = sqlSessionFactory.openSession();
		 session.insert("ordermap.addTrolley", map);
    }
    public void delTrolley(Integer userId,Integer goodsId) {
   	     Map map=new HashMap();  
		 map.put("goodsId", goodsId);
		 map.put("userId", userId);	
		 SqlSession session = sqlSessionFactory.openSession();
		 session.delete("ordermap.delTrolley", map);
    }
    public void delAllTrolley(Integer userId) {
		 SqlSession session = sqlSessionFactory.openSession();
		 session.delete("ordermap.delAllTrolley", userId);
    }
    public List<Integer>  selectVegetablesByUserId(Integer userId){
		 SqlSession session = sqlSessionFactory.openSession();    	
		 List<Integer> list = session.selectList("ordermap.selectgoodsIdsByUserId",userId);
		 return list;
    }
    public TOrder getOrderById(Integer orderId) {
		 SqlSession session = sqlSessionFactory.openSession();    	
		 TOrder order = session.selectOne("ordermap.getOrderById", orderId);
		 return order;
    }

	@Override
	public void updOrderById(TOrder order) {
		 SqlSession session = sqlSessionFactory.openSession();    	
		 session.update("ordermap.updOrderById", order);
	}
    public void delOrderById(Integer orderId) {
		 SqlSession session = sqlSessionFactory.openSession();    	
		 session.delete("ordermap.delOrderById", orderId);
    }
    public void setReasonByOrderId(TOrder order) {
		 SqlSession session = sqlSessionFactory.openSession();    	
   	     Map map=new HashMap();  
		 map.put("reason", order.getReason());
		 map.put("status", order.getStatus());
		 map.put("orderId", order.getId());	
		 session.update("ordermap.setReasonByOrderId", map);
    }
    public void setFeedbackByOrderId(TOrder order) {
		 SqlSession session = sqlSessionFactory.openSession();    	
   	     Map map=new HashMap();  
		 map.put("reason", order.getReason());
		 map.put("status", order.getStatus());
		 map.put("feedback", order.getFeedback());	
		 map.put("orderId", order.getId());	
		 session.update("ordermap.setFeedbackByOrderId", map);    	
    }
    public void setStatusByOrderId(Integer orderId,Integer status) {
    	 SqlSession session = sqlSessionFactory.openSession();    	
   	     Map map=new HashMap();  
		 map.put("orderId",orderId);
		 map.put("status", status);   
		 session.update("ordermap.setStatusByOrderId", map);    	
    }

	@Override
	public void addComment(TComment comment) {
		// TODO Auto-generated method stub
   	 SqlSession session = sqlSessionFactory.openSession();    	
   	 session.insert("ordermap.addComment", comment);
	}

	@Override
	public int getCommentCountByGoodsId(int goodsId) {
	   	SqlSession session = sqlSessionFactory.openSession();   
	   	int count = session.selectOne("ordermap.getCommentCountByGoodsId", goodsId);
		return count;
	}

	@Override
	public List<TComment> getCommentByGoodsId(Page page, Integer goodsId) {
   	 SqlSession session = sqlSessionFactory.openSession();
		 Map map=new HashMap();  
		 map.put("goodsId", goodsId);
	     int a=(page.getPageindex()-1)*page.getPagesize();
	     if(a>0) {
	    	 a+=1;
	     }
	     int b=(page.getPageindex())*page.getPagesize();
	     map.put("a", a);
	     map.put("b", b);
		 List<TComment> list = session.selectList("ordermap.getCommentByGoodsId",map);
		 return list;
	}

	@Override
	public void delCommentById(int id) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();    	
		session.delete("ordermap.delCommentById", id);
	}


}
