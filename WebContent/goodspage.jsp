<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>批发商城</title>
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/reset.css" type="text/css" rel="stylesheet" />
  	<link href="css/base.css" type="text/css" rel="stylesheet" />    
  	<link href="css/layout.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="./js/jquery-1.12.0.min.js"></script>
    <style>
		.s{
			height:8px;
			background-image:url(images/shaow.png);
			background-repeat:repeat-x;
			background-position:bottom;
		}
    </style>
    <script type="text/javascript">
    		var local = window.localStorage;
    		var gid=local.getItem("gid");
    		var pric=0;
    	$(function(){
    		
    		
    		var url="http://127.0.0.1:8080/NongWeb/Goods/findGoodsById.do?gid="+gid;
    		$.get(url,null,function(res){
    			console.log(res);
    			res=res.map.goods;
    			$(".photo img").attr("src",res.image);
    			$(".goods_info h3").html(res.goodsTitle);
    			$(".gg").html("规格："+res.spec);
    			$(".ls").html("零售价：￥"+res.priceS);
    			$(".price").html("价格：￥ <span>"+res.priceP+".00</span>");
    			$(".gh").html("供货商："+res.supplierTitle);
    			$("#sub").next().html(res.unit);
    			pric=res.priceP;
    		});
    		
    	
    	});
    	
    </script>
</head>
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
                                <a href="login.jsp" title="登入">登入</a>
                                <a href="register.html" title="注册">注册</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
		<div class="container">
			<div class="mean-bar row">
                <div class="logo">
                    <a href="./index.html"><img src="images/logo.png" title="批发商城" />
                    <img class="title" src="images/title.png" title="批发商城" /></a>
                </div>
                <div class="right search">
                    	<input type="text" title="搜索想要购买的商品" placeholder="搜索想要购买的商品" />
						<input id="sou" type="submit" value="搜 索" title="搜索" />
                </div>
				<script>
					var local=window.localStorage;
					$("#sou").click(function(){
						var text = $(this).prev().val();
							if(text==''){
								alert("请输入要搜索的商品...");
								return;
							}
						local.setItem("key",text);
						window.location.href="goodss.html";
					});
					
				</script>
       		</div>
        </div>
        <div class="row bar">
        	<div class="container">
				<ul class="left">
					<li title="首页"><a href ="#">首 页</a></li>
					<li title="米面粮油"><a href ="./goods.html">米面粮油</a></li>
					<li title="地域特色"><a href ="./goods.html">地域特色</a></li>
                    <li title="药食同源"><a href ="./goods.html">药食同源</a></li>
                    <li title="零副食品"><a href ="./goods.html">零副食品</a></li>
                    <li title="俄货专区"><a href ="./goods.html">俄货专区</a></li>
                    <li title="清凉解渴"><a href ="./goods.html">清凉解渴</a></li>
                    <li title="花果茶"><a href ="./goods.html">花果茶</a></li>
				</ul>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="s"></div>
        
    </div>
    <div class="mainbodyer container">
    	<input type="hidden" id="userId" value="${user.userId}">
        <div class="goodsbar">
        	<div class="photo left">
            	<img src="${goods.image}" />
            </div>
            <div class="gbar right">
            	<div class="goods_info">
                    <h3>${goods.goodsTitle}</h3>
                    <div class="gg">规格：${goods.spec}</div>
                    <div class="ls">零售价：￥ ${goods.priceS}</div>
                    <div class="price">价格：￥ <span>${goods.priceP}</span></div>
                    <div class="num">
                    	数量： <input type="text" value="1" id="num"/> 
                        <button id="add"><i class="fa fa-angle-up" aria-hidden="true"></i></button>
                        <button id="sub"><i class="fa fa-angle-down" aria-hidden="true"></i></button>
                        <span>${goods.unit}</span>
                    </div>
                    <div class="gh">供货商：${goods.supplierTitle}</div>
                </div>
                <div>
                	<button id="buy" class="btn" onclick="buynow(${goods.goodsId})">立即购买</button>
                	<button id="cart" class="btn" onclick="addcart(${goods.goodsId})">加入购物车</button>
               		<script>
               			$("#buy").click(function(){
               				var num = $(".num input").val();
               				var url="http://127.0.0.1:8080/NongWeb/Orders/addOrder.do?gid="+gid+"&num="+num;
               				console.log("url:"+url);
               				$.get(url,null,function(res){
               					console.log(res);
               					if(res.status==200)
               					{
               						local.setItem("oid",res.msg);
               						alert("下单成功，请支付！");
               						window.location.href="paybill.html";
               					}
               				});
               			});
               			
               			$("#cart").click(function(){
               				var anum=$(".num input").val();
               				var money = pric * anum;
               				var url="http://127.0.0.1:8080/NongWeb/Carts/addCart.do?gid="+gid+"&amount="+anum+"&sumMoney="+money;
							$.get(url,null,function(res){
								if(res.status==500)
								{
									alert(res.msg);
									window.location.href="login.html";
								}else{
									var b=confirm(res.msg+"是否进入购物车结算?");
									if(b){
										window.location.href="cart.do?flag=mycart";
									}
								}
							});
               			});
               		</script>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="goods_det">
            	<div class="note left">
               		<h4>买家须知</h4>
                	<p>1，挑选商品时，请辨别产品口味后再购买（如东北大酱，细粮，粗粮等）。</p>
                    <p>2，七天内，产品有质量问题，商家给予无条件更换。</p>
                    <p>3，如果商品内包装在运输过程中破损（米袋破裂，酒瓶破损），请您拒签。</p>
                    <p>4，挑选商品时，请辨别产品口味后再购买（如东北大酱，细粮，粗粮等）。</p>
                    <p>5，七天内，产品有质量问题，商家给予无条件更换。</p>
                    <p>6，如果商品内包装在运输过程中破损（米袋破裂，酒瓶破损），请您拒签。</p>
                    <p>7，挑选商品时，请辨别产品口味后再购买（如东北大酱，细粮，粗粮等）。</p>
                    <p>8，七天内，产品有质量问题，商家给予无条件更换。</p>
                    <p>9，如果商品内包装在运输过程中破损（米袋破裂，酒瓶破损），请您拒签。</p>
                </div>
                <div class="det right">
                <img src="${goods.url}" />
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
	<div class="footer">
	<div class="container">
		<div class="info">
        	
		</div>
	</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		/* 所在页面active */
		
		function setPage(text){
			var info = $(".header .bar ul li");
			var i = "";
			for( var t =0 ; t<info.length ;t++){
				i = info.eq(t).find("a").html();
				if(i == text){
					info.eq(t).addClass("active");
				}
			}
		}
		
		setPage("地域特色");
		
		$("#add").click(function(){
			var add = $(".num input").val();
			if(add<99){
				$(".num input").val(++add);
			}
		})
		$("#sub").click(function(){
			var add = $(".num input").val();
			if(add>1){
				$(".num input").val(--add);
			}
		});

		$(document).scroll(function(){
			if($(document).scrollTop()>791&&$(document).scrollTop()<=$(".footer").offset().top-$(".note").height()){
				$(".note").addClass("flow");
				$(".note").removeClass("flow2");
			}else if($(document).scrollTop()<=791){
				$(".note").removeClass("flow");
				$(".note").removeClass("flow2");
			}else if($(document).scrollTop()>$(".footer").offset().top-$(".note").height()){
				$(".note").removeClass("flow");
				$(".note").addClass("flow2");
			}
		});
	})
	
	function addcart(goodsId){
		var uid = document.getElementById("userId").value;
		if(uid == null || "" == uid){
			var f = confirm("请先登录");
			if(f){
				window.location.href="login.jsp";
			}
		}else{
			var num = document.getElementById("num").value;
			var url = "cart.do?flag=addcart&gid="+goodsId+"&num="+num;
			var xmlHttp = new XMLHttpRequest();
			xmlHttp.open("GET",url,true);
			xmlHttp.send();
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
					var text = xmlHttp.responseText;
					if(text == '添加购物车成功'){
						var f = confirm(text+"是否到我的购物车查看");
						if(f){
							window.location.href="cart.do?flag=mycart";
						}else{
							window.location.reload();
						}
					}else{
						alert(text);
					}
				}
			}
		}
	}
	
	function buynow(goodsId){
		var userId = document.getElementById("userId").value;
		if(userId == null || userId == ""){
			var f = confirm("请先登录");
			if(f){
				window.location.href = "login.jsp"
			}
		}else{
			var xmlHttp = new XMLHttpRequest();
			var num = document.getElementById("num").value;
			var url = "order.do?flag=buynow&gid="+goodsId+"&num="+num;
			xmlHttp.open("GET",url,true);
			xmlHttp.send();
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState == 4 && xmlHttp.status){
					var text = xmlHttp.responseText;
					if(text == "下单成功"){
						var f = confirm(text+"是否进入我的订单进行购买");
						if(f){
							window.location.href="bill.html"
						}else{
							window.location.reload();
						}
					}else{
						alert(text);
					}
				}
			}
		}
	}
</script>
</html>