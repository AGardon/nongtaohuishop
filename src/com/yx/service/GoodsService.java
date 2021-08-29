package com.yx.service;

import java.util.List;

import com.yx.dao.GoodsDao;
import com.yx.pojo.Goods;
import com.yx.util.BeanFactory;
import com.yx.util.PageModel;

public class GoodsService {

	private GoodsDao goodsDao;

	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}
	
	public List<Goods> findByCateId(String cateId){
		Integer categoryId = Integer.parseInt(cateId);
		return goodsDao.findByCateId(categoryId, "∆Ù”√");
	}

	public PageModel<Goods> findByPage(String page,String size,String cateId){
		Integer categoryId = Integer.parseInt(cateId);
		int pageNo = 1;
		int pageSize = 12;
		if(page != null || "".equals(page)) {
			pageNo = Integer.parseInt(page);
		}
		if(size != null || "".equals(size)) {
			pageSize = Integer.parseInt(size);
		}
		return goodsDao.findByPage(pageNo, pageSize, categoryId, "∆Ù”√");
	}

	public Goods findById(String gid) {
		Integer goodsId = Integer.parseInt(gid);
		return goodsDao.findById(goodsId);
	}
}
