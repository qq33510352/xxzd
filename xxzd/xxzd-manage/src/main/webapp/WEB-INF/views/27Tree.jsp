<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
<link rel="stylesheet" type="text/css" href="../../layui/layui_ext/dtree/dtree.css"/>
<link rel="stylesheet" type="text/css" href="../../layui/layui_ext/dtree/font/dtreefont.css"/>
  
</head>
<body>
	
	<button type="button" class="layui-btn layui-btn-primary" id="bt1">选中论坛</button>
	<button type="button" class="layui-btn layui-btn-primary" id="bt2">获取选中值</button>
	<button type="button" class="layui-btn layui-btn-primary" id="bt3">获取选中节点的子节点</button>
	<button type="button" class="layui-btn layui-btn-primary" id="bt4">初始化复选框选中节点</button>
	<button type="button" class="layui-btn layui-btn-primary" id="bt5">获取复选中的值</button>
	<div style="background: #f3f3f3;width: 500px;height: 500;align-content: center;">
		<ul id="demoTree" class="dtree" data-id="0"></ul><!-- 和表格一样指定 渲染目标的id即可 -->
	</div>
</body>

  <script type="text/javascript" src="../../layui/layui.js"></script>
	<script type="text/javascript">
		 layui.extend({
			dtree: 'layui/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
		  }).use(['dtree','layer','jquery'], function(){
			var dtree = layui.dtree, layer = layui.layer, $ = layui.jquery;
			
			// 初始化树
			var DemoTree = dtree.render({
			  elem: "#demoTree",
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
			//初始化选中节点
			$("#bt1").click(function(){
				 var params = dtree.dataInit("demoTree", "2");
			})
			//获取当前选中的参数
			$("#bt2").click(function(){
				var param = dtree.getNowParam(DemoTree);
				console.log(param)
			})
			//获取指定节点的所有子节点的值集
			$("#bt3").click(function(){
				var param = dtree.getChildParam(DemoTree,dtree.getNowParam(DemoTree).nodeId);
				console.log(param);
			})
			// // 绑定节点点击单击事件执行完毕后，用户自定义想做的事情
			dtree.on("node('demoTree')" ,function(obj){
				layer.msg(JSON.stringify(data.param));
			});
			// dtree.on("nodedblclick('demoTree')" ,function(obj){
			//   console.log(obj.param); // 点击当前节点传递的参数
			//   console.log(obj.dom); // 当前节点的jquery对象
			//   console.log(obj.childParams); // 当前节点的所有子节点参数
			//   console.log(obj.parentParam); // 当前节点的父节点参数
			// });

			//监听树被改变时
			dtree.on("changeTree('demoTree')" ,function(obj){
			  console.log(obj.param); // 点击当前节点传递的参数
			  console.log(obj.dom); // 当前节点的jquery对象
			  console.log(obj.show); // 节点展开为true，关闭为false
			});
			//初始化复选框值  !很有用  
			$("#bt4").click(function(){
			   var params = dtree.chooseDataInit("demoTree", "4,5,6");
			})
			//获取复选框选中的值
			$("#bt5").click(function(){
				var params = dtree.getCheckbarNodesParam("demoTree");
				console.log(params);
			})
			

		  });
	</script>
</html>