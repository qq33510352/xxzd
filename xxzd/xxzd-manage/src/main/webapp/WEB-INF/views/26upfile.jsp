<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css" />
		<script type="text/javascript" src="../../layui/layui.js"></script>
	</head>
	<body>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			<legend>上传多张图片</legend>
		</fieldset>

		<div class="layui-upload">
			<button type="button" class="layui-btn" id="test2">多图片上传</button>
			<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
				预览图：
				<div class="layui-upload-list" id="demo2"></div>
				<div id="#demoText">
					
				</div>
			</blockquote>
			<button type="button" class="layui-btn" id="DIO"></button>
		</div>
	</body>
	<script type="text/javascript">
		layui.use(['jquery', 'upload', 'layer'], function() {
			var upload = layui.upload
			$ = layui.jquery;
			//多图片上传
			upload.render({
				elem: '#test2',//渲染元素
				accept: 'images',//允许上传类型
				// exts: 'png/gif/jpg/bmp/',//限制类型
				url: '/file/upImg',//上传地址
				auto: false,//自动上传
				bindAction: '#DIO',//指定上传按钮
				multiple: true,//是否多上传
				field: 'imgFile',//设定文件域的字段名  一定要和服务器接收参数名一致
				// size:10240,	//设置文件最大可允许上传的大小，单位 KB。不支持ie8/9
				// number:100,	设置同时可上传的文件数量，一般配合 multiple 参数出现
				drag:true,//是否接受拖拽的文件上传，设置 false 可禁用。不支持ie8/9
				done: function(res){
				  //如果上传失败
				  if(res.code > 0){
					return layer.msg('上传失败');
				  }else{
					  console.log(res)
					  $("#demo2").append("<img style='width: 100px;100px' src="+res.src+" />")
				  }
				  //上传成功
				},
				error: function(){
				  //演示失败状态，并实现重传
				  var demoText = $('#demoText');
				  demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				  demoText.find('.demo-reload').on('click', function(){
					uploadInst.upload();
				  });
				}
			});

		})
	</script>
</html>
