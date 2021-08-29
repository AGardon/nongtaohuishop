package com.yx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.yx.pojo.OrderItem;

public interface OrderItemDao {

	int addOrderItem(OrderItem orderItem,Connection conn) throws SQLException;

	List<OrderItem> listByOrderId(String orderId);
}
