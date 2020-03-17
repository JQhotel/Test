package com.demo.mapper.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.demo.entity.TUser;
import com.demo.mapper.UserDao;
import com.demo.util.NewPage;
import com.demo.util.Page;

@Repository("userDao")
public class UserDaoImpl implements UserDao{
	@Resource
	private SqlSessionFactory sqlSessionFactory;
	@Override
	public List<TUser> queryUsers(Page page,String findname) {
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
		 List<TUser> list = session.selectList("usermap.queryUsers",map);
		 return list;
	}
	public int queryUsersCount(String findname) {
	     SqlSession session = sqlSessionFactory.openSession();
	     Map map=new HashMap();  
		 map.put("findname", findname);
	     int count = session.selectOne("usermap.queryUsersCount", map);
	  	 return count;
	}

	@Override
	public void adduser(TUser user) {
	     SqlSession session = sqlSessionFactory.openSession();
         session.insert("usermap.adduser", user);
         session.commit();
	}
	@Override
	public void upduser(TUser user) {
	     SqlSession session = sqlSessionFactory.openSession();
         session.update("usermap.upduser", user);
         session.commit();
	}	
	public void updPassword(TUser user) {
	    SqlSession session = sqlSessionFactory.openSession();
        session.update("usermap.updPassword", user);
        session.commit();		
	}

	@Override
	public int queryCountByLoginName(String loginName) {
	     SqlSession session = sqlSessionFactory.openSession();
	     int count = session.selectOne("usermap.queryCountByLoginName", loginName);
	  	 return count;
	}

	@Override
	public List<TUser> signIn(TUser user) {
	     SqlSession session = sqlSessionFactory.openSession();
	     List<TUser> tusers = session.selectList("usermap.signIn", user);
		 return tusers;
	}
	@Override
	public TUser getOneUserById(int id) {
	     SqlSession session = sqlSessionFactory.openSession();
	     TUser uesr = session.selectOne("usermap.getOneUserById", id);
		 return uesr;
	}
	public void delOneUserById(int id) {
		 SqlSession session = sqlSessionFactory.openSession();
		 session.delete("usermap.delOneUserById", id);
	}
}
