<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
</head>
<body style="background: url(../../images/cat.jpg);">
			<!-- layui-col-md6 电脑上时12/6     layui-col-xs6 手机上时12/6   layui-col-sm6 平板上时12/6   -->
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 150px;text-align: center;font-size: 200px;">
				<legend>馨香之都账号注册</legend>
			</fieldset>
				<div style="height: 200px;width: 500px;padding: 50px;background: #999999;margin: auto">
					<form class="layui-form" action="" method="post">
							<div class="layui-form-item">
								<div class="layui-inline">
									<label class="layui-form-label" style="font-size: 10px">用户名<span class="layui-icon" style="font-size: 30px;">&#xe66f;</span></label>
									<div class="layui-input-inline">
										<input type="tel" name="username" lay-verify="username"<!-- lay-verify="required|phone表单验证 非空且为手机号 -->
											autocomplete="off" class="layui-input">
									</div><br>
								<div class="layui-inline">
									<label class="layui-form-label" style="font-size: 10px">密码<span class="layui-icon" style="font-size: 30px;">&#xe673;</span></label>
									<div class="layui-input-inline">
										<input type="text" name="password" lay-verify="password"
											autocomplete="off" class="layui-input">
									</div>
								</div><br>
								<div class="layui-inline">
									<label class="layui-form-label" style="font-size: 10px">确认密码<span class="layui-icon" style="font-size: 30px;">&#xe673;</span></label>
									<div class="layui-input-inline">
										<input type="text" name="password" lay-verify="password"
											autocomplete="off" class="layui-input">
									</div>
								</div><br>
								<div class="layui-inline">
									<label class="layui-form-label" style="font-size: 10px">邮箱<span class="layui-icon" style="font-size: 30px;">&#xe609;</span></label>
									<div class="layui-input-inline">
										<input type="text" name="email" lay-verify="email"
											autocomplete="off" class="layui-input">
									</div>
								</div>
							</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<!--  lay-submit=""必须要加  要不然 没有验证的效果 和 提交时异步提交的效果  会直接跳转 -->
								<button type="submit" class="layui-btn" style="margin-left: 6%;" lay-filter="submits" lay-submit="">注册</button>
								<button type="reset" class="layui-btn layui-btn-primary" style="margin-left: 20px;">重置</button>
								<span style="margin-left: 25px;">
								已有账号?<a href="#" style="text-decoration: none; font-size: 20px;">登录</a>
								</span>
							</div>
						</div>
					</form>
				</div>
</body>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
	layui.use(['form', 'layedit', 'laydate','jquery'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate
	  ,$ = layui.jquery;
	  
	  form.on('submit(submits)', function(data){
	  	 console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
	  	  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
	  	  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
	  	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	  })
	  
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
	})
	
	
</script>
</html>