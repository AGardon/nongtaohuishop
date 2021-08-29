package com.yx.dao;

import com.yx.pojo.User;

public interface UserDao {

	User login(String userName,String password);
}
