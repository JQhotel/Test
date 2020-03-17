package com.demo.util;

public class Page {
   private int pageindex=1;
   private int size;
   private int pagesize=5;
   private int pagecount;
public int getPageindex() {
	return pageindex;
}
public void setPageindex(int pageindex) {
	this.pageindex = pageindex;
}
public int getSize() {
	return size;
}
public void setSize(int size) {
	this.size = size;
}
public int getPagesize() {
	return pagesize;
}
public void setPagesize(int pagesize) {
	this.pagesize = pagesize;
}
public int getPagecount() {
	 return size%pagesize==0?size/pagesize:size/pagesize+1;
}
public void setPagecount(int pagecount) {
	this.pagecount = pagecount;
}
   
}
