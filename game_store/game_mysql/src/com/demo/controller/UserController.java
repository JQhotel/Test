package com.demo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entity.TUser;
import com.demo.service.UserService;
import com.demo.util.NewPage;
import com.demo.util.Page;


@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	@RequestMapping("queryUsers.do")
	public String query(ModelMap map,Page page,String findname) throws Exception{
		     if(page==null){
		  	   page=new Page();
		     }
		     if(findname==null){
		  	   findname="";
		     }
		     page.setSize(userService.queryUsersCount(findname));
	         if(page.getSize()>0){
		  	   page.setPagecount(page.getPagecount());
		  	   if(page.getPageindex()<=0){
		  		   page.setPageindex(1);
		  	   }
		  	   if(page.getPageindex()>page.getPagecount()){
		  		   page.setPageindex(page.getPagecount());
		  	   }	
	         }
			 List<TUser> list = userService.getAllUser(page,findname);
			 map.put("items", list);
		 	 return "/userMgr.jsp";
	}	
	@RequestMapping("toSignUp.do")
	public String toSignUp(ModelMap map) throws Exception{
		return "/signUp.jsp";
	}
	@RequestMapping("toUserMgr.do")
	public String toUserMgr(ModelMap map) throws Exception{
		return "/userMgr.jsp";
	}
	@RequestMapping("toSignIn.do")
	public String toSignIn(ModelMap map) throws Exception{
		return "/signIn.jsp";
	}		
	@RequestMapping("toAddUser.do")
	public String toAddUser(ModelMap map) throws Exception{
		return "/addUser.jsp";
	}		
	@RequestMapping("toUpdUser.do")
	public String toUpdUser(ModelMap map,TUser tuser) throws Exception{
		TUser user = userService.getOneUserById(tuser.getId());
		map.put("user", user);
		return "/updUser.jsp";
	}	
	@RequestMapping("delUser.do")
	public String delUser(ModelMap map,TUser tuser) throws Exception{
		userService.delOneUserById(tuser.getId());
		return "redirect:queryUsers.do";
	}		
	
	@RequestMapping("signUp.do")
	public String signUp( @ModelAttribute("user") TUser user,ModelMap map) throws Exception{
		int count = userService.queryCountByLoginName(user.getLoginName());
		if(count>0) {
			map.put("errorMsg", "此用户已被使用");
			return "/signUp.jsp";
		}else {
			userService.addUser(user);
//			return "/signIn.jsp";
			return "redirect:toSignIn.do";
			
		}
	}	
	@RequestMapping("addUser.do")
	public String addUser( @ModelAttribute("user") TUser user,ModelMap map) throws Exception{
		int count = userService.queryCountByLoginName(user.getLoginName());
		if(count>0) {
			map.put("errorMsg", "此用户名被使用");
			return "/addUser.jsp";
		}else {
			userService.addUser(user);
			 return "redirect:queryUsers.do";
		}
	}	
	
	@RequestMapping("updUser.do")
	public String updUser( @ModelAttribute("user") TUser user,ModelMap map) throws Exception{
		if(!user.getOldLoginName().equals(user.getLoginName())) {
			int count = userService.queryCountByLoginName(user.getLoginName());
			if(count>0) {
				map.put("errorMsg", "此用户名被使用");
				return "/updUser.jsp";
			}else {
				userService.updUser(user);
				 return "redirect:queryUsers.do";
			}			
		}else {
			userService.updUser(user);
			 return "redirect:queryUsers.do";
		}

	}		
	
	@RequestMapping("logOut.do")
	public String logOut(HttpServletRequest req) throws Exception{
		req.getSession().removeAttribute("userId");		
		req.getSession().removeAttribute("loginName");
		return "/signIn.jsp";
	}		
	
	@RequestMapping("signIn.do")
	public String signIn( @ModelAttribute("user") TUser user,ModelMap map,HttpServletRequest req) throws Exception{
		user= userService.signIn(user);
		if(user==null) {
			map.put("errorMsg", "用户名或者密码错误");
			return "/signIn.jsp";
		}else {
			TUser user0 = userService.signIn(user);
			req.getSession().setAttribute("loginName", user0.getLoginName());
			req.getSession().setAttribute("userId", user0.getId());
			return "redirect:/demo/queryShowDemo.do";
		}
	}	
	
	@RequestMapping("toChangePassword.do")
	public String toChangePassword( ModelMap map,HttpServletRequest req) throws Exception{
		int userId = (int) req.getSession().getAttribute("userId");
		TUser user = userService.getOneUserById(userId);
		map.put("user", user);
		return "/changePassword.jsp";		
	}	
	@RequestMapping("changePassword.do")
	public String changePassword( @ModelAttribute("user") TUser user,HttpServletRequest req) throws Exception{
		userService.updPassword(user);
		req.getSession().removeAttribute("loginName");
		req.getSession().removeAttribute("userId");		
		return "/signIn.jsp";
	}		
	
}
