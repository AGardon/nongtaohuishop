package com.yx.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yx.exception.BuynowException;
import com.yx.pojo.User;
import com.yx.service.OrderService;
import com.yx.util.BaseServlet;
import com.yx.util.MyBeanFactory;

@WebServlet("/order.do")
public class OrderController extends BaseServlet{

	private static final long serialVersionUID = 1L;
	private OrderService orderService;
	
	@Override
	public void init() throws ServletException {
		orderService = (OrderService) MyBeanFactory.getBean("orderService");
	}
	
	public void buynow(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		User user = (User) req.getSession().getAttribute("user");
		String gid = req.getParameter("gid");
		String num = req.getParameter("num");
		try {
			orderService.buyNow(gid, num, user);
			resp.getWriter().print("下单成功");
		} catch(BuynowException e){
			resp.getWriter().print(e.getMessage());
		}
	}
}

