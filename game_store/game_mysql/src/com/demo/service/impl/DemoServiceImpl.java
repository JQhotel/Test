package com.demo.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.demo.entity.TDemo;
import com.demo.mapper.DemoDao;
import com.demo.service.DemoService;
import com.demo.util.Page;

@Service("demoService")
public class DemoServiceImpl implements DemoService {
	@Resource
	private DemoDao demoDao;
	@Override
	public List<TDemo> queryDemos(Page page, String findname,String goodsKind) {
		List<TDemo> querydemo = demoDao.queryDemos(page, findname,goodsKind);
		return querydemo;
	}
	public List<TDemo> queryDemosByUserId(Integer userId){
		List<TDemo> list = demoDao.queryDemosByUserId(userId);
		return list;
	}
	public  TDemo queryDemoById(int id) {
		TDemo demo = demoDao.queryDemoById(id);
		return demo;
	}
	@Override  
	public int queryDemoCount(String findname,String goodsKind) {
		// TODO Auto-generated method stub
		return demoDao.queryDemoCount(findname,goodsKind);
	}
	public int queryDemoCountByName(String findname) {
		return demoDao.queryDemoCountByDemoName(findname);
	}
	public void addDemo(TDemo demo,MultipartFile demoImgFile) {
	    String imgPath = this.saveImg(demoImgFile);
        demo.setImgPath(imgPath);
        demoDao.addDemo(demo);				
	}
	public void updDemo(TDemo demo,MultipartFile demoImgFile) {
		if(demoImgFile.getOriginalFilename()!=null&&demoImgFile.getOriginalFilename()!="") {
		    String imgPath = this.saveImg(demoImgFile);
		    demo.setImgPath(imgPath);
		}
        demoDao.updDemo(demo);		
    }	
	public String saveImg(MultipartFile demoImgFile) {
		    String fileName = demoImgFile.getOriginalFilename();
	        String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	        String localFileName = System.currentTimeMillis() + fileSuffix;
	        String dirPath="D:\\images";
	        String filePath = dirPath + File.separator + localFileName;;
	        File localFile = new File(filePath);
	        File imagePath = new File(dirPath);
	        if (!imagePath.exists()) {
	            imagePath.mkdirs();
	        }
	        try {
				demoImgFile.transferTo(localFile);
				return localFileName;
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        return "";
	}
	@Override
	public void deleteDemoById(int id) {
		 demoDao.deleteDemoById(id);
	}
 
}
