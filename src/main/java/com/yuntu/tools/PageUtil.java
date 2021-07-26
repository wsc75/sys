package com.yuntu.tools;

import java.util.List;

public class PageUtil<T> {
	//5个属性
	private int pageIndex=1;//当前页码 4.从前台页面传入
	private int pageSize =10;//页面大小 2.设置页面大小
	private int counts = 0;  //总条数 1.直接从数据库获取
	private int pageCount =0; //总页数 3.设置页面大小的同时顺便把值给赋了（只要有总条数和页面大小就能算出来）获取值的方法，写在SetPagesize里面
	private List<T> lists;//当前页数据
	
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		//算pagecount的值
		//两种情况
		//1.总条数与页大小的整除
		//2.总条数与页面大小不整除
		if (this.counts%this.pageSize==0){
			pageSize=counts/pageSize;
		}else {
			pageSize=(counts/pageSize)+1;
		}
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
		if(counts>0){//确保有数据
			if(counts%pageSize==0){//判断是否整除
				pageCount=counts/pageSize;//总页数=总数/页大小
			}else{
				pageCount=(counts/pageSize)+1;//总页数=总数/页大小+1
			}
		}
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public List<T> getLists() {
		return lists;
	}
	public void setLists(List<T> lists) {
		this.lists = lists;
	}

	@Override
	public String toString() {
		return "PageUtil{" +
				"pageIndex=" + pageIndex +
				", pageSize=" + pageSize +
				", counts=" + counts +
				", pageCount=" + pageCount +
				", lists=" + lists +
				'}';
	}
}
