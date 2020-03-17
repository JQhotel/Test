package com.demo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entity.TDemo;
import com.demo.service.DemoService;
import com.demo.util.Page;

@Controller
@RequestMapping("/demo")
public class DemoController {
	@Resource
	private DemoService demoService;
	@RequestMapping("queryDemo.do")
	public String query(ModelMap map,Page page,String findname) throws Exception{
		 if(page==null){
	  	   page=new Page();
	     }
	     if(findname==null){
	  	   findname="";
	     }
	     page.setSize(demoService.queryDemoCount(findname,""));
         if(page.getSize()>0){
	  	   page.setPagecount(page.getPagecount());
	  	   if(page.getPageindex()<=0){
	  		   page.setPageindex(1);
	  	   }
	  	   if(page.getPageindex()>page.getPagecount()){
	  		   page.setPageindex(page.getPagecount());
	  	   }	
         }
         List<TDemo> list = demoService.queryDemos(page, findname,"");
		 map.put("items", list);
	 	 return "/demoMgr.jsp";
	}	
	@RequestMapping("queryShowDemo.do")
	public String queryShowdemo(ModelMap map,Page page,String findname,String goodsKind) throws Exception{
		 if(page==null){
	  	   page=new Page();
	     }
	     if(findname==null){
	  	   findname="";
	     }
	     if(goodsKind==null){
	    	 goodsKind="";
		 }	     
	     page.setPagesize(6);
	     page.setSize(demoService.queryDemoCount(findname,goodsKind));
         if(page.getSize()>0){
	  	   page.setPagecount(page.getPagecount());
	  	   if(page.getPageindex()<=0){
	  		   page.setPageindex(1);
	  	   }
	  	   if(page.getPageindex()>page.getPagecount()){
	  		   page.setPageindex(page.getPagecount());
	  	   }	
         }
         List<TDemo> list = demoService.queryDemos(page, findname,goodsKind);
		 map.put("items", list);
		 map.put("goodsKind", goodsKind);
		 return "/main.jsp";
	}		
	@RequestMapping("toAddDemo.do")
	public String toAdddemo(ModelMap map) throws Exception{
		return "/addDemo.jsp";
	}
	@RequestMapping("toUpdDemo.do")
	public String toUpdDemo(ModelMap map,TDemo demo) throws Exception{
	    demo = demoService.queryDemoById(demo.getId());
		map.put("demo", demo);
		return "/updDemo.jsp";
	}	
	@RequestMapping(value="addDemo.do")
	public String addDemo(ModelMap map,
			@RequestParam(value = "imgFile") MultipartFile demoImgFile,
			TDemo demo ) throws Exception{
		int count = demoService.queryDemoCountByName(demo.getName());
		if(count==0) {
			demoService.addDemo(demo,demoImgFile);
			return "redirect:queryDemo.do";
		}else {
			map.put("errorMsg", "名字重复，请修改");
			return "/addDemo.jsp";
		}
	}
	@RequestMapping(value="updDemo.do")
	public String upddemo(ModelMap map,
			@RequestParam(value = "imgFile",required=false) MultipartFile demoImgFile,
			TDemo demo ) throws Exception{
		if(demo.getOldName().equals(demo.getName())) {
			demoService.updDemo(demo, demoImgFile);
			return "redirect:queryDemo.do";
		}else {
			int count = demoService.queryDemoCountByName(demo.getName());
			if(count==0) {
				demoService.updDemo(demo,demoImgFile);
				return "redirect:queryDemo.do";
			}else {
				map.put("errorMsg", "名字重复，请修改");
				return "/updDemo.jsp";
			}			
		}
	}	
	@RequestMapping("delDemo.do")
	public String delDemo(ModelMap map,int id) throws Exception{
		demoService.deleteDemoById(id);
		return "redirect:queryDemo.do";
	}

}
