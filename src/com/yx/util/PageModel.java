package com.yx.util;

import java.util.List;

public class PageModel<T> {

	private int pageNo;
	private int pageSize;
	private int totalRecords;
	private List<T> list;
	
	public int nowPage() {
		return pageNo;
	}
	
	public int totalPage() {
		return (totalRecords + pageSize - 1) / pageSize;
	}
	
	public int pervPage() {
		return pageNo == 1 ? 1 : pageNo - 1;
	}
	
	public int nextPage() {
		return pageNo == totalPage() ? totalPage() : pageNo + 1;
	}
	
	public int endPage() {
		return totalPage();
	}
	
	public int topPage() {
		return 1;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
