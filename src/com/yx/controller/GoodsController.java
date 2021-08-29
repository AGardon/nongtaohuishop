package com.yx.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yx.pojo.Goods;
import com.yx.service.GoodsService;
import com.yx.util.BaseServlet;
import com.yx.util.MyBeanFactory;
import com.yx.util.PageModel;

@WebServlet("/goods.do")
public class GoodsController extends BaseServlet{

	private static final long serialVersionUID = 1L;
	private GoodsService goodsService;
	
	@Override
	public void init() throws ServletException {
		goodsService = (GoodsService) MyBeanFactory.getBean("goodsService");
	}

	public void findall(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		String cateId = req.getParameter("cateId");
		List<Goods> list = goodsService.findByCateId(cateId);
		req.setAttribute("list", list);
		req.getRequestDispatcher("items.jsp").forward(req, resp);
	}

	public void findbypage(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		String size = req.getParameter("size");
		String cateId = req.getParameter("cateId");
		PageModel<Goods> pg = goodsService.findByPage(page, size, cateId);
		req.setAttribute("list", pg.getList());
		req.setAttribute("now", pg.nowPage());
		req.setAttribute("prev", pg.pervPage());
		req.setAttribute("next", pg.nextPage());
		req.setAttribute("total", pg.totalPage());
		req.setAttribute("cateId", cateId);
		req.getRequestDispatcher("goods.jsp").forward(req, resp);
	}

	public void findbyid(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		String gid = req.getParameter("gid");
		Goods goods = goodsService.findById(gid);
		req.setAttribute("goods", goods);
		req.getRequestDispatcher("goodspage.jsp").forward(req, resp);
	}
}
