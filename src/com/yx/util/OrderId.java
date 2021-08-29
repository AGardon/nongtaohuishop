package com.yx.util;

import java.sql.Timestamp;

public final class OrderId {

	private static int getNum() {
		Double floor = Math.floor(Math.random() * (10000 - 100));
		return floor.intValue();
	}
	
	private static String getDate() {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		return timestamp.toString().replace("-", "").replace(".", "").replace(" ", "").replace(":", "");
	}
	
	public static String getOrderId() {
		return "top"+getDate()+"-"+getNum();
	}

}
