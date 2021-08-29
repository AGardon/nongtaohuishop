package com.yx.pojo;

import java.util.Date;

public class Order {

	private String orderId;
	private Date orderDate;
	private Integer sumMoney;
	private Integer sumNet;
	private String state;
	private String userId;
	private String name;
	private String tel;
	private String address;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Integer getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(Integer sumMoney) {
		this.sumMoney = sumMoney;
	}
	public Integer getSumNet() {
		return sumNet;
	}
	public void setSumNet(Integer sumNet) {
		this.sumNet = sumNet;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
