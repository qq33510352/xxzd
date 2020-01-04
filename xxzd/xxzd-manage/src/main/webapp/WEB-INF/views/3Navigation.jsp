<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span class="layui-btn layui-btn-primary layui-btn-lg layui-icon layui-icon-404 layui-btn-radius"></span>
	              
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	  <legend>水平导航菜单</legend>
	</fieldset>
	<ul class="layui-nav"><!-- layui-nav指定导航栏 -->
	  <li class="layui-nav-item"><a href="">最新活动</a></li><!-- layui-nav-item指定导航栏元素 -->
	  <li class="layui-nav-item layui-this"><!-- layui-this指定选中的导航栏 -->
	    <a href="javascript:;">产品</a>
	    <dl class="layui-nav-child"><!-- layui-nav-child指定 一个 导航栏的子元素集 -->
	      <dd><a href="">选项1</a></dd>
	      <dd><a href="">选项2</a></dd>
	      <dd><a href="">选项3</a></dd>
	    </dl>
	  </li>
	  <li class="layui-nav-item"><a href="">大数据</a></li>
	  <li class="layui-nav-item">
	    <a href="javascript:;">解决方案</a>
	    <dl class="layui-nav-child">
	      <dd><a href="">移动模块</a></dd>
	      <dd><a href="">后台模版</a></dd>
	      <dd class="layui-this"><a href="">选中项</a></dd>
	      <dd><a href="">电商平台</a></dd>
	    </dl>
	  </li>
	  <li class="layui-nav-item"><a href="">社区</a></li>
	</ul>
	
	<ul class="layui-nav layui-bg-red">
		<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			<dl class="layui-nav-child">
				<dd><a>1</a></dd>
				<dd class="layui-this"><a>2</a></dd>
				<dd><a>3</a></dd>
			</dl>
		</li>
		<li class="layui-nav-item layui-this"><a href="javascript:;">用户管理</a></li>
		<li class="layui-nav-item"><a href="javascript:;">用户管理</a></li>
		<li class="layui-nav-item"><a href="javascript:;"><span class="layui-icon" style="font-size: 50px;">&#xe677</span></a>
			<dl class="layui-nav-child">
				<dd><a>个人中心</a></dd>
				<dd><a>邮箱</a></dd>
				<dd><a>成为VIP</a></dd>
			</dl>
		</li> <!-- 如果不是a标签的话没有触碰效果-->
	</ul>
	
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	  <legend>水平导航菜单</legend>
	</fieldset>
	
	<ul class="layui-nav layui-nav-tree"><!-- layui-nav指定导航栏 -->
	  <li class="layui-nav-item layui-icon layui-icon-about"><a href="">最新活动</a></li><!-- layui-nav-item指定导航栏元素 -->
	  <li class="layui-nav-item layui-this"><!-- layui-this指定选中的导航栏 -->
	    <a href="javascript:;">产品</a>
	    <dl class="layui-nav-child"><!-- layui-nav-child指定 一个 导航栏的子元素集 -->
	      <dd><a href="">选项1</a></dd>
	      <dd><a href="">选项2</a></dd>
	      <dd><a href="">选项3</a></dd>
	    </dl>
	  </li>
	  <li class="layui-nav-item"><a href="">大数据</a></li>
	  <li class="layui-nav-item">
	    <a href="javascript:;">解决方案</a>
	    <dl class="layui-nav-child">
	      <dd><a href="">移动模块</a></dd>
	      <dd><a href="">后台模版</a></dd>
	      <dd class="layui-this"><a href="">选中项</a></dd>
	      <dd><a href="">电商平台</a></dd>
	    </dl>
	  </li>
	  <li class="layui-nav-item"><a href="">社区</a></li>
	</ul>
</body>
	<script src="../../layui/layui.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
	<script type="text/javascript">
		layui.use(["layer","jquery","element"],function(){//layer 带了 jquery 需要use指定后才能用  如果要用导航这块需要 use导入 elment
			var layer = layui.layer;
			layer.msg("2333")
			var $ = layui.jquery;
			var element = layui.element;
			$("span").click(function(){
				layer.msg("666")
			})
		})//数组里写 要用的组件可以有多个 然后在function里 layui.xxx  直接获取对象
	</script>
</html>