package com.yx.pojo;

public class Cart {

	private String cid;
	private Integer goodsId;
	private Integer amount;
	private Integer sumMoney;
	private String userId;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(Integer sumMoney) {
		this.sumMoney = sumMoney;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
