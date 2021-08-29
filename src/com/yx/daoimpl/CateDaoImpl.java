package com.yx.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yx.dao.CateDao;
import com.yx.pojo.Category;
import com.yx.util.BaseDao;

public class CateDaoImpl extends BaseDao implements CateDao{

	@Override
	public List<Category> findall() {
		List<Category> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select vCategoryId,vCategoryTitle,vBigCategoryTitle from category";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Category cate = new Category();
				cate.setCateId(rs.getInt("vCategoryId"));
				cate.setCateTitle(rs.getString("vCategoryTitle"));
				cate.setBigCateTitle(rs.getString("vBigCategoryTitle"));
				list.add(cate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}

}
