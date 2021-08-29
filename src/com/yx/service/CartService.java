package com.yx.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yx.dao.CartDao;
import com.yx.dao.GoodsDao;
import com.yx.dao.OrderDao;
import com.yx.dao.OrderItemDao;
import com.yx.exception.BuynowException;
import com.yx.pojo.*;
import com.yx.util.BeanFactory;
import com.yx.util.OrderId;

public class CartService {

	private CartDao cartDao;
	private GoodsDao goodsDao;
	private OrderDao orderDao;
	private OrderItemDao orderItemDao;

	public CartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

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
	
	public int addCart(String gid,String uid,String num)  {
		int result = 0;
		int sumMoney = 0;
		int count = 0;
		Integer goodsId = Integer.parseInt(gid);
		Cart cart = cartDao.findByGoodsIdAndUserId(goodsId, uid);
		Goods goods = goodsDao.findById(goodsId);
		if (cart == null) {
			count = Integer.parseInt(num);
			sumMoney = goods.getPriceP();
			result = cartDao.addCart(goodsId, count, sumMoney, uid);
			
		} else {
			count = Integer.parseInt(num);
			count += cart.getAmount();
			sumMoney = goods.getPriceP() * count;
			result = cartDao.modifyCart(cart.getCid(), count, sumMoney);
		}
		return result;
	}

	public List<CartHelper> myCart(String userId){
		List<Cart> carts = cartDao.findByUserId(userId);
		List<CartHelper> cartHelpers = new ArrayList<>();
		for (Cart cart:carts) {
			Goods goods = goodsDao.findById(cart.getGoodsId());
			CartHelper cartHelper = new CartHelper();
			cartHelper.setCart(cart);
			cartHelper.setGoods(goods);
			cartHelpers.add(cartHelper);
		}
		return cartHelpers;
	}

	public String cartToOrder(String[] checkIds, User user ) {
		Order order = new Order();
		String orderId = OrderId.getOrderId();
		order.setOrderId(orderId);
		order.setAddress(user.getAddress());
		order.setName(user.getNickName());
		order.setTel(user.getTel());
		order.setUserId(user.getUserId());
		order.setSumNet(0);
		order.setSumMoney(0);
		Connection conn = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/shops";
		String u = "aa";
		String password = "aa";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,u,password);
			conn.setAutoCommit(false);
			orderDao.addOrder(order,conn);
			int sumNet = 0;
			int sumMoney = 0;
			for (String check : checkIds){
				String[] split = check.split("#");
				String cid = split[0];
				Integer gid = Integer.parseInt(split[1]);
				Integer num = Integer.valueOf(split[2]);
				OrderItem item = new OrderItem();
				Goods goods = goodsDao.findById(gid);
				item.setOrder(order);
				item.setGoods(goods);
				item.setUserId(user.getUserId());
				item.setAmount(num);
				item.setMoney(goods.getPriceP() * num);
				orderItemDao.addOrderItem(item,conn);
				cartDao.delete(cid,conn);
				sumNet += num;
				sumMoney += goods.getPriceP() * num;
			}
//			修改订单
			order.setSumNet(sumNet);
			order.setSumMoney(sumMoney);
			orderDao.modifyOrder(order,conn);
			conn.commit();
			return orderId;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			throw new BuynowException("下单失败，失败原因"+e.getCause());
		} finally {
			if (conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
}
