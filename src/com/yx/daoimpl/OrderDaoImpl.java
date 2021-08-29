package com.yx.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.yx.dao.OrderDao;
import com.yx.pojo.Order;
import com.yx.util.BaseDao;

public class OrderDaoImpl extends BaseDao implements OrderDao{

	@Override
	public int addOrder(Order order, Connection conn) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into sf_pc_order"
				+ " (vOrderId,dDate,mSumMoney,mSumNet,vState,vUserId,vName,vTel,vAddress)"
				+ " values(?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getOrderId());
			pstmt.setDate(2, new java.sql.Date(new Date().getTime()));
			pstmt.setInt(3, order.getSumMoney());
			pstmt.setInt(4, order.getSumNet());
			pstmt.setString(5,"Î´Ö§¸¶");
			pstmt.setString(6, order.getUserId());
			pstmt.setString(7, order.getName());
			pstmt.setString(8, order.getTel());
			pstmt.setString(9,order.getAddress());
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			throw new SQLException();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return result;
	}

	@Override
	public int modifyOrder(Order order, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "update sf_pc_order set mSumNet = ?, mSumMoney = ? where vOrderId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,order.getSumNet());
			pstmt.setInt(2,order.getSumMoney());
			pstmt.setString(3,order.getOrderId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			pstmt.close();
		}
	}

	@Override
	public Order findById(String orderId) {
		Order order = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select vOrderId,dDate,mSumMoney,mSumNet,vState,vUserId from sf_pc_order where vOrderId = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,orderId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				order = new Order();
				order.setOrderId(rs.getString("vOrderId"));
				order.setOrderDate(rs.getDate("dDate"));
				order.setSumMoney(rs.getInt("mSumMoney"));
				order.setSumNet(rs.getInt("mSumNet"));
				order.setState(rs.getString("vState"));
				order.setUserId(rs.getString("vUserId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pstmt);
		}
		return order;
	}

}
