package com.yx.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.yx.dao.CartDao;
import com.yx.pojo.Cart;
import com.yx.util.BaseDao;

public class CartDaoImpl extends BaseDao implements CartDao{

	@Override
	public Cart findByGoodsIdAndUserId(Integer goodsId, String userId) {
		Cart cart = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select vCid,vGoodsId,mAmount,mSumMoney,vUserId from sf_pc_cart where vGoodsId = ? and vUserId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsId);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cart;
	}

	@Override
	public int addCart(Integer goodsId, Integer amount, Integer sumMoney, String userId) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into sf_pc_cart (vCid,vGoodsId,mAmount,mSumMoney,vUserId) "
					+ " values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UUID.randomUUID().toString());
			pstmt.setInt(2, goodsId);
			pstmt.setInt(3, amount);
			pstmt.setInt(4, sumMoney);
			pstmt.setString(5, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
		return result;
	}

	@Override
	public int modifyCart(String cid, Integer amount, Integer sumMoney) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update sf_pc_cart set mAmount = ?,mSumMoney = ? where vCid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(1, sumMoney);
			pstmt.setString(3, cid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
		return result;
	}

	@Override
	public List<Cart> findByUserId(String userId) {
		List<Cart> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select vCid,vGoodsId,mAmount,mSumMoney,vUserId " +
					"from sf_pc_cart " +
					"where vUserId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Cart cart = new Cart();
				cart.setCid(rs.getString("vCid"));
				cart.setGoodsId(rs.getInt("vGoodsId"));
				cart.setAmount(rs.getInt("mAmount"));
				cart.setSumMoney(rs.getInt("mSumMoney"));
				cart.setUserId(rs.getString("vUserId"));
				list.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pstmt,rs);
		}
		return list;
	}

	@Override
	public int delete(String cid,Connection conn) {
		PreparedStatement pstmt = null;
		String sql = "delete from sf_pc_cart where vCid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,cid);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}

}
