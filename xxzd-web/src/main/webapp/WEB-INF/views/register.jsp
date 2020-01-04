<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
</head>
<body style="background: url(../../images/四月是你的谎言3.jpg) 100% no-repeat;height: 50px;">
			<!-- layui-col-md6 电脑上时12/6     layui-col-xs6 手机上时12/6   layui-col-sm6 平板上时12/6   -->
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 150px;text-align: center;font-size: 200px;">
				<legend>馨香之都账号注册</legend>
			</fieldset>
				<div style="height: 200px;width: 500px;padding: 50px;margin: auto">
					<form class="layui-form" action="" method="post">
							<div class="layui-form-item">
								<div class="layui-inline">
									<label class="layui-form-label" style="font-size: 10px">用户名<span class="layui-icon" style="font-size: 30px;">&#xe66f;</span></label>
									<div class="layui-input-inline">
										<input type="tel" id="name" name="name" autocomplete="off" class="layui-input">
										<!-- lay-verify="required|phone表单验证 非空且为手机号 -->
									</div>
									<span id="userAle" style="display: none;" class="layui-btn"></span>
									<br>
								<div class="layui-inline">
									<label class="layui-form-label" style="font-size: 10px">密码<span class="layui-icon" style="font-size: 30px;">&#xe673;</span></label>
									<div class="layui-input-inline">
										<input type="text" id="password" name="password" maxlength="16" autocomplete="off" class="layui-input">
									</div>
									<span id="pwdAle" style="display: none;" class="layui-btn"></span>
								</div><br>
								<div class="layui-inline">
									<label class="layui-form-label" style="font-size: 10px">确认密码<span class="layui-icon" style="font-size: 30px;">&#xe673;</span></label>
									<div class="layui-input-inline">
										<input type="text" id="cfpassword" name="cfpassword" autocomplete="off" class="layui-input">
									</div>
									<span id="cfpwdAle" style="display: none;" class="layui-btn"></span>
								</div><br>
								<div class="layui-inline">
									<label class="layui-form-label" style="font-size: 10px">邮箱<span class="layui-icon" style="font-size: 30px;">&#xe609;</span></label>
									<div class="layui-input-inline">
										<input type="text" id="email" name="email" autocomplete="off" class="layui-input">
									</div>
									<span id="emailAle" style="display: none;" class="layui-btn"></span>
								</div>
							</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<!--  lay-submit=""必须要加  要不然 没有验证的效果 和 提交时异步提交的效果  会直接跳转 -->
								<button type="submit" class="layui-btn" style="margin-left: 6%;" lay-filter="submits" lay-submit="">注册</button>
								<button type="reset" id="reset" class="layui-btn layui-btn-primary" style="margin-left: 20px;">重置</button>
								<span style="margin-left: 25px;">
								已有账号?<a href="login" id="login" style="text-decoration: none; font-size: 20px;">登录</a>
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
	  //弱
      var week = /^([a-zA-Z]){6,16}$|^(\d){6,16}$|^((?=[\x21-\x7e]+)[^A-Za-z0-9]){6,16}$|^(?!\2+$)(?!\1+$)[\2\1]{6,7}$|^(?!\3+$)(?!\1+$)[\3\1]{6,7}$|^(?!\3+$)(?!\2+$)[\2\3]{6,7}$|^(?=.*\3)(?=.*\1)(?=.*\2)[a-zA-Z\x21-\x7e\d]{6,7}$/;  
	  //中：字母+数字  
	  var middle = /^(?!\d+$)(?![a-zA-Z]+$)[\dA-Za-z]{8,16}$/;  
	  //强  
	  var strong = /^(?=.*((?=[\x21-\x7e]+)[^A-Za-z0-9]))(?=.*[a-zA-Z])(?=.*[0-9])[^\u4e00-\u9fa5]{8,16}$/;
	  //邮箱
	  var email = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	  $.getCookie("XXZD_")
	  $("#login").click(function(){
		  location.href="login";
	  })
	  $("#name").blur(function(){
	  		var obj = $(this)
	  		if(/^[a-zA-z]\w{3,15}$/.test(obj.val())){
				isExists(obj,1)
	  		}else{
				$("#userAle").html("")
				$("#userAle").hide()
	  			layer.tips("用户名字母开头,可以包含,字母,数字,下划线,4-16位",obj,{tips:2})//{tips:3}为方向  可以只有一个参数
	  		}
	  })
	  $("#reset").click(function(){
		  $("#pwdAle").html("")
		  $("#pwdAle").hide()
		  $("#userAle").html("")
		  $("#userAle").hide()
		  $("#cfpwdAle").html("")
		  $("#cfpwdAle").hide()
		  $("#emailAle").html("")
		  $("#emailAle").hide()
	  })
	  $("#password").bind("input propertychange",function(event){
	       var obj = $(this);
	       if(week.test(obj.val())){
	       	$("#pwdAle").prop("class","layui-btn layui-btn-danger")
	       	$("#pwdAle").html("弱")
	       	$("#pwdAle").show()
	       	// cfgPass()
	       }else if(middle.test(obj.val())){
	       	$("#pwdAle").prop("class","layui-btn layui-btn-warm")
	       	$("#pwdAle").html("中")
	       	$("#pwdAle").show()
	       	// cfgPass()
	       }else if(strong.test(obj.val())){
	       	$("#pwdAle").prop("class","layui-btn layui-btn-normal")
	       	$("#pwdAle").html("强")
	       	$("#pwdAle").show()
	       	// cfgPass()
	       }else{
	       	$("#pwdAle").hide()
	       	$("#pwdAle").html("")
	       	$("#pwdAle").hide()
	       	cfgPass()
	       	// layer.tips("密码强度太弱",obj,{tips:2,anim:6})//{tips:3}为方向  可以只有一个参数
	       }
	  });
	  // $("#password").change(function(){
	  // 		var obj = $(this);
			// if(week.test(obj.val())){
			// 	$("#pwdAle").prop("class","layui-btn layui-btn-danger")
			// 	$("#pwdAle").html("弱")
			// 	$("#pwdAle").show()
			// 	cfgPass()
			// }else if(middle.test(obj.val())){
			// 	$("#pwdAle").prop("class","layui-btn layui-btn-warm")
			// 	$("#pwdAle").html("中")
			// 	$("#pwdAle").show()
			// 	cfgPass()
			// }else if(strong.test(obj.val())){
			// 	$("#pwdAle").prop("class","layui-btn layui-btn-normal")
			// 	$("#pwdAle").html("强")
			// 	$("#pwdAle").show()
			// 	cfgPass()
			// }else{
			// 	$("#pwdAle").hide()
			// 	$("#pwdAle").html("")
			// 	$("#pwdAle").hide()
			// 	cfgPass()
	  // 			layer.tips("密码强度太弱",obj,{tips:2,anim:6})//{tips:3}为方向  可以只有一个参数
	  // 		}
	  // })
	  $("#cfpassword").blur(function(){
			cfgPass()
	  })
	  function cfgPass(){
		  if($("#pwdAle").html()){
		  	if( $("#cfpassword").val()==$("#password").val()){
		  		$("#cfpwdAle").prop("class","layui-btn layui-btn-normal")
		  		$("#cfpwdAle").html("密码一致")
		  		$("#cfpwdAle").show()
		  	}else{
		  		layer.tips("两次密码不一致",$("#cfpassword"),{tips:2,anim:6})//{tips:3}为方向  可以只有一个参数
		  		$("#cfpwdAle").html("")
		  		$("#cfpwdAle").hide()
		  	}
		  }else{
		  	$("#cfpwdAle").html("")
		  	$("#cfpwdAle").hide()
		  }
	  }
	  $("#email").blur(function(){
		var obj = $(this)
		if(email.test(obj.val())){
			isExists(obj,3);
		}else{
			layer.tips("请输入正确的邮箱",obj,{tips:2})//{tips:3}为方向  可以只有一个参数
			$("#emailAle").html("")
			$("#emailAle").hide()
		}
	  })
	  
	  function isExists(obj,type){
		  var val=obj.val()
			if(val){
				$.ajax({
					url : "http://sso.xxzd.com/user/check/"+val+"/"+type+"?r=" + Math.random(),
					dataType : "jsonp",
					success:function (data){   //data经过jQuery封装返回就是json串
						if(data.code==0){
							console.log(data,{icon:2})
							if(data.data){
								layer.tips(val+"已经被使用",obj,{tips:2})//{tips:3}为方向  可以只有一个参数
								if(type==1){
									$("#userAle").html("")
									$("#userAle").hide()
								}else if(type==3){
									$("#emailAle").html("")
									$("#emailAle").hide()
								}
							}else{
								// layer.tips(val+"可以使用",obj,{tips:2})//{tips:3}为方向  可以只有一个参数
								if(type==1){
									$("#userAle").prop("class","layui-btn layui-btn-normal")
									$("#userAle").html("可以使用")
									$("#userAle").show()
								}else if(type==3){
									$("#emailAle").prop("class","layui-btn layui-btn-normal")
									$("#emailAle").html("可以使用")
									$("#emailAle").show()
								}
							}
						}else{
							layer.msg("服务器繁忙",{icon:2})
							if(type==1){
								$("#userAle").html("")
								$("#userAle").hide()
							}else if(type==3){
								$("#emailAle").html("")
								$("#emailAle").hide()
							}
						}
					}	
				});
			}
		}	
		form.on('submit(submits)', function(data){
			  var flag = true;
			  if(!$("#emailAle").html()){
			  				  layer.tips("邮箱有误",$("#email"),{tips:2,anim:6})
			  				  flag = false;
			  }
			 if(!$("#cfpwdAle").html()){
			 				  layer.tips("密码不一致",$("#cfpassword"),{tips:2,anim:6})
			 				  flag = false;
			 }
			  if(!$("#userAle").html()){
				  layer.tips("账号有误",$("#name"),{tips:2,anim:6})
				  flag = false;
			  }
			  if(flag){
				  $.post("/user/register",data.field,function(r){
					  if(r.code==0){
						  layer.msg("注册成功")
						  $("#reset").click()
					  }else{
						  layer.msg("服务器异常")
					  }
				  })
			  }
			  return false; //阻止表单跳转。如果需要表单跳转，去掉这
		})
	})
			
	 
		
</script>
</html>