package com.demo.mapper;

import java.util.List;


import com.demo.entity.TUser;
import com.demo.util.NewPage;
import com.demo.util.Page;



public interface UserDao {
  public List<TUser> queryUsers(Page page,String findname);
  public int queryUsersCount(String findname);
  public void adduser(TUser user);
  public void upduser(TUser user);
  public void delOneUserById(int id);
  public void updPassword(TUser user);
  public int queryCountByLoginName(String loginName);
  public  List<TUser> signIn(TUser user);
  public TUser getOneUserById(int id);
  
}
