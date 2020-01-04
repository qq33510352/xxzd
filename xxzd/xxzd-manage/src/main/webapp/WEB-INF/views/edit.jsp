<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css" />
		<script src="../../layui/layui.js" type="text/javascript"></script>
	</head>
	<body>
		<div style="width: 50%;padding: 10px;border: #9d9d9d solid 5px;background: #f0f5ff;">
			<form class="layui-form">
				<!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="userName"  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="text" name="password"  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="text" name="email"  lay-verify="required|email" placeholder="必填" autocomplete="off" class="layui-input">
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
					<label class="layui-form-label">角色选择</label>
					<div class="layui-input-block">
						<select name="role" lay-filter="aihao">

						</select>
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
						<button class="layui-btn" lay-submit lay-filter="submits">添加用户</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
				<!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
			</form>
		</div>
		<div style="background: #f3f3f3;">
			<ul id="moduleTree" class="dtree" data-id="0"></ul><!-- 和表格一样指定 渲染目标的id即可 -->
		</div>
	</body>
	<script type="text/javascript">
		layui.extend({
					dtree: 'layui/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
		 }).use(['dtree','layer','jquery'], function() {
			var form = layui.form,
			layer = layui.layer,
			$ = layui.jquery;
			//监听提交
			form.on('submit(submits)', function(data){
				  // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				  // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				  $.post("/user/addUser",data.field,function(r){
					  console.log(r)
					  layer.msg("OJBK")
				  })
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
			$("[name='userName']").blur(function(){
				//检查用户名是否存在
				isExists("user_name",$(this))
			});//失去焦点时验证
			$("[name='email']").blur(function(){
				//检查用户名是否存在
				isExists("email",$(this))
			});//失去焦点时验证
			
			
			//检查指定信息是否存在的方法
			function isExists(column,data){
				var value = data[0].value;
				console.log(column,value)
				$.get("/user/isExists",{"column":column,"value":value},function(r){
					if(r.code==0){
						if(r.data){
							layer.msg(value+"可以使用",{icon:1})
						}else{
							layer.msg(value+"已被使用",{icon:2})
						}
					}else{
						layer.alert("服务器繁忙",{icon:2})
					}
				})
				//查询服务器
			}
			
			
			var dtree = layui.dtree, layer = layui.layer, $ = layui.jquery;
			
			// 初始化树
			var DemoTree = dtree.render({
			  elem: "#moduleTree",
			  line: true,//开启树线
			  load: true,//加载遮罩，开启后，初始化加载和加载子节点时，会出现遮罩层
			  skin: "layui",
			  checkbarType: "p-casc",//父级选中子集全选，子集无法改变父级选中状态
			  cache: true,//开启缓存 数据缓存，开启后，当节点收缩后展开时，不会重新访问url。
			  url: "/role/getModuleTree" ,// 使用url加载（可与data加载同时存在）
			  dataStyle: "layuiStyle",  //使用layui风格的数据格式
			  dataFormat: "list",  //配置data的风格为list
			  menubar:true,
			  toolbarShow:	["add","edit","delete"],
			  menubarFun: {
				  remove: function(checkbarNodes){ // 必须将该方法实现了，节点才会真正的从后台删除哦
					console.log(checkbarNodes)
					var ids = [];//将所有节点遍历到这里面然后传到后台删除
					for (var i = 0; i < checkbarNodes.length; i++) {
						ids[i] = parseInt(checkbarNodes[i].nodeId);
					}
					var url = "/module/deleteModuleByIds";
					//格式一定要  ids:1,2,3xxxx
					$.post(url,{"ids":ids.toString()},function(r){
						if(r.code==0){
							return true;
						}else{
							return false;
						}
					})
					//url: module/deleteModuleByIds
				  }
			  },
			  checkbar:true, //开启复选框
			  response: {message:"msg",statusCode:0}  //修改response中返回数据的定义
			});
			
		})
	</script>
</html>
