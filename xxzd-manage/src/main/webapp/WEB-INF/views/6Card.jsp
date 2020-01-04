<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../layui/layui.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>卡片面板</legend>
</fieldset>   
 
 
	<!-- layui-row代表一行 内容都在 一行
		 layui-col-space15 0-30 代表卡片之间距离
		 |--layui-col-md6 12/6的位置
			|--layui-card 代表一个卡片
				|--layui-card-header 卡头
				|--layui-card-body 卡体-->
	<div style="padding: 20px; background-color: #F2F2F2;">  <!-- "padding: 20px; background-color: #F2F2F2;" 边距为20px 背景颜色为xx-->
	  <div class="layui-row layui-col-space30"> <!-- 设置两列之间间距为30-->
		<div class="layui-col-md6"><!-- 分块为6  共12块 -->
		  <div class="layui-card"><!-- 指定一个卡片面板 -->
			<div class="layui-card-header">卡片面板</div><!-- 卡片面板头部 -->
			<div class="layui-card-body"><!-- 卡片面板身体 -->
			  卡片式面板面板通常用于非白色背景色的主体内<br>
			  从而映衬出边框投影
			</div>
		  </div>
		</div>
		<div class="layui-col-md6">
		  <div class="layui-card">
			<div class="layui-card-header">卡片面板</div>
			<div class="layui-card-body">
			  结合 layui 的栅格系统<br>
			  轻松实现响应式布局
			</div>
		  </div>
		</div>
	  </div>
	</div> 
	<div style="padding: 20px; background-color: #007DDB;">
		<div class="layui-row"><!-- 加上这个申明后才是一行 -->
			<div class="layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header">
						我是卡头<span class="layui-icon layui-icon-female"></span>
					</div>
					<div class="layui-card-body">
						我是卡体<br>我是卡体<br>我是卡体
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- layui-collapse 申明一个折叠面板 
			|--layui-colla-item 申明一个折叠项
				|--layui-colla-title 申明折叠项标题
				|--layui-colla-content 申明折叠项内容
					|--layui-show 默认展开-->
	<div class="layui-collapse">
		<div class="layui-colla-item">
			<div class="layui-colla-title">
				标题
			</div>
			<div class="layui-colla-content">
				内容22222222222
				内容22222222222
			</div>
		</div>
		<div class="layui-colla-item">
			<div class="layui-colla-title">
				标题2
			</div>
			<div class="layui-colla-content layui-show">
				内容22222222222
				内容22222222222
			</div>
		</div>
	</div>
	<!-- lay-accordion=""普通面板加这个属性变为手风琴面板 -->
	<div class="layui-collapse" lay-accordion="" lay-filter="233">
		<div class="layui-colla-item">
			<div class="layui-colla-title">
				标题
			</div>
			<div class="layui-colla-content">
				内容22222222222
				内容22222222222
			</div>
		</div>
		<div class="layui-colla-item">
			<div class="layui-colla-title">
				标题2
			</div>
			<div class="layui-colla-content layui-show">
				内容22222222222
				内容22222222222
			</div>
		</div>
	</div>
	<script type="text/javascript">
		layui.use(['element'],function(){
			var element = layui.element;
			element.on('collapse("233")', function(data){
			  console.log(data.show); //得到当前面板的展开状态，true或者false
			  console.log(data.title); //得到当前点击面板的标题区域DOM对象
			  console.log(data.content); //得到当前点击面板的内容区域DOM对象
			});
		})
	</script>
</body>
</html>