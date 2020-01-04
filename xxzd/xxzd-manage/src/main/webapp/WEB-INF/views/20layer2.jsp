<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css" />
		<script type="text/javascript" src="../../layui/layui.js"></script>
		<style type="text/css">
			body .demo-class .layui-layer-title {
				background: #39ff92;
				color: #f7ff4f;
				border: none;
			}

			body .demo-class .layui-layer-btn {
				border-top: 1px solid #E9E7E7
			}

			body .demo-class .layui-layer-btn a {
				background: #333;
			}

			body .demo-class .layui-layer-btn .layui-layer-btn1 {
				background: #999;
			}
		</style>
	</head>
	<body>
	<div id="bts">
		<div class="layui-btn layui-btn-primary" id="bt1">open1</div>
		<div class="layui-btn layui-btn-primary" id="bt2">open2</div>
		<div class="layui-btn layui-btn-primary" id="bt3">open3</div>
		<div class="layui-btn layui-btn-primary" id="bt4">open4</div>
		<div class="layui-btn layui-btn-primary" id="bt5">open5</div>
		<div class="layui-btn layui-btn-primary" id="bt6">open6</div>
		<div class="layui-btn layui-btn-primary" id="bt7">open7</div>
	</div>
		<script type="text/javascript">
			layui.use(['layer', 'jquery'], function() {
				var layer = layui.layer;
				var $ = layui.jquery;
				$("#bt1").click(function() {
					var index = layer.open({
						type: 0, //默认为0    1是页面层   2是ifream层
						title: '我是标题', //标题
						content: '传入任意的文本或html', //这里content是一个普通的String  弹窗内容  type=0时的内容
						skin: 'layui-layer-lan', //layui-layer-lan layui-layer-molv
						// area: '600px'//如果只设置了宽 高度自适应
						area: ['600px', '400px'],
						// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
						icon: 1, //图标只有在type0时有效
						btn: ['按钮一', '按钮二', '按钮三'],
						yes: function(index, layero) {
							//按钮【按钮一】的回调
							alert("你點了按鈕1")
						},
						btn2: function(index, layero) {
							//按钮【按钮二】的回调
							//return false 开启该代码可禁止点击该按钮关闭
							alert("你點了按鈕2")
						},
						btn3: function(index, layero) {
							//按钮【按钮三】的回调
							//return false 开启该代码可禁止点击该按钮关闭
							alert("你點了按鈕3")
						},
						cancel: function() {
							//右上角关闭回调
							//return false 开启该代码可禁止点击该按钮关闭
							alert("你點了关闭")
						},
						btnAlign: 'c', //按钮居中对齐
						closeBtn: 2, //- 关闭按钮有1和2 默认1
						shade: [0.8, '#393D49'], //遮罩
						shadeClose: true, //点击遮罩关闭弹窗
						anim: 4, //动画类型
						maxmin: true, //是否显示最大化最小化 type12有效
						success: function(layero, index) {//层创建完毕后执行此代码
							console.log(layero, index);
							alert("我来了 "+index)
						}
					})
					alert("我又来了"+index)
				})
				$("#bt2").click(function() {
					var index = layer.open({
						type: 1, //默认为0    1是页面层   2是ifream层
						title: '我是标题', //标题
						content: $("#bts"),//type 1下的content里是网页元素 可以用选择器
						skin: 'layui-layer-lan', //layui-layer-lan layui-layer-molv
						// area: '600px'//如果只设置了宽 高度自适应
						area: ['600px', '400px'],
						// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
						icon: 1, //图标只有在type0时有效
						btnAlign: 'c', //按钮居中对齐
						closeBtn: 2, //- 关闭按钮有1和2 默认1
						shade: [0.8, '#393D49'], //遮罩
						shadeClose: true, //点击遮罩关闭弹窗
						anim: 4, //动画类型
						maxmin: true, //是否显示最大化最小化 type12有效
						success: function(layero, index) {//层创建完毕后执行此代码
							console.log(layero, index);
						}
					})
				})
				$("#bt3").click(function() {
					var index = layer.open({
						type: 2, //默认为0    1是页面层   2是ifream层
						title: '我是标题', //标题
						// content: 'https://www.baidu.com/',//type 3下的content里是网页地址
						content: 'manage',//type 3下的content里是网页地址
						skin: 'layui-layer-lan', //layui-layer-lan layui-layer-molv
						// area: '600px'//如果只设置了宽 高度自适应
						area: ['600px', '400px'],
						// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
						icon: 1, //图标只有在type0时有效
						btnAlign: 'c', //按钮居中对齐
						closeBtn: 2, //- 关闭按钮有1和2 默认1
						shade: [0.8, '#393D49'], //遮罩
						shadeClose: true, //点击遮罩关闭弹窗
						anim: 4, //动画类型
						maxmin: true, //是否显示最大化最小化 type12有效
						success: function(layero, index) {//层创建完毕后执行此代码
							console.log(layero, index);
						}
					})
				})
				$("#bt4").click(function() {})
				$("#bt5").click(function() {})
				$("#bt6").click(function() {})
			})
		</script>
	</body>
</html>
