package com.yx.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yx.pojo.User;
import com.yx.service.UserService;
import com.yx.util.BaseServlet;
import com.yx.util.MyBeanFactory;

@WebServlet("/user.do")
public class UserController extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private UserService userService;

	@Override
	public void init() throws ServletException {
		userService = (UserService) MyBeanFactory.getBean("userService");
	}

	public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String userName = req.getParameter("username");
		String password = req.getParameter("password");
		String yzm = req.getParameter("yzm");
		String rand = (String) req.getSession().getAttribute("rand");
		User user = userService.login(userName, password);
		req.getSession().setAttribute("user", user);
		if (user != null) {
			if (yzm.equalsIgnoreCase(rand)) {
				resp.sendRedirect(req.getContextPath() + "/cate.do?flag=findall");
			} else {
				req.setAttribute("error", "验证码错误");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
			
		} else {
			req.setAttribute("error", "用户名或密码错误");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}

}
