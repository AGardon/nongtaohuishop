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
	body{
		background:#ececec;
	}
	.item img{
		width: 280px;
		height: 287px;
	}
	.item {
	    width: 280px;
	}	
	</style>
</head>

<body>
<input type="hidden" value="${user.userId}" id="userId">
<c:forEach items="${list}" var="goods">
	<div class="item">
	<a href="goods.do?flag=findbyid&gid=${goods.goodsId}" target="_top"><img src="${goods.image}" /></a>
	<div><a href="goods.do?flag=findbyid&gid=${goods.goodsId}" target="_top"><h4>${goods.goodsTitle}</h4></a>
	<div class="">${goods.spec}</div></div>
	<div><span class="price">￥<span> </span> ${goods.priceP}/ ${goods.unit}</span>
	<div class="addin"onclick="add(${goods.goodsId})">
            <i class="fa fa-shopping-cart" aria-hidden="true"></i> 加入购物车</div></div>
	</div>
</c:forEach>

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
</body>
</html>