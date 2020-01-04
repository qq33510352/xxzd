<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
<script src="../../layui/layui.js" type="text/javascript">
</script>
</head>
<body>
	<!-- layui中如果想使用按钮只需要给任意容器加上 layui-btn 即可 其他样式大小等 也均为layui-btn开头
			并且可以使用图标  也就是 laiui-icon-->
	<div class="layui-btn-group">
		<span class="layui-btn">基础按钮</span>
		<div class="layui-btn">基础按钮</div>
	</div>
	按钮类型
	<div>
	    <button type="button" class="layui-btn layui-btn-primary">原始按钮</button>
	    <button type="button" class="layui-btn">默认按钮</button>
	    <button type="button" class="layui-btn layui-btn-normal">百搭按钮</button>
	    <button type="button" class="layui-btn layui-btn-warm">暖色按钮</button>
	    <button type="button" class="layui-btn layui-btn-danger">警告按钮</button>
	    <button type="button" class="layui-btn layui-btn-disabled">禁用按钮</button>
	</div>
	按钮尺寸
	<div>
	    <button type="button" class="layui-btn layui-btn-primary layui-btn-lg">最大按钮</button>
	    <button type="button" class="layui-btn layui-btn-primary">一般按钮</button>
	    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm">小型按钮</button>
	    <button type="button" class="layui-btn layui-btn-primary layui-btn-xs">微型按钮</button>
	</div>
	图标按钮
	<div>
	    <button type="button" class="layui-btn layui-btn-primary layui-icon">&#xe6c6;赞</button>
	    <button type="button" class="layui-btn layui-btn-primary layui-icon layui-icon-cart-simple"></button>
	    <button type="button" class="layui-btn layui-btn-warm layui-icon layui-icon-link"></button>
	    <button type="button" class="layui-btn layui-btn-primary layui-btn-lg" style="font-size: 20px"><span class="layui-icon layui-icon-user"></span>用户</button>
	</div>
	圆角按钮
	<div>
	    <button type="button" class="layui-btn layui-btn-primary layui-btn-radius">原始按钮</button>
	    <button type="button" class="layui-btn layui-btn-radius">默认按钮</button>
	    <button type="button" class="layui-btn layui-btn-normal layui-btn-radius">百搭按钮</button>
	    <button type="button" class="layui-btn layui-btn-warm layui-btn-radius">暖色按钮</button>
	    <button type="button" class="layui-btn layui-btn-danger layui-btn-radius">警告按钮</button>
	    <button type="button" class="layui-btn layui-btn-disabled layui-btn-radius">禁用按钮</button>
		<button type="button" class="layui-btn layui-btn-primary layui-icon layui-btn-radius">&#xe6c6;赞</button>
		<button type="button" class="layui-btn layui-btn-primary layui-icon layui-icon-cart-simple layui-btn-radius"></button>
		<button type="button" class="layui-btn layui-btn-warm layui-icon layui-icon-link layui-btn-radius"></button>
		<button type="button" class="layui-btn layui-btn-primary layui-btn-lg layui-btn-radius" style="font-size: 20px"><span class="layui-icon layui-icon-user"></span>用户</button>
	</div>
	风格混搭的按钮
	<div>
		<button type="button" class="layui-btn layui-btn-radius layui-btn-lg">大型圆角</button>
		<a href="script:;" class="layui-btn layui-btn-primary">跳转的按钮</a>
		<span class="layui-btn layui-btn-sm layui-icon layui-icon-delete">删除</span>
		<a href="script:;" class="layui-btn layui-btn-disabled layui-icon layui-icon-play">分享</a>
	</div>
	按钮组  会并在一起<br>
	<div class="layui-btn-group">
		<button type="button" class="layui-btn layui-btn-radius layui-btn-lg">大型圆角</button>
		<a href="script:;" class="layui-btn layui-btn-primary">跳转的按钮</a>
		<span class="layui-btn layui-btn-sm layui-icon layui-icon-delete">删除</span>
		<a href="script:;" class="layui-btn layui-btn-disabled layui-icon layui-icon-play">分享</a>
	</div>
	<br>
	按钮容器 在一起 但不并在一起
	<div class="layui-btn-container">
		<button type="button" class="layui-btn layui-btn-radius layui-btn-lg">大型圆角</button>
		<a href="script:;" class="layui-btn layui-btn-primary">跳转的按钮</a>
		<span class="layui-btn layui-btn-sm layui-icon layui-icon-delete">删除</span>
		<a href="script:;" class="layui-btn layui-btn-disabled layui-icon layui-icon-play">分享</a>
	</div>
</body>
</html>