package com.yx.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.yx.dao.GoodsDao;
import com.yx.dao.OrderDao;
import com.yx.dao.OrderItemDao;
import com.yx.exception.BuynowException;
import com.yx.pojo.Goods;
import com.yx.pojo.Order;
import com.yx.pojo.OrderItem;
import com.yx.pojo.User;
import com.yx.util.BeanFactory;
import com.yx.util.OrderId;

public class OrderService {

	private OrderDao orderDao;
	private OrderItemDao orderItemDao;
	private GoodsDao goodsDao;

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public OrderItemDao getOrderItemDao() {
		return orderItemDao;
	}

	public void setOrderItemDao(OrderItemDao orderItemDao) {
		this.orderItemDao = orderItemDao;
	}

	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}
	
	public void buyNow(String gid,String num,User user) {
		Integer goodsId = Integer.parseInt(gid);
		Goods goods = goodsDao.findById(goodsId);
		String orderId = OrderId.getOrderId();
		Integer amount = Integer.parseInt(num);
		
		Order order = new Order();
		order.setOrderId(orderId);
		order.setSumNet(amount);
		order.setSumMoney(goods.getPriceP() * amount);
		order.setUserId(user.getUserId());
		order.setName(user.getNickName());
		order.setTel(user.getTel());
		order.setAddress(user.getAddress());
		
		OrderItem orderItem = new OrderItem();
		orderItem.setGoods(goods);
		orderItem.setOrder(order);
		orderItem.setUserId(user.getUserId());
		orderItem.setAmount(amount);
		orderItem.setMoney(goods.getPriceP() * amount);
		Connection conn = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/shops";
		String u = "aa";
		String password = "aa";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, u, password);
			conn.setAutoCommit(false);
			orderDao.addOrder(order, conn);
			orderItemDao.addOrderItem(orderItem, conn);
			conn.commit();
		} catch(SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
				throw new BuynowException("下单失败，请联系管理员");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new BuynowException("下单失败，连接出现错误");
		} finally {
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new BuynowException("未关闭连接");
				}
			}
		}
	}

	public Order findById(String orderId){
		Order order = orderDao.findById(orderId);
		return order;
	}

	public List<OrderItem> listById(String orderId){
		List<OrderItem> list = orderItemDao.listByOrderId(orderId);
		return list;
	}
}
