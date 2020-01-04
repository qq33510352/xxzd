<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../layui/layui.js" type="text/javascript">
</script>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css" />
</head>
<body>
	<!-- layui-form
			|--layui-form-item
				|--layui-form-label
				|--layui-input-block
					|--layui-input-->
	<!-- 下拉过滤lay-search=""   复选框  lay-skin="primary" 使用原始样式
			开关使用checkbox实现   lay-skin="switch" 使用开关皮肤 lay-text="杜蕾斯ON|杜蕾斯OFF" 显示文字
			下拉  多选  复选 引入form 富文本layedit  需要重新渲染-->		
	<!-- 这里要切换整体样式的话 可以在 主体上加  layui-form-pane-->
	<form class="layui-form" action="" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">测试</label>
			<div class="layui-input-block">
				<input type="password" class="layui-input"/>
				<select class="layui-input">
					<option value="">213123</option>
					<option value="">435</option>
					<option value="">43543543</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">单行输入框</label>
			<div class="layui-input-block">
				<input type="text" name="title" lay-verify="title"
					autocomplete="off" placeholder="请输入标题" class="layui-input">
				<!--输入框元素 -->
			</div>
		</div>
		<div class="layui-form-item">
			<!-- 表单项 -->
			<label class="layui-form-label">验证必填项</label>
			<!-- 标签 -->
			<div class="layui-input-block">
				<!-- 块元素 -->
				<!--非空验证-->
				<input type="password" name="username" lay-verify="required"
					lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">验证手机</label>
				<div class="layui-input-block">
					<input type="tel" name="phone" 									
						autocomplete="off" class="layui-input">
				</div>
			</div>												<!-- lay-verify="required|phone"手机号验证  lay-verify="email" 邮箱验证  -->
			<div class="layui-inline">
				<label class="layui-form-label">验证邮箱</label>
				<div class="layui-input-block">
					<input type="text" name="email" lay-verify="email"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		
		 <div class="layui-form-item layui-inline">
		     <label class="layui-form-label">选择框</label>
		     <div class="layui-input-block">
		       <select name="interest" lay-filter="aihao">
		         <option value=""></option>
		         <option value="0">写作</option>
		         <option value="1">阅读</option>
		         <option value="2">游戏</option>
		         <option value="3">音乐</option>
		         <option value="4">旅行</option>
		       </select>
		     </div>
		   </div>
		   <div class="layui-form-item layui-inline">
		       <label class="layui-form-label">搜索选择框</label>
		       <div class="layui-input-block">
		         <select name="interest" lay-filter="aihao" lay-search=""><!-- 搜索框可以搜索 lay-search="" -->
		           <option value=""></option>
		           <option value="0">写作</option>
		           <option value="1">阅读</option>
		           <option value="2">游戏</option>
		           <option value="3">音乐</option>
		           <option value="4">旅行</option>
		         </select>
		       </div>
		     </div>
			 
		 <div class="layui-form-item">
			 <label class="layui-form-label">复选框</label>
			 <div class="layui-input-block">
			   <input type="checkbox" name="like[write]" title="写作">
			   <input type="checkbox" name="like[read]" title="阅读" checked="">
			   <input type="checkbox" name="like[game]" title="游戏">
			 </div>
		   </div>
		   
		   <div class="layui-form-item" pane="">
		       <label class="layui-form-label">原始复选框</label>
		       <div class="layui-input-block">
		         <input type="checkbox" name="like1[write]" lay-skin="primary" title="写作" checked="">
		         <input type="checkbox" name="like1[read]" lay-skin="primary" title="阅读">
		         <input type="checkbox" name="like1[game]" lay-skin="primary" title="游戏" disabled="">
		       </div>
		     </div>
			 
			 
			   <div class="layui-form-item">
			     <label class="layui-form-label">开关-默认关</label>
			     <div class="layui-input-block">
			       <input type="checkbox" name="close" lay-skin="switch" lay-text="杜蕾斯ON|杜蕾斯OFF"><!-- 文本内容 -->
			     </div>
			   </div>
			   
			     <div class="layui-form-item">
			       <label class="layui-form-label">开关-默认开</label>
			       <div class="layui-input-block">
			         <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
			       </div>
			     </div>
				 
				   <div class="layui-form-item layui-form-text">
				     <label class="layui-form-label">编辑器</label>
				     <div class="layui-input-block">
				       <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
				     </div>
				   </div>
	</form>



	<script type="text/javascript">
		layui.use(['form', 'layedit', 'laydate','layedit'],function(){
			var layedit = layui.layedit;
			  layedit.build('LAY_demo_editor'); //建立编辑器
		})
		
	</script>
</body>
</html>