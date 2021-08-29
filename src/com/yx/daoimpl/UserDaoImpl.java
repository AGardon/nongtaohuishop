package com.yx.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yx.dao.UserDao;
import com.yx.pojo.User;
import com.yx.util.BaseDao;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public User login(String userName, String password) {
		User user = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select vUserId,vNickName,vTel,vAddress from sf_user "
					+ " where vUserName = ? and vPassword = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUserId(rs.getString("vUserId"));
				user.setNickName(rs.getString("vNickName"));
				user.setTel(rs.getString("vTel"));
				user.setAddress(rs.getString("vAddress"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return user;
	}

}
