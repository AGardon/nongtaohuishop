package com.yx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yx.exception.BuynowException;
import com.yx.pojo.CartHelper;
import com.yx.pojo.Order;
import com.yx.pojo.OrderItem;
import com.yx.pojo.User;
import com.yx.service.CartService;
import com.yx.service.GoodsService;
import com.yx.service.OrderService;
import com.yx.util.BaseServlet;
import com.yx.util.MyBeanFactory;

@WebServlet("/cart.do")
public class CartController extends BaseServlet{

	private CartService cartService;
	private OrderService orderService;

	@Override
	public void init() throws ServletException {
		cartService = (CartService) MyBeanFactory.getBean("cartService");
		orderService = (OrderService) MyBeanFactory.getBean("orderService");
	}
	
	public void addcart(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		String gid = req.getParameter("gid");
		String num = req.getParameter("num");
		User user = (User) req.getSession().getAttribute("user");
		String userId = user.getUserId();
		try {
			cartService.addCart(gid, userId, num);
			resp.getWriter().print("添加购物车成功");
		} catch (BuynowException e) {
			e.printStackTrace();
			resp.getWriter().print("添加购物车失败");
			
		}
		
		resp.getWriter().flush();
		resp.getWriter().close();
	}

	public void mycart(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
		User user = null;
		try{
			user = (User) req.getSession().getAttribute("user");

		}catch (NullPointerException e){
			e.printStackTrace();
			resp.sendRedirect("login.jsp");
		}
		List<CartHelper> cartHelpers = cartService.myCart(user.getUserId());
		req.setAttribute("list",cartHelpers);
		req.getRequestDispatcher("shopcar.jsp").forward(req,resp);
	}

	public void settle(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
		String[] checkIds = req.getParameterValues("checkId");
		User user = (User) req.getSession().getAttribute("user");
		try {
			String orderId = cartService.cartToOrder(checkIds, user);
			Order order = orderService.findById(orderId);
			List<OrderItem> list = orderService.listById(orderId);
			req.setAttribute("order",order);
			req.setAttribute("list",list);
			req.getRequestDispatcher("billitems.jsp").forward(req,resp);
		} catch(BuynowException e){
			resp.getWriter().println(e.getMessage());
			resp.sendRedirect("500.html");
		}
	}
}
