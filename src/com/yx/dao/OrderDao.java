package com.yx.dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.yx.pojo.Order;

public interface OrderDao {

	int addOrder(Order order,Connection conn) throws SQLException;

	int modifyOrder(Order order,Connection conn) throws SQLException;

	Order findById(String orderId);
}
