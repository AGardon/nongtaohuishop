package com.yx.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.yx.dao.OrderItemDao;
import com.yx.pojo.Goods;
import com.yx.pojo.Order;
import com.yx.pojo.OrderItem;
import com.yx.util.BaseDao;

public class OrderItemDaoImpl extends BaseDao implements OrderItemDao{

	@Override
	public int addOrderItem(OrderItem orderItem, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into sf_pc_order_item(uuid,vOrderId,dDate,vGoodsId,vGoodsTitle,vSpec,vUnit, "
				+ " mPrice,mAmount,mMoney,vImage,vSupplierTitle,vUserId) "
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UUID.randomUUID().toString());
			pstmt.setString(2, orderItem.getOrder().getOrderId());
			pstmt.setDate(3, new java.sql.Date(new Date().getTime()));
			pstmt.setInt(4, orderItem.getGoods().getGoodsId());
			pstmt.setString(5, orderItem.getGoods().getGoodsTitle());
			pstmt.setString(6, orderItem.getGoods().getSpec());
			pstmt.setString(7, orderItem.getGoods().getUnit());
			pstmt.setInt(8, orderItem.getGoods().getPriceP());
			pstmt.setInt(9, orderItem.getAmount());
			pstmt.setInt(10, orderItem.getMoney());
			pstmt.setString(11, orderItem.getGoods().getImage());
			pstmt.setString(12, orderItem.getGoods().getSupplierTitle());
			pstmt.setString(13, orderItem.getUserId());
			return pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			throw new SQLException();
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
	}

	@Override
	public List<OrderItem> listByOrderId(String orderId) {
		List<OrderItem> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select uuid,vOrderId,dDate,vGoodsId,vGoodsTitle,vSpec,vUnit,mPrice,mAmount,mMoney," +
					" vImage,vSupplierTitle,vUserId from sf_pc_order_item where vOrderId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,orderId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OrderItem item = new OrderItem();
				item.setMoney(rs.getInt("mMoney"));
				item.setUuid(rs.getString("uuid"));
				item.setAmount(rs.getInt("mAmount"));
				item.setUserId(rs.getString("vUserId"));
				Goods goods = new Goods();
				goods.setSpec(rs.getString("vSpec"));
				goods.setUnit(rs.getString("vUnit"));
				goods.setPriceP(rs.getInt("mPrice"));
				goods.setImage(rs.getString("vImage"));
				goods.setSupplierTitle(rs.getString("vSupplierTitle"));
				goods.setGoodsId(rs.getInt("vGoodsId"));
				goods.setGoodsTitle(rs.getString("vGoodsTitle"));
				item.setGoods(goods);
				Order order = new Order();
				order.setOrderId(rs.getString("vOrderId"));
				order.setOrderDate(rs.getDate("dDate"));
				item.setOrder(order);
				list.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pstmt,rs);
		}
		return list;
	}


}
