<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
<script type="text/javascript" src="../../layui/layui.js"></script>
</head>
<body>
<div class="layui-btn layui-btn-primary" id="bt1">简单弹窗</div>
<div class="layui-btn layui-btn-primary" id="bt2">认证</div>
<div class="layui-btn layui-btn-primary" id="bt3">输入值</div>
<div class="layui-btn layui-btn-primary" id="bt4">轮播</div>
<div class="layui-btn layui-btn-primary" id="bt5">msg</div>
<div style="align-content: center; height: 500px;padding: 100px;width: 200px;">
	<div class="layui-btn layui-btn-primary" id="bt6">寄生tops</div>
</div>
<div class="layui-btn layui-btn-primary" id="bt7">按钮其一</div>
<script type="text/javascript">
	layui.use(['layer','jquery'],function(){
		var layer = layui.layer;
		var $ = layui.jquery;
		$("#bt1").click(function(){
			layer.alert("一个简单的弹窗")
			layer.alert("一个简单的加了图标的弹窗",{icon:1})//第二个会覆盖第一个   0~7   1勾2X3?4锁5不开心6开心7感叹号
			var index = layer.alert("现在有了回调",function(i){alert(233);layer.close(i)})  //layer的弹窗执行完毕后都会返回一个索引
		})
		$("#bt2").click(function(){
			layer.confirm("点确定不?",{icon:1,title:"点么"},function(i){
				alert("你点了对吧")
				layer.close(i);
			})
		})
		$("#bt3").click(function(){
			// layer.prompt(function(value,index,element){
			// 	alert(value)
			// 	alert(element)
			// 	layer.close(index)
			// })
			layer.prompt({formType:2,value:"初始值",title:"输入值",area:['1000px','500px']},function(value,index,element){
				alert(value)
				layer.close(index)
			})
		})
		$("#bt4").click(function(){
			$.get("json/pthotos.json",function(json){
				alert(123)
				console.log(json)
				layer.pthotos({
					pthotos:json
					,anim:5 //0~6 动画类型 默认随机
				})
			})
		})
		$("#bt5").click(function(){
			layer.msg("一个临时提示")
			layer.msg("一个临时提示",{icon:1})
			layer.msg("一个临时提示",function(){alert(233)})
			layer.msg("一个临时提示",{icon:1,time:2000},function(){alert(123)})//2s后关闭并回调
		})
		$("#bt6").click(function(){
			layer.tips("寄生中~~~>","#bt6",{tips:3})//{tips:3}为方向  可以只有一个参数
		})
	})
</script>
</body>
</html>