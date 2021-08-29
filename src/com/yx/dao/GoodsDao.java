package com.yx.dao;

import java.util.List;

import com.yx.pojo.Goods;
import com.yx.util.PageModel;

public interface GoodsDao {

	PageModel<Goods> findByPage(int pageNo,int pageSize,Integer cateId,String state);
	
	List<Goods> findByCateId(Integer cateId,String state);
	
	Goods findById(Integer goodsId);
}
