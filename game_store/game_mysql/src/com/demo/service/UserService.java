package com.demo.service;

import java.util.List;

import com.demo.entity.TUser;
import com.demo.util.NewPage;
import com.demo.util.Page;

public interface UserService {
   public List<TUser> getAllUser(Page page,String findname);
   public int queryUsersCount(String findname);   
   public int queryCountByLoginName(String loginName);
   public void addUser(TUser user);
   public void updUser(TUser user);
   public TUser signIn(TUser user);
   public TUser getOneUserById(Integer id);
   public void delOneUserById(Integer id);
   public void updPassword(TUser user);
}
