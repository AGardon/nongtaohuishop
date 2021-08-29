package com.yx.service;

import com.yx.dao.UserDao;
import com.yx.pojo.User;
import com.yx.util.BeanFactory;

public class UserService {

	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public User login(String userName,String password) {
		User user = userDao.login(userName, password);
		return user;
	}
}
