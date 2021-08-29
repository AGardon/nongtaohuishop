package com.yx.dao;

import java.sql.Connection;
import java.util.List;

import com.yx.pojo.Cart;

public interface CartDao {

	Cart findByGoodsIdAndUserId(Integer goodsId,String userId);

	int addCart(Integer goodsId,Integer amount,Integer sumMoney,String userId);

	int modifyCart(String cid,Integer amount,Integer sumMoney);

	List<Cart> findByUserId(String userId);

    int delete(String cid, Connection conn);
}
