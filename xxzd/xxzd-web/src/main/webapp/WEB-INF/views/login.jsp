<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>登录</title>
		<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>馨香之都 登录</strong></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>欢迎来到 馨香之都</h3>
                        		</div>
                        		<div class="form-top-right">
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" id="form" class="login-form">
			                    	<div class="form-group">
			                        	<input type="text" name="name" placeholder="用户名..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<input type="password" name="password" placeholder="密码..." class="form-password form-control" id="form-password">
			                        </div>
			                        <button id="login" type="button" class="btn">登 录</button>
									没有账号?<a href="register">注册</a>----<a href="index">主页</a>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3></h3>
                        	<div class="social-login-buttons">
	                        	<button class="layui-btn layui-btn-lg layui-icon layui-icon-login-qq" style="font-size: 30px;background-color: royalblue;" type="button">QQ</button>
	                        	<button class="layui-btn layui-btn-lg" style="background-color: hotpink;font-size: 30px;"><img src="../../icon/bilibili50px.png"> bilibli</button>
								<button class="layui-btn layui-btn-lg layui-icon layui-icon-login-weibo" style="font-size: 30px;background-color: red;" type="button">微博</button>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
		<script src="../../layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			layui.use('layer',function(){
				var layer = layui.layer;
				$("#login").click(function(){
					console.log("点击了")
					if($("#form-username").val().length<6){
						layer.msg("账号或密码不正确")
					}else if($("#form-password").val().length<6){
						layer.msg("账号或密码不正确")
					}
					var data = {"name":$("#form-username").val(),"password":$("#form-password").val()};
					console.log(data)
					$.post("/user/login",data,function(r){
						if(r.code==0){
							layer.msg("登陆成功.....3秒后前往主页")
							setTimeout(function(){
								location.href="index";
							},3000)
						}else{
							layer.msg("账号或密码错误")
						}
					})
				})
			})
		</script>
    </body>

</html>