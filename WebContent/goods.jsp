<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>批发商城</title>
		<link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/reset.css" type="text/css" rel="stylesheet" />
		<link href="css/base.css" type="text/css" rel="stylesheet" />
		<link href="css/layout.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
		<style>
			.item img {
				width: 267px;
				height: 287px;
			}
			
			body {
				color: #040404;
			}
			
			.mainbodyer {
				min-height: 1250px;
			}
			
			#win {
				width: 100%;
				height: 100%;
				border: none;
				padding: 0px;
			}
			/* item page */
			
			div.item {
				width: 264px;
				margin: 5px;
			}
			.pageNo a.a-active{
				background: red;
				color: white;
			}
		</style>
	</head>

	<script>
		var local = window.localStorage;
		var cid = local.getItem("cid");
		//alert(cid);
		var url = "http://127.0.0.1:8080/NongWeb/Categorys/findCategory.do";
		$.get(url, null, function(res) {
			var obj = res.list;
			$.each(obj, function(k, v) {
				var text = '<option value="' + v.categoryId + '">' + v.categoryTitle + '</option>';
				$(".serchbar div select").append(text);
				if(cid == v.categoryId) {
					$("option[value='" + cid + "']").attr("selected", "selected");
				}
			});

			$(".serchbar select").change(function() {
				var n = $(this).val();
				local.setItem("cid", n);
				window.location.href = "goods.html";
			});

		});

		var url2 = "http://127.0.0.1:8080/NongWeb/Goods/getGoodsByCategoryId.do?cid=" + cid;

		$.get(url2, null, function(res) {
			//商品数组
			var goods = res.map.goods;
			//总条数
			var len = goods.length;
			//页数
			var page = Math.ceil(len / 12);

			//保存数据的数组
			var resArr = [];
			for(var i = 0; i < len; i += 12) {
				resArr.push(goods.slice(i, i + 12));
			}
			console.log(resArr);
			for(var i = 1; i <= page; i++) {
				var text = '<a href="javascript:void(0);"><li>' + i + '</li></a>';
				$("#pageNum").append(text).find("a").click(function() {
					//拿到点击的页号
					var n = $(this).find("li").html();
					//为当前页号增加选中样式，移除其他页号样式
					$(this).addClass("active").siblings("a").removeClass("active");
					//根据选择的页号拿到对应的值
					var arr = resArr[n - 1];
					$(".goodslist").empty();
					$.each(arr, function(k, v) {

						var divText = '<div class="item"><a href="./goodspage.html"><img src="' + v.image + '" /></a><div>' +
							'<a href="./goodspage.html"><h4>' + v.goodsTitle + '</h4></a>' +
							'<div class="">' + v.spec + '/ ' + v.unit + '</div>' +
							'</div><div>' +
							'<span class="price">￥<span> ' + v.priceP + '</span> / ' + v.unit + '</span>' +
							'<div class="addin"><i class="fa fa-shopping-cart" aria-hidden="true"></i> 加入购物车</div></div></div> ';

						$(".goodslist").append(divText);
					});
				}).eq(0).addClass("active").trigger("click");
			}

			var sb = $("#pageNum a").length;
			$("#pageNum").prev().click(function() {
				var n = $("#pageNum a.active").text();
				n = n - 1;
				if(n != 0) {
					n = n - 1;
				}
				var obj = resArr[n];
				console.log(obj);
				$("#pageNum a").eq(n).trigger("click");
			});
			$("#pageNum").next().click(function() {
				var n = $("#pageNum a.active").text();
				n = n - 1;
				if(n >= sb - 1) {
					n = sb - 1;
				} else {
					n = n + 1;
				}
				$("#pageNum a").eq(n).trigger("click");

			});
		});
	</script>

	<body>
		<div class="header">
			<div class="header-top row">
				<div class="container">
					<div class="wel left">
						欢迎来到农产品批发商城，选购商品前请登录
					</div>
					<div class="right login">
						<c:choose>
							<c:when test="${user ne null}">
								<label style="display: inline; color: red;" id="nickName">${user.nickName}</label>
								<a href="cart.do?flag=mycart"><i class="fa fa-shopping-cart" aria-hidden="true"></i> 购物车</a>
								<a href="./bill.html"><i class="fa fa-file-text-o" aria-hidden="true"></i> 我的订单</a>
							</c:when>
							<c:otherwise>
								<a href="./login.html" title="登入">登入</a>
								<a href="./register.html" title="注册">注册</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="container">
				<div class="mean-bar row">
					<div class="logo">
						<a href="index.html"><img src="images/logo.png" title="批发商城" />
							<img class="title" src="images/title.png" title="批发商城" /></a>
					</div>
					<div class="right search">
						<input type="text" title="搜索想要购买的商品" placeholder="搜索想要购买的商品" />
						<input id="sou" type="submit" value="搜 索" title="搜索" />
					</div>
					<script>
						$("#sou").click(function() {
							var text = $(this).prev().val();
							if(text==''){
								alert("请输入要搜索的商品...");
								return;
							}
							var url = "http://localhost:8080/NongWeb/Goods/getGoodsLikeName.do?name=" + text;
							$.get(url, null, function(res) {
								console.log(res);
								//商品数组
								var goods = res.map.goods;
								//总条数
								var len = goods.length;
								if(len==0)
								{
									alert("没有搜索到商品，请重新输入！");
									return;
								}
								
								//页数
								var page = Math.ceil(len / 12);

								//保存数据的数组
								var resArr = [];
								for(var i = 0; i < len; i += 12) {
									resArr.push(goods.slice(i, i + 12));
								}
								var text = "";
								console.log(resArr);
								for(var i = 1; i <= page; i++) {
									text += '<a href="javascript:void(0);"><li>' + i + '</li></a>';
									$("#pageNum").html(text).find("a").click(function() {
										//拿到点击的页号
										var n = $(this).find("li").html();
										//为当前页号增加选中样式，移除其他页号样式
										$(this).addClass("active").siblings("a").removeClass("active");
										//根据选择的页号拿到对应的值
										var arr = resArr[n - 1];
										$(".goodslist").empty();
										$.each(arr, function(k, v) {

											var divText = '<div class="item"><a href="./goodspage.html"><img src="' + v.image + '" /></a><div>' +
												'<a href="./goodspage.html"><h4>' + v.goodsTitle + '</h4></a>' +
												'<div class="">' + v.spec + '/ ' + v.unit + '</div>' +
												'</div><div>' +
												'<span class="price">￥<span> ' + v.priceP + '</span> / ' + v.unit + '</span>' +
												'<div class="addin"><i class="fa fa-shopping-cart" aria-hidden="true"></i> 加入购物车</div></div></div> ';

											$(".goodslist").append(divText);
										});
									}).eq(0).addClass("active").trigger("click");
								}

								var sb = $("#pageNum a").length;
								$("#pageNum").prev().click(function() {
									var n = $("#pageNum a.active").text();
									n = n - 1;
									if(n != 0) {
										n = n - 1;
									}
									var obj = resArr[n];
									console.log(obj);
									$("#pageNum a").eq(n).trigger("click");
								});
								$("#pageNum").next().click(function() {
									var n = $("#pageNum a.active").text();
									n = n - 1;
									if(n >= sb - 1) {
										n = sb - 1;
									} else {
										n = n + 1;
									}
									$("#pageNum a").eq(n).trigger("click");

								});
							});

						});
					</script>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="mainbodyer container">

			<div class="serchbar">
				<div>
					<select>

					<option>米面粮油</option>
					<option>地域特色</option>
                    <option>药食同源</option>
                   <option>零副食品</option>
                    <option>俄货专区</option>
                    <option>清凉解渴</option>
                    <option>花果茶</option>
					</select>
				</div>

				<a>输入范围：</a>
				<div>
					<input type="text" placeholder="￥">~<input type="text" placeholder="￥">
					<input id="gigi" type="button" value="确定" />
					<input id="clear" type="button" value="清除" />
				</div>
				<script>
					$("#clear").click(function() {
						$(this).prev().prev().val("").prev().val("");
					});
					
				</script>
			</div>

			<div class="goodslist">
				<c:forEach items="${list}" var="goods">
					<div class="item">
					<a href="goods.do?flag=findbyid&gid=${goods.goodsId}" target="_top"><img src="${goods.image}" /></a>
					<div><a href="goods.do?flag=findbyid&gid=${goods.goodsId}" target="_top"><h4>${goods.goodsTitle}</h4></a>
					<div class="">${goods.spec}</div></div>
					<div><span class="price">￥<span> </span> ${goods.priceP}/ ${goods.unit}</span>
					<div class="addin" onclick="add(${goods.goodsId})"><i class="fa fa-shopping-cart" aria-hidden="true"></i> 加入购物车</div></div>
					</div>
				</c:forEach>
			</div>
			<div class="pageNo right">
				<a href="goods.do?flag=findbypage&cateId=${cateId}&page=${prev}"><i class="fa fa-angle-left" aria-hidden="true"></i> 上一页</a>
				<c:forEach begin="1" end="${total}" var="i">
					<ul id="pageNum">
						<li>
							<a href="goods.do?flag=findbypage&cateId=${cateId}&page=${i}" <c:if test="${now eq i}">class="a-active"</c:if>>${i}</a>
						</li>
					</ul>
				</c:forEach>
				<a href="goods.do?flag=findbypage&cateId=${cateId}&page=${next}">下一页 <i class="fa fa-angle-right" aria-hidden="true"></i></a>
			</div>
		</div>

		<div class="clearfix"></div>
		<div class="footer">
			<div class="container">

			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery.kiss-slider.min.js"></script>
	<script type="text/javascript">
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

		setPage("首 页");


	</script>

	<script type="text/javascript">
		function add(goodsId) {
			var userId = document.getElementById("userId").value;
			if (userId == null || userId == ""){
				var f = confirm("请先登录");
				if (f){
					window.location.href="login.jsp";
				}
			}else{
				var xmlHttp = new XMLHttpRequest();
				var url = "cart.do?flag=addcart&gid="+goodsId+"&num=1";
				xmlHttp.open("GET",url,true);
				xmlHttp.send();
				xmlHttp.onreadystatechange=function () {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
						var text = xmlHttp.responseText;
						if(text == "添加购物车成功"){
							var f = confirm(text+"是否到我的购物车进行查看");
							if (f){
								window.location.href="cart.do?flag=mycart";
							}
						}
					}
				}
			}
		}
	</script>
</html>