<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../layui/layui.js" type="text/javascript">
</script>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
<style type="text/css">
	img{
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
	  <legend>填充轮播元素 - 以图片为例</legend>
	</fieldset>    
	 
	 <!-- class="layui-carousel"  申明一个 轮播组件
			carousel-item=""  申明轮播组件项-->
	 
	<div class="layui-carousel" id="test10">
	 <div carousel-item="">
	   <div><img src="../../images/006smjLKly1fvoa457lb3j31hc0u0jvm.jpg"></div>
	   <div><img src="../../images/77730306_p0.jpg"></div>
	   <div><img src="../../images/@gomalio_y-D_ffw4NVAAAhKTh.jpg"></div>
	   <div><img src="../../images/342ac65c10385343636a7bbc9213b07ecb808882.jpg"></div>
	 </div>
	</div>
	
	<script type="text/javascript">
		layui.use(["carousel"],function(){
			var carousel = layui.carousel;
			 carousel.render({
				elem: '#test10'
				,width: '778px'
				,height: '440px'
				,interval: 5000
			  });
		})
	</script>
</body>
</html>