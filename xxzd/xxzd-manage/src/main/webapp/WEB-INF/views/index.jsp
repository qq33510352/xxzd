<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>馨香之都</title>
		<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="../../layui/layui_ext/dtree/dtree.css"/>
		<link rel="stylesheet" type="text/css" href="../../layui/layui_ext/dtree/font/dtreefont.css"/>
	</head>
	<body class="layui-layout-body">
		<div id="submits" style="text-align:center;display: none;padding: 5px;border: #9d9d9d solid 5px;background: #f0f5ff;">
			<form id="editform" lay-filter="editform" class="layui-form">
				<!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
				<input type='hidden' name="id" id='hiddenIn' />
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="text" name="password" lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="text" name="email" lay-verify="required|email" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-block">
						<input type="text" name="mobile" placeholder="选填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">经验</label>
					<div class="layui-input-block">
						<input type="text" name="exp" placeholder="选填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">金</label>
					<div class="layui-input-block">
						<input type="text" name="gold" placeholder="选填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">地址</label>
					<div class="layui-input-block">
						<input type="text" name="addr" placeholder="选填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">单选框</label>
					<div class="layui-input-block" id="roleSelect">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">单选框</label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="男" title="男">
						<input type="radio" name="sex" value="女" title="女" checked>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否禁用</label>
					<div class="layui-input-block">
						<input type="radio" name="valid" value="0" title="禁用">
						<input type="radio" name="valid" value="1" title="启用" checked>
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">个人描述</label>
					<div class="layui-input-block">
						<textarea name="intro" placeholder="选填" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn layui-icon iconok" lay-submit lay-filter="submits">提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
				<!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
			</form>
		</div>
		<!-- 表单2 -->
		<div id="rolesubmits" style="height: 100%;text-align:center;display: none;padding: 5px;border: #9d9d9d solid 5px;">
			<form id="roleeditform" lay-filter="roleeditform" class="layui-form">
				<!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
				<input type='hidden' name="id" id='hiddenIn' />
				<div class="layui-form-item">
					<label class="layui-form-label">角色名</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">角色描述</label>
					<div class="layui-input-block">
						<input type="text" name="explained" lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<label class="layui-form-label">父节点</label>
				<div class="layui-form-item layui-form-text">
					<!-- 和表格一样指定 渲染目标的id即可 -->
					<ul id="moduleTree" class="dtree" data-id="0"></ul>
				</div>
				<div class="layui-form-item">
				.	<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="rolesubmits">提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
				<!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
			</form>
		</div>
		<!-- 表单3 -->
		<div id="Modulesubmits" style="height: 100%;text-align:center;display: none;padding: 5px;border: #9d9d9d solid 5px;">
			<form id="Moduleditform" lay-filter="Moduleditform" class="layui-form">
				<!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
				<input type='hidden' name="id" id='treeHidden' />
				<div class="layui-form-item">
					<label class="layui-form-label">模块名</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">权限</label>
					<div class="layui-input-block">
						<input type="text" name="permission" lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">模块描述</label>
					<div class="layui-input-block">
						<input type="text" name="intro" lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<label class="layui-form-label">父节点选择</label>
				<div class="layui-form-item layui-form-text">
					<!-- 和表格一样指定 渲染目标的id即可 -->
					<ul id="moduleTree2" class="dtree" data-id="0"></ul>
				</div>
				<div class="layui-form-item">
				.	<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="Modulesubmits">提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
				<!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
			</form>
		</div>
		<!-- <div class="layui-layout layui-layout-admin"> -->

			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree layui-nav-side" style="background:url(../../images/77734148_p0.jpg);" lay-filter="test">
						<li class="layui-nav-item"><a href="javascript:;"><span><img style="width: 40%;height: 100%;" src="../../images/DIO.png" >是我DIO!哒!</span></a>
						</li> <!-- 如果不是a标签的话没有触碰效果-->
						<li class="layui-nav-item layui-nav-itemed">
							<a href="javascript:;">用户管理</a>
							<dl class="layui-nav-child">
								<dd><a class="list" href="javascript:;" name="user_list">用户管理</a></dd>
								<dd><a class="list" href="javascript:;" name="role_list">角色管理</a></dd>
								<dd><a class="list" href="javascript:;" name="module_list">模块管理</a></dd>
								<dd><a class="list" href="javascript:;" name="log_list">日志管理</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="javascript:;">论坛管理</a>
							<dl class="layui-nav-child">
								<dd><a class="list" href="javascript:;">帖子管理</a></dd>
								<dd><a class="list" href="javascript:;">评论管理</a></dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<div class="layui-body" id="bgbody" style="background: url(../../images/77734148_p0.jpg);width: 100%;background-position: bottom;">
				<!-- url(../../images/cat.jpg)-->
				<!-- 内容主体区域 -->
				<div style="padding: 15px;width: 80%;">
					<!-- 此处的大小决定了表的大小  主体部分 -->
					<table id="main" lay-filter="tableBody"></table>
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
						<legend style="font-size: 20px;">馨香之都 - 为了那个梦想我们扬帆起航 - 为了理应到来的的那一天跨无尽黑暗</legend>
					</fieldset>
					<!-- 一个暗藏的Table -->
					<table class="layui-table layui-form" id="tree-table" lay-size="sm"></table>
				</div>
			</div>
			<!-- <div class="layui-footer" style="background:url(../../images/1490082044583.jpg);"> -->
				<!-- 底部固定区域 -->
				<!-- © 馨香之都后台管理
			</div> -->
			<!-- 一些隐藏div -->
			<div class="layui-btn-group" style="display: none;" id="toolbar">
				<button type="button" class="layui-btn" lay-event="add">添加用户</button>
				<button type="button" class="layui-btn" lay-event="deletes">批量删除</button>
				<button type="button" class="layui-btn layui-icon layui-icon-refresh" lay-event="reload"></button>
				<div class="layui-inline">
					<input type="text" style="text-align: center;" id="search" placeholder="搜索" class="layui-input">
				</div>
				<button type="button" class="layui-btn layui-icon layui-icon-search" lay-event="search"></button>
			</div>
			
			<div class="layui-btn-group" style="display: none;" id="logtoolbar">
				<button type="button" class="layui-btn" lay-event="deletes">批量删除</button>
				<button type="button" class="layui-btn layui-icon layui-icon-refresh" lay-event="reload"></button>
				<div class="layui-inline">
					<input type="text" style="text-align: center;" id="search" placeholder="搜索" class="layui-input">
				</div>
				<button type="button" class="layui-btn layui-icon layui-icon-search" lay-event="search"></button>
			</div>
			
			<div class="layui-btn-group" style="display: none;" id="rooletoolbar">
					<button type="button" class="layui-btn-warm layui-btn layui-icon layui-icon-refresh" lay-event="reload"></button>
					<div class="layui-inline">
						<input type="text" style="text-align: center;" id="search" placeholder="搜索" class="layui-input">
					</div>
					<button type="button" class="layui-btn layui-btn-warm layui-icon layui-icon-search" lay-event="search"></button>
					<button type="button" class="layui-btn layui-btn-warm" lay-event="add">添加角色</button>
			</div>
			<div style="display: none;" id="userbar">
				<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
				<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			</div>
			<div style="display: none;" id="logbar">
				<a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
			</div>
			<div style="display: none;" id="rolebar">
				<a class="layui-btn  layui-btn-warm layui-btn-sm" lay-event="edit">修改</a>
				<a class="layui-btn  layui-btn-warm layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
			</div>
			<script type="text/html" id="switchTpl">
				<input type="checkbox" name="禁用" value="{{d.id}}" lay-skin="switch" lay-text="禁用|启用" lay-filter="validBox" {{ d.valid == 1 ? 'checked' : '' }}>
			</script>
		<!-- </div> -->
		<script src="../../layui/layui.js"></script>
		<script src="../../js/jquery-3.4.1.min.js"></script>
		<script>
			//JavaScript代码区域
			layui.use('element', function() {
				var element = layui.element;
			});
			$(".list").click(function() {
				var url = $(this).prop("name") //请求地址
				$("#main").load(url)
			}) //通过后代选择器 选择所有的 列表 直接加载对应的列表
		</script>
	</body>
</html>
