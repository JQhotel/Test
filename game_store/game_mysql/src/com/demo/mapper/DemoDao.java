package com.demo.mapper;

import java.util.List;

import com.demo.entity.TDemo;
import com.demo.util.Page;

public interface DemoDao {
    public List<TDemo> queryDemos(Page page,String findname,String goodsKind);
    public int queryDemoCount(String findname,String goodsKind);
    public TDemo queryDemoById(int id);
	public void addDemo(TDemo demo);
	public void updDemo(TDemo demo);
	public void deleteDemoById(int id);
	public int queryDemoCountByDemoName(String findname);
    public List<TDemo> queryDemosByUserId(Integer userId);
	
}
