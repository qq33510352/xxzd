<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
<link rel="icon" href="../../favicon.png"/>
<meta charset="utf-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>馨香之都</title>

<meta name="keywords" content="">

<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,900' rel='stylesheet' type='text/css'>

<!-- Bootstrap and Font Awesome css -->
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- owl carousel css -->

<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.css" rel="stylesheet">	        

<!-- Theme stylesheet -->
<link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet">

<!-- Custom stylesheet - for your changes -->
<link href="css/custom.css" rel="stylesheet">

<!-- CSS Animations -->
<link href="css/animate.css" rel="stylesheet">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.png">

<!-- Mordernizr -->
<script src="js/modernizr-2.6.2.min.js"></script>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="../../layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="../../js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	layui.use(['jquery','layer'],function(){
		// var $ = layui.jquery;
		var layer = layui.layer;
		//判断是否拥有cookie如果拥有则发起请求 
		var titcket = $.cookie("XXZD_TICKET")
		var username = $.cookie("XXZD_USER")
		//向服务器发起一个请求 获取用户数据如果获取到了则 回显用户名和个人中心  否则出现登录和注册 
		if(titcket && username){
			console.log(titcket)
			console.log(username)
			//发起请求  如果获取成功将内容放上去  如果失败则不作操作
			//query/{titcket}/{userName}
			$.ajax({
				url : "http://sso.xxzd.com/user/query/"+titcket+"/"+username,
				dataType : "jsonp",
				success:function (r){
					if(!r.code){
						//验证成功更改显示
						console.log("验证成功")
						var data = JSON.parse(r.data)
						addUserAndLogOut(data.name)
					}else{
						//验证失败啥也不干
						addLoginAndRegister()
					}
				}
			})
		}else{
			console.log("移除")
		}
	})
	function toRegister(){
		location.href="register";
	}
	function toLogin(){
		location.href="login";
	}
	function toBackStage(){
		location.href="http://manage.xxzd.com/";
	}
	function addUserAndLogOut(name){
		$("#navbar-header").append('<a class="navbar-brand scrollTo" onclick="toLogin()" id="name">'+name+'</a>'+
		'<a class="navbar-brand scrollTo" onclick="toLogin()" id="personal">个人中心</a><a class="navbar-brand scrollTo" onclick="toBackStage()" id="back-stage">后台</a>')
	}
	function test(){
		alert(123)
	}
	function addLoginAndRegister(){
		$("#navbar-header").append("<a class='navbar-brand scrollTo' onclick='toLogin()' id='login'>登录</a>"+
		"<a class='navbar-brand scrollTo' onclick='toRegister()' id='register'>注册</a>")
	}
	
</script>
<!-- Responsivity for older IE -->
<!--[if lt IE 9]>
<script src="js/respond.min.js"></script>
<![endif]-->

<meta property="og:title" content="Landing Page | Landing Page Bootstrap Theme by Bootstrapious.com!">
<meta property="og:site_name" content="Landing Page | Landing Page Bootstrap Theme by Bootstrapious.com!">
<meta property="og:type" content="website">
<meta property="og:url" content="">

<meta property="og:image" content="">  

<meta name="twitter:card" content="summary">
<meta name="twitter:creator" content="@bootstrapious">

</head>

<body data-spy="scroll" data-target="#navigation" data-offset="120">


<!-- *** NAVBAR ***
_________________________________________________________ -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
	<div class="container">
		<div id="navbar-header" class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- 内容 -->
		</div>

		<div class="navbar-collapse collapse" id="navigation">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#intro">首页</a>
				</li>
				<li><a href="#section1">本站模块</a>
				</li>
				<li><a href="#section4">关于我</a>
				</li>
			</ul>
		</div>
		<!--/.nav-collapse -->

	</div>
</div>
<!-- /#navbar -->

<!-- *** NAVBAR END *** -->


<div id="all">


	<!-- *** INTRO IMAGE ***
_________________________________________________________ -->
	<div id="intro" class="clearfix">
		<div class="item">
			<div class="container">
				<div class="row">

					<h1 data-animate="fadeInDown">欢迎来到 馨香之都!</h1>
					<p  class="message" data-animate="fadeInUp">
						为了那个梦想我们扬帆起航 - 为了理应到来的的那一天跨无尽黑暗
					</p>


					<div class="col-md-6 col-md-offset-3" data-animate="fadeInUp">
						<form action="#" method="post" id="frm-landingPage1" class="form">
							<div class="input-group">

								<input type="text" class="form-control" placeholder="搜索本站内容" name="content" id="searchContent" required value="">

								<span class="input-group-btn">

									<input class="btn btn-default" type="submit" value="搜索" name="_submit" id="searchSubmit">

								</span>

							</div>
							<!-- /input-group -->
						</form>

						<p class="text-small">从上面可以搜到本站所有公开内容</p>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- *** INTRO IMAGE END *** -->



	<!-- *** SERVICES ***
_________________________________________________________ -->
	<div class="section" id="section1">
		<div class="container">
			<div class="col-md-12">
				<h2 class="title" data-animate="fadeInDown">本站模块</h2>

				<p class="lead">别找了这就是本站所有模块了 再找也没有了</p>

				<div class="row services">

					<div class="col-md-4" data-animate="fadeInUp">
						<div class="icon"><i class="fa fa-home"></i>
						</div>
						<h3 class="heading">Great home</h3>
						<p>Junk MTV quiz graced by fox whelps. </p>
					</div>

					<div class="col-md-4" data-animate="fadeInUp">
						<div class="icon"><i class="fa fa-shopping-cart"></i>
						</div>
						<h3 class="heading">Stuff we would buy ourselves</h3>
						<p>Bawds jog, flick quartz, vex nymphs. </p>
					</div>

					<div class="col-md-4" data-animate="fadeInUp">
						<div class="icon"><i class="fa fa-euro"></i> 
						</div>
						<h3 class="heading">Free trial</h3>
						<p>Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. </p>
					</div>

				</div>
				<div class="row services">

					<div class="col-md-4" data-animate="fadeInUp">
						<div class="icon"><i class="fa fa-bullhorn"></i>
						</div>
						<h3 class="heading">We will propagate your stuff</h3>
						<p>Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl quack.</p>
					</div>

					<div class="col-md-4" data-animate="fadeInUp">
						<div class="icon"><i class="fa fa-desktop"></i>
						</div>
						<h3 class="heading">Responsive web and app</h3>
						<p>Quick wafting zephyrs vex bold Jim. Quick zephyrs blow, vexing daft Jim. </p>
					</div>

					<div class="col-md-4" data-animate="fadeInUp">
						<div class="icon"><i class="fa fa-heart-o"></i> 
						</div>
						<h3 class="heading">Dedicated support team</h3>
						<p>Quick, Baz, get my woven flax jodhpurs! "Now fax quiz Jack!" my brave ghost pled. </p>
					</div>

				</div>

			</div>
			<!-- /.12 -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.section -->

	<!-- *** SERVICES END *** -->     
	<!-- *** CONTACT ***
_________________________________________________________ -->

	<div class="section" id="section4" >
		<div class="container">
			<div class="col-md-8 col-md-offset-2">


				<h2 class="title" data-animate="fadeInDown">随便说几句</h2>

				<p class="lead margin-bottom" data-animate="fadeInUp">
					感谢各位游玩我的世界馨香之都服务器 到此的各个都是人才说话又好听 哎哟 我超喜欢这里面的
				</p>


				<ul class="list-unstyled text-large text-thin" data-animate="fadeInUp">
					<li><strong>E-mail:</strong> 33510352@qq.com</li>
					<li><strong>Phone:</strong> 16685523007</li>
				</ul>

			</div>
			<!-- /.12 -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.section -->



	<!-- *** FOOTER ***
_________________________________________________________ -->

	<div class="section" id="footer">
		<div class="container">

			<div class="row">

				<div class="col-sm-6">

					<p class="social">
						<a href="#" class="external facebook" data-animate-hover="shake" data-animate="fadeInUp"><i class="fa fa-facebook"></i></a>
						<a href="#" class="external instagram" data-animate-hover="shake" data-animate="fadeInUp"><i class="fa fa-instagram"></i></a>
						<a href="#" class="external twitter" data-animate-hover="shake" data-animate="fadeInUp"><i class="fa fa-twitter"></i></a>
						<a href="mailto:#" class="email" data-animate-hover="shake" data-animate="fadeInUp"><i class="fa fa-envelope"></i></a>
					</p>
				</div>
				<!-- /.6 -->

				<div class="col-sm-6">
					<p>Copyright &copy; 2019.Company name All rights reserved.<a target="_blank" href="http://www.aspku.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
				</div>

			</div>

		</div>
		<!-- /.container -->
	</div>
	<!-- /.section -->

	<!-- *** FOOTER END *** -->
</div>

<!-- js base -->
<script src="js/bootstrap.min.js"></script>

<!-- waypoints for scroll spy -->
<script src="js/waypoints.min.js"></script>

<!-- owl carousel -->
<script src="js/owl.carousel.min.js"></script>        

<!-- jQuery scroll to -->
<script src="js/jquery.scrollTo.min.js"></script>

<!-- main js file -->

<script src="js/front.js"></script>        

</body>
</html>