package com.demo.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.demo.entity.TDemo;
import com.demo.util.Page;

public interface DemoService {
   public List<TDemo> queryDemos(Page page,String findname,String goodsKind);
   public  TDemo queryDemoById(int id);
   public int queryDemoCountByName(String findname);
   public int queryDemoCount(String findname,String goodsKind);
   public void addDemo(TDemo demo,MultipartFile demoImgFile);
   public void updDemo(TDemo demo,MultipartFile demoImgFile);   
   public void deleteDemoById(int id);
   public List<TDemo> queryDemosByUserId(Integer userId);

}
