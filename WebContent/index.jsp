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
	<script type="text/javascript" src="./js/jquery-1.12.0.min.js"></script>
    <style>
    	#fram{
			width:1005px;
			height:840px;
			border:none;
			overflow:hidden;
			background:#ececec;
		}
    </style>
</head>
<body>
	<div class="header">
			<div class="header-top row">
            	<div class="container">
                	<div class="wel left">
                    	欢迎来到批发商城，选购商品前请登录
                    </div>
                    <div class="right login">
                    <input type="hidden" value="${user}" id="res">
	                    <c:choose>
	                    	<c:when test="${user ne null}">
		                    	<label style="display: inline; color: red;" id="nickName">${user.nickName}</label>
		                    	<a href="cart.do?flag=mycart"><i class="fa fa-shopping-cart" aria-hidden="true"></i> 购物车</a>
		                    	<a href="bill.html"><i class="fa fa-file-text-o" aria-hidden="true"></i> 我的订单</a>
	                        </c:when>
	                        <c:otherwise>
		                        <span id="logtool">
		                        <a href="login.jsp" title="登入">登入</a>
		                        <a href="register.html" title="注册">注册</a>
		                        </span>
	                        </c:otherwise>
	                    </c:choose>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
		<div class="container">
			<div class="mean-bar row">
                <div class="logo">
                    <a href="./index.html"><img src="images/logo.png" title="农淘惠批发商城" />
                    <img class="title" src="images/title.png" title="农淘惠批发商城" /></a>
                </div>
                <div class="right search">
                    	<input type="text" title="搜索想要购买的商品" placeholder="搜索想要购买的商品" />
						<input id="sou" type="submit" value="搜 索" title="搜索" />
                </div>
				
			</div>
        </div>
        <div class="row bar">
        	<div class="container">
				<ul class="left">
					<li title="首页"><a href ="#">首 页</a></li>
					<c:forEach items="${list}" var="cate">
						<li title="${cate.cateTitle}"><a href ="goods.do?flag=findbypage&cateId=${cate.cateId}">${cate.cateTitle}</a></li>
					</c:forEach>
				</ul>
            </div>
        </div>
        <div class="clearfix"></div>
	</div>
	<div class="mainbodyer container">
		<div class="sildepic">
            <ul class="kiss-slider">
                <li><img src="img/nong11.jpg" /></li>
                <li><img src="img/nong22.jpg" /></li>
                <li><img src="img/nong33.jpg" /></li>
            </ul>
            <ul class="kiss-pagination text-center"></ul>
            <p class="ctrlbar">
               <a class="previous"><i class="fa fa-chevron-left" aria-hidden="true"></i>
</i>
</a>
               <a class="next"><i class="fa fa-chevron-right" aria-hidden="true"></i>
</i>
</a>
            </p>	
		</div>
        <div class="clearfix"></div>
		<div class="goods_class left">
			<ul id="ul-left">
				<c:forEach items="${list}" var="cate">
					<li title="${cate.cateTitle}"><a target="fram" href="goods.do?flag=findall&cateId=${cate.cateId}">${cate.cateTitle}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="goods_list">
		<div class="more"><a href="goods.html">更多..</a></div>
            <iframe name="fram" id="fram" scrolling="no" src="goods.do?flag=findall&cateId=1" />
            </iframe>
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
<script type="text/javascript" src="js/jquery.kiss-slider.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.sildepic .kiss-slider').kissSlider({
			prevSelector: '.sildepic .previous',
			nextSelector: '.sildepic .next',
			paginationSelector: '.sildepic .kiss-pagination',
			autoplay:true
		});
		$(".sildepic .kiss-pagination button").html(" ")
		var timer = "";
		function vPlay(){
			timer = setInterval(function(){
				$(".sildepic .next").click();
			},5000);
		}
		
		function vStop(){
			clearInterval(timer);	
		}
		vPlay();
		$(".sildepic").mouseenter(function(){
			vStop();
		});
		$(".sildepic").mouseleave(function(){
			vPlay();
		});
		
		$(".goods_class ul li").eq(0).addClass("active");
		
		function getFocus(faID,chID,ele){
			$(faID+" "+chID).removeClass("active");
			$(ele).addClass("active");
		}
		$(".goods_class ul li").click(function(){
			getFocus(".goods_class ul","li",this);
		})
		
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
		
		setPage("首 页");

})

$(function() {
	var local = window.localStorage;
	var url = "http://127.0.0.1:8080/NongWeb/Categorys/findCategory.do";
	$.get(url, null, function(res) {
		var obj = res.list;
		$.each(obj, function(k, v) {
			var text = '<li title="' + v.categoryTitle + '"><a target="fram" href="javascript:void(0);" data-cid="' + v.categoryId + '">' + v.categoryTitle + '</a></li>';
			$("#ul-left").append(text).find("a").click(function() {
				var num=$(this).attr("data-cid");
				$(this).attr("href", "items.html").parent().addClass("active").siblings("li").removeClass("active");
				local.setItem("cid",num);
			});
		});
		$("#ul-left li").eq(0).addClass("active").find("a").trigger("click");
	});

});

</script>
</html>