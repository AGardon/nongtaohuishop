<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<title>批发商城</title>
		<link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/reset.css" type="text/css" rel="stylesheet" />
		<link href="css/base.css" type="text/css" rel="stylesheet" />
		<link href="css/layout.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="./js/jquery-1.12.0.min.js"></script>
		<style>
			table {
				width: 100%;
				text-align: center;
				background: #ececec;
				margin: 0 auto;
				table-layout: fixed;
			}
			
			table tr th {
				background: #555;
				padding: 5px;
				color: #FFF;
				height: 20px;
			}
			
			table tr td {
				height: 110px;
				padding: 10px;
			}
			
			table tr td img {
				height: 100px;
			}
			
			table tr:hover {
				background: #cecece;
			}
			
			table tr td input {
				text-align: center;
				width: 40px;
				padding: 5px;
			}
			
			table tr td input[type=button] {
				border: 1px solid #333;
				height: 25px;
				padding: 0;
			}
			
			.billitem {
				margin: 10px;
				border: 1px solid #000;
			}
			
			.billinfo {
				background: #333;
				height: 30px;
				color: #FFF;
			}
			
			.billinfo div {
				float: left;
				margin-left: 10px;
				padding: 5px;
				text-align: center;
			}
			
			.billinfo .right div {
				width: 200px;
			}
			
			.bot {
				background: #cecece;
				border-top: 1px solid #333;
			}
			
			.bot .right div {
				width: 120px;
				line-height: 20px;
			}
			
			.billinfo div a {
				background: #0066FF;
				padding: 7px;
				color: #FFF;
			}
		</style>
	</head>

	<body>
	<div class="billitem">
		<div class="billinfo">
			<div>订单编号：${order.orderId}</div>
			<div>订单日期：${order.orderDate}</div>
			<span class="right">
				<div>合计数量：${order.sumNet}</div>
				<div>合计金额：￥${order.sumMoney}</div>
			</span>
		</div>
		<table>
			<thead>
			<tr>
				<th>商品</th>
				<th>商品名称</th>
				<th>单价</th>
				<th>数量</th>
				<th>金额</th>
			</tr>
			</thead>
			<tbody >
                <c:forEach items="${list}" var="item">
                    <tr><td><img src="${item.goods.image}"/></td>
                        <td>${item.goods.goodsTitle}</td>
                        <td>￥${item.goods.priceP} </td>
                        <td>${item.amount}</td>
                        <td>￥${item.money} </td>
                    </tr>
                </c:forEach>
			</tbody>
		</table>
		<div class="billinfo bot">
			<span class="right">
				<div><a href="javascript:void(0);" class="zhi" >我要支付</a></div>
				<div><a href="javascript:void(0);" class="shan">删除订单</a></div>
				<span style="color:red;">已付款,待发货</span>
				<span style="color:red;">已发货</span>
			</span>
		</div>
	</div>
	</body>
	<script type="text/javascript">
		$(function() {
			/* 所在页面active */

			function setPage(text) {
				var info = $(".header .bar ul li");
				var i = "";
				for(var t = 0; t < info.length; t++) {
					i = info.eq(t).find("a").html();
					if(i == text) {
						info.eq(t).addClass("active");
					}
				}
			}

			setPage("地域特色");
		});
	</script>

</html>