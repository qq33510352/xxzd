<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../layui/css/layui.css" media="all">
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

	<blockquote class="layui-elem-quote layui-text">
		鉴于小伙伴的普遍反馈，先温馨提醒两个常见“问题”：1. <a href="/doc/base/faq.html#form"
			target="_blank">为什么select/checkbox/radio没显示？</a> 2. <a
			href="/doc/modules/form.html#render" target="_blank">动态添加的表单元素如何更新？</a>
	</blockquote>

	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>表单集合演示</legend>
	</fieldset>
							<!-- 用于数据初始化的选择 -->
	<form class="layui-form" lay-filter="form1" action="">

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">验证手机</label>
				<div class="layui-input-inline">
					<input type="tel" name="phone" lay-verify="newPhone"<!-- lay-verify="required|phone表单验证 非空且为手机号 -->
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">验证邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="email" lay-verify="email"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">单行选择框</label>
			<div class="layui-input-block">
				<select name="hobby" lay-filter="aihao" id="select">
					<option value=""></option>
					<option value="写作">写作</option>
					<option value="阅读" selected="">阅读</option>
					<option value="游戏">游戏</option>
					<option value="音乐">音乐</option>
					<option value="旅行">旅行</option>
				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">复选框</label>
			<div class="layui-input-block">
				<input type="checkbox" lay-filter="checkbox" name="like"
					title="写作"> <input type="checkbox" lay-filter="checkbox"
					name="like" title="阅读"> <input
					type="checkbox" lay-filter="checkbox" name="like" title="游戏">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">开关-默认关</label>
			<div class="layui-input-block">
				<input type="checkbox" lay-filter="switch" name="close"
					lay-skin="switch" lay-text="ON|OFF">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">单选框</label>
			<div class="layui-input-block">
				<input type="radio" lay-filter="radio" name="sex" value="男"
					title="男" checked=""> <input type="radio"
					lay-filter="radio" name="sex" value="女" title="女"> <input
					type="radio" lay-filter="radio" name="sex" value="禁" title="禁用"
					disabled="">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<!--  lay-submit=""必须要加  要不然 没有验证的效果 和 提交时异步提交的效果  会直接跳转 -->
				<button type="submit" class="layui-btn" lay-filter="demo1"
					lay-submit="">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
		<span class="layui-btn layui-btn-primary" id="bt1">添加元素</span>
		<span class="layui-btn layui-btn-primary" id="bt2">初始化值</span>
	</form>

	<script src="../../layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
layui.use(['form', 'layedit', 'laydate','jquery'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,$ = layui.jquery;
  
  //监听提交
  form.on('submit(demo1)', function(data){
	 console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
	  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
	  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
  });
  //监听select
  form.on('select(aihao)', function(data){
    console.log(data.elem); //得到checkbox原始DOM对象
    console.log(data.elem.checked); //是否被选中，true或者false
    console.log(data.value); //复选框value值，也可以通过data.elem.value得到
    console.log(data.othis); //得到美化后的DOM对象
  });   
  //监听checkbox
  form.on('checkbox(checkbox)', function(data){
    console.log(data.elem); //得到checkbox原始DOM对象
    console.log(data.elem.checked); //是否被选中，true或者false
    console.log(data.value); //复选框value值，也可以通过data.elem.value得到
    console.log(data.othis); //得到美化后的DOM对象
  });        
 //监听radio
 form.on('radio(radio)', function(data){
   console.log(data.elem); //得到checkbox原始DOM对象
   console.log(data.elem.checked); //是否被选中，true或者false
   console.log(data.value); //复选框value值，也可以通过data.elem.value得到
   console.log(data.othis); //得到美化后的DOM对象
 });  
 //监听switch
 form.on('switch(switch)', function(data){
   console.log(data.elem); //得到checkbox原始DOM对象
   console.log(data.elem.checked); //是否被选中，true或者false
   console.log(data.value); //复选框value值，也可以通过data.elem.value得到
   console.log(data.othis); //得到美化后的DOM对象
 });  
 //点击按钮  btn1  给select 添加元素 rander
 $("#bt1").click(function(){
	var st = $("select");
	alert(st.html())
	st.append("<option value='4'>"+Math.random()+"</option>");
	alert(st.html());
	// form.render("select");//重新渲染 select  如果是radio则是 radio 或 checkbox
	form.render();//全部重新渲染
 })
 $("#bt2").click(function(){
	//数据初始化 可以用于 编辑  数据回显
	form.val("form1",{
		phone:"12345678912", //根据input的name选择
		email:"123123@qq.com",
		hobby:'音乐',//下拉框根据value来选择
		close:true,
		sex:"女"//多个sex 直接指定值即可
	})
	var as = ["写作","游戏"];
	var likes = $("[name=like]")
	//遍历likes  如果哪个上面有 as里面的元素 则选中
	$.each(likes,function(index,obj){
		 obj = $(obj)
		 var title = obj.prop("title")
		$.each(as,function(i,a){
			if(title==a)obj.prop("checked",true)
		})
	})
	form.render();
 })
 //表单认证 1 通过属性
 // lay-verify="required|phone  非空验证  且为手机号
 // number 数值验证
 // ulr  链接地址验证  http://www/baidu.com
 //表单认证2 自定义认证名
 form.verify({
	 username:[
		 /^[\s]{6,12}$/
		 ,"用户名必须6到12位之间且不能出现空格"
	 ],
	 newPhone:[
		 /^[1](([3|5|8][\\d])|([4][4,5,6,7,8,9])|([6][2,5,6,7])|([7][^9])|([9][1,8,9]))[\\d]{8}$/
		 ,"请输入正确手机号"
	 ]
 })
});
</script>

</body>
</html>