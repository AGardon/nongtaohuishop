<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>农淘乐批发商城</title>
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/reset.css" type="text/css" rel="stylesheet" />
  	<link href="css/base.css" type="text/css" rel="stylesheet" />
    <link href="css/layout2.css" type="text/css" rel="stylesheet" />     
	<script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
</head>
<script type="text/javascript">
    if (window.self.location != window.top.location){
        window.top.location = window.self.location;
    }
</script>
<body>
<div class="top">
    <div class="container">
        <a href="index.html">
            <img src="images/logo.png" />
            <img src="images/title.png" />
        </a>
    </div>
</div>
<div class="center">
    <div class="container">
    	<div class="login">
        	<form action="user.do?flag=login" method="post">
            	<div>
                	<h3>用户登录</h3>
                </div>
                <div class="check">
                	
                </div>
            	<div>
                	<span>
                    <i class="fa fa-user" aria-hidden="true"></i>
 					用户名</span>
                    <input type="text" id="username" name="username"/>
                </div>
                <div>
                	<span> 
                    <i class="fa fa-lock" aria-hidden="true"></i>
					 密&nbsp;&nbsp;&nbsp;码</span>
                    <input type="password" id="psw" name="password"/>
                </div>
                 <div>
                	<span>
                    <i class="fa fa-key" aria-hidden="true"></i>
                    验证码</span>
                    <input type="text" name="yzm"/><img class="code" src="yanzheng" title="看不清，换一张" onclick="huan(this)"/>
                </div>
                <div>
                	<input id="okBtn" type="submit" value="登 录" />
                </div>
                <div>
                    <a href="./lostkey.html">忘记密码</a>
                    <a href="./register.html">注册</a>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="bottom">
	<div class="container">
	<div class="info">
    </div>
    </div>
</div>

<script>
	$(function(){
		$("#okBtn").click(function(){
			//var session = window.sessionStorage;
			var name = $("#uname").val();
			var psw = $("#psw").val();
			var obj ={'userName':name,'password':psw};
			$.ajax({
				type:"post",
				url:"http://127.0.0.1:8080/NongWeb/Users/login.do",
				data:obj,
				async:true,
				success:function(res){
					var msg=res.msg;
					var status = res.status;
					if(status == '200')
					{
						alert(msg);
						//session.setItem('nick',res.map.user.nickName);
						window.location.href="index.html";
					}else{
						alert(msg);
					}
				},
				error:function(err){
					
					
				}
			});
			
			
		});
		
	});
	
	function huan(obj){
		var n = obj.src;
		obj.src = "yanzheng?time="+new Date().getTime();
	}
</script>
</body>
</html>