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
	<div class="layui-progress">
		<div class="layui-progress-bar" lay-percent="70%"><!-- lay-percent="70%"进度条百分比 -->
		</div>
	</div>
	<br>
	<!--大小随父 lay-showpercent="true"显示百分比  lay-percent="70%"设置进度条  layui-progress 进度条外层 layui-progress-bar进度条内层  layui-progress-big 大进度条-->
	<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
	  <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
	</div>
	<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
	 <div class="layui-progress-bar layui-bg-cyan" lay-percent="0%"></div>
	</div>
	<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
	  <div class="layui-progress-bar layui-bg-gray" lay-percent="0%"></div>
	</div>
	
	<div class="layui-btn-group">
		<span class="layui-btn" id="set">设置到50%</span>
		<span class="layui-btn" id="load">模拟加载</span>
	</div>
	<br>
	<div style="margin-top: 15px; width:300px">
	  <div class="layui-progress">
	    <div class="layui-progress-bar" lay-percent="70%"></div>
	  </div>
	</div>
</body>
	<script type="text/javascript">
		layui.use(['element','jquery'], function(){
			var element = layui.element;
			var $ = layui.jquery;
			$("#set").click(function(){
				element.progress('demo', '50%');
			})
			$("#load").click(function(){
				var n = 0, timer = setInterval(function(){
						n = n + Math.random()*100|0;  
						if(n>100){
						  n = 100;
						  clearInterval(timer);
						  othis.removeClass(DISABLED);
						}
						element.progress('demo', n+'%');
					  }, 300+Math.random()*1000);
			})
		})
	</script>
</html>