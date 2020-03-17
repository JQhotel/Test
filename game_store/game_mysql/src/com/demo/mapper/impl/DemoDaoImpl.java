package com.demo.mapper.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.demo.entity.TDemo;
import com.demo.mapper.DemoDao;
import com.demo.util.Page;
@Repository("demoDao")
public class DemoDaoImpl implements DemoDao{
	@Resource
	private SqlSessionFactory sqlSessionFactory;
 

	@Override
	public List<TDemo> queryDemos(Page page, String findname,String goodsKind) {
		 SqlSession session = sqlSessionFactory.openSession();
		 Map map=new HashMap();  
		 map.put("findname", findname);
		 map.put("goodsKind", goodsKind);
	     int a=(page.getPageindex()-1)*page.getPagesize();
	     if(a>0) {
	    	 a+=1;
	     }
	     int b=(page.getPageindex())*page.getPagesize();
	     map.put("a", a);
	     map.put("b", b);
		 List<TDemo> list = session.selectList("demomap.queryDemos",map);
		 return list;
	}
    public List<TDemo> queryDemosByUserId(Integer userId){
		 SqlSession session = sqlSessionFactory.openSession();
		 List<TDemo> list = session.selectList("demomap.queryDemosByUserId",userId);
		 return list;
    }

	
	@Override
	public TDemo queryDemoById(int id) {
		 SqlSession session = sqlSessionFactory.openSession();
		 TDemo demo = session.selectOne("demomap.queryDemoById",id);
		 return demo;
	}

	@Override
	public int queryDemoCount(String findname,String goodsKind) {
		 SqlSession session = sqlSessionFactory.openSession();
		 Map map=new HashMap();  
		 map.put("findname", findname);
		 map.put("goodsKind", goodsKind);
		 int count = session.selectOne("demomap.queryDemoCount", map);
		 return count;
	}

	@Override
	public void addDemo(TDemo demo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("demomap.addDemo", demo);
		session.commit();
	}

	@Override
	public void updDemo(TDemo demo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("demomap.updDemo", demo);
		session.commit();
	}

	@Override
	public void deleteDemoById(int id) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("demomap.deleteDemoById", id);
		session.commit();	
	}

	@Override
	public int queryDemoCountByDemoName(String findname) {
		 SqlSession session = sqlSessionFactory.openSession();
		 Map map=new HashMap();  
		 map.put("findname", findname);
		 int count = session.selectOne("demomap.queryDemoCountByDemoName", map);
		 return count;
	}


}
