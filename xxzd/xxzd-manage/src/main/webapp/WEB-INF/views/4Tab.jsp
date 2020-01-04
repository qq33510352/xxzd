<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../layui/layui.js"></script>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	  <legend>默认风格的Tab</legend>
	</fieldset>
	<!-- |-layui-tab 代表一个选项卡
			|-layui-tab-title 代表卡片头
				|-layui-this 默认选中卡片头
			|-layui-tab-content 代表卡片内容包装体 
				|-layui-tab-item  具体的卡片内容 div 和卡片头 一一对应
				|-layui-show 启动显示  比如上面 某个卡片头加了 layui-this 则 卡片内容的div也要加 layui-show 要不然内容没有-->
	 <!-- table需要引入 element -->
	<div class="layui-tab"><!-- layui-tab 代表一个 -->
	  <ul class="layui-tab-title">
	    <li class="layui-this">网站设置</li>
	    <li>用户管理</li>
	    <li>权限分配</li>
	    <li>商品管理</li>
	    <li>订单管理</li>
	  </ul>
	  <div class="layui-tab-content">
	    <div class="layui-tab-item layui-show">
	      1. 高度默认自适应，也可以随意固宽。
	      <br>2. Tab进行了响应式处理，所以无需担心数量多少。
	    </div>
	    <div class="layui-tab-item">内容2</div>
	    <div class="layui-tab-item">内容3</div>
	    <div class="layui-tab-item">内容4</div>
	    <div class="layui-tab-item">内容5</div>
	  </div>
	</div>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	  <legend>简约风</legend>
	</fieldset>
	<div class="layui-tab layui-tab-brief">
		<ul class="layui-tab-title">
			<li >你</li>
			<li class="layui-icon layui-icon-cellphone">好</li>
			<li class="layui-this">菜</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item">你</div>
			<div class="layui-tab-item">好</div>
			<div class="layui-tab-item layui-show">菜</div>
		</div>
	</div>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	  <legend>卡片风</legend>
	</fieldset>
	<div class="layui-tab layui-tab-card">
		<ul class="layui-tab-title">
			<li >你</li>
			<li class="layui-icon layui-icon-cellphone">好</li>
			<li class="layui-this">菜</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item">你</div>
			<div class="layui-tab-item">好</div>
			<div class="layui-tab-item layui-show">菜</div>
		</div>
	</div>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	  <legend>可删除</legend>
	</fieldset>
	<div class="layui-tab layui-tab-card"  lay-allowclose='true' lay-filter='saber'>
		<!-- 属性 lay-id 是扮演这项功能的主要角色，它是动态操作的重要凭据 -->
		<!-- lay-allowclose='true'表示这个容器里面所有元素可以关闭 lay-filter="aa"是layui的一种id标识写法 -->
		<ul class="layui-tab-title">
			<li lay-id="1">你</li>
			<li lay-id="2" class="layui-icon layui-icon-cellphone">好</li>
			<li lay-id="3" class="layui-this">菜</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item">你</div>
			<div class="layui-tab-item">好</div>
			<div class="layui-tab-item layui-show">菜</div>
		</div>
	</div>
	<div class="layui-btn-group">
		<span class="layui-btn layui-btn-radius" id="add">增加一个</span>
		<span class="layui-btn layui-btn-radius" id="check">切换到菜</span>
		<span class="layui-btn layui-btn-radius" id="delete">删除你</span>
		<span class="layui-btn layui-btn-radius" id="allDelete">全部删除</span>
	</div>
</body>
	<script type="text/javascript">
		layui.use(['element','jquery'],function(){
			var element = layui.element;
			var $ = layui.jquery;
			$("#add").click(function(){
				element.tabAdd('saber', {
				  title: Math.random()
				  ,content: '选项卡的内容' //支持传入html
				  ,id: Math.random()
				});
			})
			$("#check").click(function(){
				element.tabChange("saber","3");
			})
			$("#delete").click(function(){
				element.tabDelete("saber","1");
			})
			$("#allDelete").click(function(){
				var lis = $("ul li[lay-id]")
				alert(lis.length)
				for (var i = 0; i < lis.length; i++) {
					element.tabDelete("saber",lis[i].getAttribute("lay-id"));
				}
			})
		})
	</script>
</html>