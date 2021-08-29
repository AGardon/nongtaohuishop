package com.yx.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.authentication.MysqlClearPasswordPlugin;
import com.yx.pojo.Category;
import com.yx.service.CateService;
import com.yx.util.BaseServlet;
import com.yx.util.MyBeanFactory;

@WebServlet("/cate.do")
public class CateController extends BaseServlet{

	private static final long serialVersionUID = 1L;
	private CateService cateService;
	
	@Override
	public void init() throws ServletException {
		cateService = (CateService) MyBeanFactory.getBean("cateService");
	}
	
	public void findall(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		List<Category> list = cateService.findall();
		req.setAttribute("list", list);
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
