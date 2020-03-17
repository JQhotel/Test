package com.demo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.entity.TUser;
import com.demo.mapper.UserDao;
import com.demo.service.UserService;
import com.demo.util.NewPage;
import com.demo.util.Page;

@Service("userService")
public class UserServiceImpl  implements UserService{
	@Resource
	private UserDao userDao;
	@Override
	public List<TUser> getAllUser(Page page,String findname) {
		List<TUser> queryUsers = userDao.queryUsers(page,findname);
		return queryUsers;
	}
	public int queryUsersCount(String findname) {
		int count = userDao.queryUsersCount(findname);
		return count;
	}
   public int queryCountByLoginName(String loginName) {
	   return userDao.queryCountByLoginName(loginName);
   }
   public void addUser(TUser user) {
	   user.setRoleType(1); 
	   userDao.adduser(user);
   }
   public TUser signIn(TUser user) {
	    List<TUser> tusers = userDao.signIn(user);
	    if(tusers.size()==0) {
	    	return null;
	    }else {
	    	return tusers.get(0);
	    }
   }
   public TUser getOneUserById(Integer id) {
	   return userDao.getOneUserById(id);
   }
   public void updUser(TUser user) {
	    userDao.upduser(user);
   }
   public void delOneUserById(Integer id) {
	    userDao.delOneUserById(id);
   }
	@Override
	public void updPassword(TUser user) {
		userDao.updPassword(user);
	}

}
