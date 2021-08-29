package com.yx.service;

import java.util.List;

import com.yx.dao.CateDao;
import com.yx.pojo.Category;
import com.yx.util.BeanFactory;

public class CateService {

	private CateDao cateDao;

	public CateDao getCateDao() {
		return cateDao;
	}

	public void setCateDao(CateDao cateDao) {
		this.cateDao = cateDao;
	}

	
	public List<Category> findall(){
		return cateDao.findall();
	}
}
