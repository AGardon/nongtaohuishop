package com.yx.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yx.dao.GoodsDao;
import com.yx.pojo.Category;
import com.yx.pojo.Goods;
import com.yx.util.BaseDao;
import com.yx.util.PageModel;

public class GoodsDaoImpl extends BaseDao implements GoodsDao{

	@Override
	public PageModel<Goods> findByPage(int pageNo, int pageSize, Integer cateId,String state) {
		PageModel<Goods> pg = null;
		List<Goods> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select vGoodsId,vGoodsTitle,vSpec,vUnit,vCategoryId,vCategoryTitle,"
					+ " vSupplierTitle,mPriceS,mPriceP,vState,vProperty,vImage,vUrl "
					+ " from goods where vCategoryId = ? and vState like ?"
					+ " limit "+((pageNo-1)*pageSize)+" , " +pageSize;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cateId);
			pstmt.setString(2, "%"+state+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("vGoodsId"));
				goods.setGoodsTitle(rs.getString("vGoodsTitle"));
				goods.setSpec(rs.getString("vSpec"));
				goods.setUnit(rs.getString("vUnit"));
				Category cate = new Category();
				cate.setCateId(rs.getInt("vCategoryId"));
				cate.setCateTitle(rs.getString("vCategoryTitle"));
				goods.setCate(cate);
				goods.setSupplierTitle(rs.getString("vSupplierTitle"));
				goods.setPriceS(rs.getInt("mPriceS"));
				goods.setPriceP(rs.getInt("mPriceP"));
				goods.setState(rs.getString("vState"));
				goods.setProperty(rs.getString("vProperty"));
				goods.setImage(rs.getString("vImage"));
				goods.setUrl(rs.getString("vUrl"));
				list.add(goods);
			}
			pg = new PageModel<>();
			pg.setList(list);
			pg.setPageNo(pageNo);
			pg.setPageSize(pageSize);
			pg.setTotalRecords(totalRecords(conn,cateId,state));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return pg;
	}

	private int totalRecords(Connection conn, Integer cateId,String state) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from goods where vCategoryId = ? and vState like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cateId);
			pstmt.setString(2, "%"+state+"%");
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null, pstmt, rs);
		}
		return count;
	}

	@Override
	public List<Goods> findByCateId(Integer cateId, String state) {
		List<Goods> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select vGoodsId,vGoodsTitle,vSpec,vUnit,vCategoryId,vCategoryTitle,"
					+ " vSupplierTitle,mPriceS,mPriceP,vState,vProperty,vImage,vUrl "
					+ " from goods where vCategoryId = ? and vState like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cateId);
			pstmt.setString(2, "%"+state+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("vGoodsId"));
				goods.setGoodsTitle(rs.getString("vGoodsTitle"));
				goods.setSpec(rs.getString("vSpec"));
				goods.setUnit(rs.getString("vUnit"));
				Category cate = new Category();
				cate.setCateId(rs.getInt("vCategoryId"));
				cate.setCateTitle(rs.getString("vCategoryTitle"));
				goods.setCate(cate);
				goods.setSupplierTitle(rs.getString("vSupplierTitle"));
				goods.setPriceS(rs.getInt("mPriceS"));
				goods.setPriceP(rs.getInt("mPriceP"));
				goods.setState(rs.getString("vState"));
				goods.setProperty(rs.getString("vProperty"));
				goods.setImage(rs.getString("vImage"));
				goods.setUrl(rs.getString("vUrl"));
				list.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public Goods findById(Integer goodsId) {
		Goods goods = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select vGoodsId,vGoodsTitle,vSpec,vUnit,vCategoryTitle,vCategoryId,vSupplierTitle,"
					+ " mPriceS,mPriceP,vState,vProperty,vImage,vUrl from goods where vGoodsId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				goods = new Goods();
				goods.setGoodsId(rs.getInt("vGoodsId"));
				goods.setGoodsTitle(rs.getString("vGoodsTitle"));
				goods.setSpec(rs.getString("vSpec"));
				goods.setUnit(rs.getString("vUnit"));
				Category cate = new Category();
				cate.setCateId(rs.getInt("vCategoryId"));
				cate.setCateTitle(rs.getString("vCategoryTitle"));
				goods.setCate(cate);
				goods.setSupplierTitle(rs.getString("vSupplierTitle"));
				goods.setPriceS(rs.getInt("mPriceS"));
				goods.setPriceP(rs.getInt("mPriceP"));
				goods.setState(rs.getString("vState"));
				goods.setProperty(rs.getString("vProperty"));
				goods.setImage(rs.getString("vImage"));
				goods.setUrl(rs.getString("vUrl"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return goods;
	}

}
