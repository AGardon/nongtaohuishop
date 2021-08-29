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
	.mainbodyer{
		margin-top:10px;
		min-height:400px;
	}
	.footer{
		margin-top:20px;
	}
	</style>
</head>
<script type="text/javascript">
    if (window.top.location != window.self.location){
        window.top.location = window.self.location;
    }
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
                                <a href=""><i class="fa fa-shopping-cart" aria-hidden="true"></i> 购物车</a>
                                <a href="bill.html"><i class="fa fa-file-text-o" aria-hidden="true"></i> 我的订单</a>
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
                    <input type="text" title="搜索想要购买的商品" />
                    <input type="submit" value="搜 索" title="搜索" />
                </div>
       		</div>
        </div>
	</div>
    <div class="clearfix"></div>
	<div class="mainbodyer container">
        <form id="payForm">
            <c:choose>
                <c:when test="${list[0] ne null}">
                    <div class="car">
                <h3>购物车</h3>
                <table>
                    <thead>
                    <tr>
                        <th><input type="checkbox" class="allCheck" /> 全选</th>
                        <th>商品</th>
                        <th>商品名称</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>金额</th>
                        <th>操作</th>
                    </tr>
                    <thead>
                    <tbody>
                        <c:forEach items="${list}" var="cart">
                            <tr>
                                <th><input type="checkbox" class="check" name="checkId" value="${cart.cart.cid}#${cart.goods.goodsId}" onchange="xuan()" onclick="gou(this)"/></th>
                                <td><<img src="${cart.goods.image}"></td>
                                <td>${cart.goods.goodsTitle}</td>
                                <td class="price">${cart.goods.priceP}</td>
                                <td><input type="number" min="1" style="background-color: #ECECEC;border: rgba(255,255,255,0)" value="${cart.cart.amount}" class="num" onchange="gai(this)"/></td>
                                <td class="money">${cart.cart.sumMoney}</td>
                                <td><a href="javascript:;">删除</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="carbar">
                    <div>
                        <input type="checkbox" class="allCheck" id="allCheck"/> 全选
                    </div>
                    <div>
                        <input type="button" value="删除" />
                    </div>
                    <div></div>
                    <div></div>
                    <div>
                        总商品 <span id="count">0</span> 件
                    </div>
                    <div class="price">
                        合计：<span id="pri">0</span> 元
                    </div>
                    <div>
                        <!--<a href="./paybill.html">结账</a>-->
                        <a href="javascript:void(0);" id="pay" onclick="settle()">结账</a>
                    </div>
                </div>
            </div>
                </c:when>
                <c:otherwise>
                    <h1 style="font-size: 32px;font-family: 楷体;color: #37a237" align="center">空空如也!
                        <a style="font-size: 32px;font-family: 楷体;color: orangered" href="cate.do?flag=findall">继续逛逛吧！!</a>
                    </h1>
                </c:otherwise>
            </c:choose>
        </form>
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
	});

	function xuan() {
        var arr = document.getElementsByClassName("check");
        var count = 0;
        var sum = 0;
        for (var i = 0; i < arr.length; i++) {
            if(arr[i].checked == true){
                var obj = document.getElementsByClassName("num")[i];
                var parent = obj.parentNode;
                var prev = parent.previousSibling.previousSibling;
                var next = parent.nextSibling.nextSibling;
                next.innerText = prev.innerText * obj.value;
                count += obj.value * 1;
                sum += next.innerText * 1;
                document.getElementById("count").innerText = count;
                document.getElementById("pri").innerText = sum;
            }else{
                document.getElementById("count").innerText = count;
                document.getElementById("pri").innerText = sum;
            }
        }

    }

	function gai(obj) {
        var num = obj.value;
        var parent = obj.parentNode;
        var prev = parent.previousSibling.previousSibling;
        var next = parent.nextSibling.nextSibling;
        next.innerText = prev.innerText * num;
        xuan();
        var check = document.getElementsByClassName("check")[0];
        if (check.checked == true){
            var text = check.value;
            text = text.slice(0,text.lastIndexOf("#"));
            check.value = text;
            gou(check);
        }
    }

    function gou(obj) {
        if(obj.checked == true){
            var num = document.getElementsByClassName("num")[0].value;
            // alert(num);
            var text = obj.value +"#"+ num;
            // alert(text);
            obj.value = text;
        }else{
            var text = obj.value;
            text = text.slice(0,text.lastIndexOf("#"));
            obj.value = text;
        }
        // alert(obj.value);
    }

    function settle() {
        document.getElementById("payForm").action = "cart.do?flag=settle";
        document.getElementById("payForm").method = "post";
        document.getElementById("payForm").submit();
    }
</script>
</html>