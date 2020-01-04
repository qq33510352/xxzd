<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>	


<script type="text/javascript">
	layui.config({
		base: 'layui/',//配置基本找js路径
	}).extend({
		dtree: 'layui/layui_ext/dtree/dtree'  //配置 dtree路径 不跟随base
	}).use(['treeTable','layer','code','form','dtree'],function(){
		var o = layui.$,
			form = layui.form,
			layer = layui.layer,
			treeTable = layui.treeTable,
			dtree = layui.dtree;
	    $("#bgbody").css("background","url(../../images/77730306_p0.jpg)")
		$("#main").html("")
		$("#tree-table").html("")
		$("#treeDiv").html("<ul id='moduleModlTree' class='dtree' data-id='0'></ul>")
		$(".layui-border-box").remove()
		// 直接下载后url: './data/table-tree.json',这个配置可能看不到数据，改为data:[],获取自己的实际链接返回json数组
		var	re = treeTable.render({
			elem: '#tree-table',
			// data: [{"id":1,"pid":0,"title":"1-1"},{"id":2,"pid":0,"title":"1-2"},{"id":3,"pid":0,"title":"1-3"},{"id":4,"pid":1,"title":"1-1-1"},{"id":5,"pid":1,"title":"1-1-2"},{"id":6,"pid":2,"title":"1-2-1"},{"id":7,"pid":2,"title":"1-2-3"},{"id":8,"pid":3,"title":"1-3-1"},{"id":9,"pid":3,"title":"1-3-2"},{"id":10,"pid":4,"title":"1-1-1-1"},{"id":11,"pid":4,"title":"1-1-1-2"}],
			url: '/module/getTableTree',
			icon_key: 'title',
			// is_checkbox: true,
			// checked: { //默认选中的元素
			// 	key: 'id',
			// 	data: [0,1],
			// },
			end: function(e){
				form.render();
			},
			cols: [
				{
					key: 'title',
					title: '名称',
					width: '15%',
					template: function(item){
						if(item.level == 0){
							return '<span style="color:red;">'+item.title+'</span>';
						}else if(item.level == 1){
							return '<span style="color:green;">'+item.title+'</span>';
						}else if(item.level == 2){
							return '<span style="color:#aaa;">'+item.title+'</span>';
						}else if(item.level == 3){
							return '<span style="color:#a7a7a7;">'+item.title+'</span>';
						}
					}
				},
				{key: 'id',title: 'ID',width: '5%',align: 'center',},
				{key: 'pid',title: '父ID',width: '5%',align: 'center',},
				{key: 'permission',title: '权限',width: '10%',align: 'center',},
				{key: 'intro',title: '描述',width: '15%',align: 'center',},
				{key: 'created',title: '创建时间',width: '12%',align: 'center',template: function(item){return new Date(item.created).toLocaleString()}},
				{key: 'updated',title: '更新时间',width: '12%',align: 'center',template: function(item){return new Date(item.created).toLocaleString()}},
				{key: 'createUser',title: '创建用户',width: '5%',align: 'center',},
				{key: 'updateUser',title: '修改用户',width: '5%',align: 'center',},
				{title: '操作',align: 'center',width: '20%',
				template: function(item){return '<button type="button" lay-filter="add" class="layui-btn layui-btn-radius layui-btn-sm layui-icon layui-icon-add-1 layui-btn-warm" style="font-size: 30px;"></button>'+
				'<button type="button" lay-filter="delete" class="layui-btn layui-btn-radius layui-btn-sm layui-icon layui-icon-delete layui-btn-danger" style="font-size: 30px;"></button>'+
				'<button type="button" lay-filter="edit" class="layui-btn layui-btn-radius layui-btn-sm layui-icon layui-icon-edit layui-btn-normal" style="font-size: 30px;"></button>';
				}}
			]
		});
		// 监听删除
		treeTable.on('tree(add)',function(data){
			data = JSON.stringify(data)//对象转字符串 
			data = JSON.parse(data)//字符串转json对象
			//打开编辑窗口
			var item = data.item;
			console.log(item)
			var d = {'parentId':item.id,'name':item.title,'intro':item.intro,'permission':item.permission};
			console.log(d)
			openAdd(d)
		})
		// 监听编辑
		treeTable.on('tree(edit)',function(data){
			data = JSON.stringify(data)//对象转字符串 
			data = JSON.parse(data)//字符串转json对象
			//打开编辑窗口
			var item = data.item;
			console.log(item)
			var d = {'parentId':item.pid,'id':item.id,'name':item.title,'intro':item.intro,'permission':item.permission};
			console.log(d)
			openEdit(d)
		})
		// 监听删除
		treeTable.on('tree(delete)',function(data){
			data = JSON.stringify(data)//对象转字符串 
			data = JSON.parse(data)//字符串转json对象
			//打开编辑窗口
			var item = data.item;
			layer.confirm('真的要删除'+item.title+'么?', function(index){
				console.log(item)
				var url = "/module/deleteModuleByIds";
				//格式一定要  ids:1,2,3xxxx
				$.post(url,{"ids":item.id.toString()},function(r){
					if(r.code==0){
						layer.msg("删除成功")
						return true;
					}else{
						layer.msg("删除失败")
						return false;
					}
				})
				layer.close(index)
				setTimeout(function(){treeTable.render(re)},200)
			})
		})
		function openAdd(data){
			layer.open({
				type: 1, //默认为0    1是页面层   2是ifream层
				title: '添加模块', //标题
				content: $("#Modulesubmits"),//type 1下的content里是网页元素 可以用选择器
				skin: 'layui-layer-molv', //layui-layer-lan layui-layer-molv
				area: '600px',//如果只设置了宽 高度自适应
				// area: ['700px', '350px'],
				// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
				closeBtn: 2, //- 关闭按钮有1和2 默认1
				shade: [0.8, '#393D49'], //遮罩
				shadeClose: true, //点击遮罩关闭弹窗
				anim: 4, //动画类型
				maxmin: true, //是否显示最大化最小化 type12有效
				success: function(layero, index){
					$("#Moduleditform")[0].reset()
					dtreeInit(null)
					treeValueInit(data.parentId)
					//数据回显
				}
			})
		}
		
		
		function openEdit(data){
			layer.open({
				type: 1, //默认为0    1是页面层   2是ifream层
				title: '编辑模块', //标题
				content: $("#Modulesubmits"),//type 1下的content里是网页元素 可以用选择器
				skin: 'layui-layer-molv', //layui-layer-lan layui-layer-molv
				area: '600px',//如果只设置了宽 高度自适应
				// area: ['700px', '350px'],
				// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
				closeBtn: 2, //- 关闭按钮有1和2 默认1
				shade: [0.8, '#393D49'], //遮罩
				shadeClose: true, //点击遮罩关闭弹窗
				anim: 4, //动画类型
				maxmin: true, //是否显示最大化最小化 type12有效
				success: function(layero, index){
					form.val('Moduleditform',data)
					dtreeInit(data.id)
					treeValueInit(data.parentId)
					//数据回显
				}
			})
		}
		
		//Dtree树初始化
		function dtreeInit(id){
				var url = id?"/module/getDTreeVoById?id="+id:"/role/getModuleTree";
				  /*树js*/
				  // 初始化树
				  var DemoTree = dtree.render({
					elem: "#moduleTree2",
					line: true,//开启树线
					load: true,//加载遮罩，开启后，初始化加载和加载子节点时，会出现遮罩层
					skin: "only",
					checkbarType: "only",//没有任何级联关系
					// checkbarType: "p-casc",//父级选中子集全选，子集无法改变父级选中状态
					// cache: true,//开启缓存 数据缓存，开启后，当节点收缩后展开时，不会重新访问url。
					url:url,// 使用url加载（可与data加载同时存在）
					dataStyle: "layuiStyle",  //使用layui风格的数据格式
					dataFormat: "list",  //配置data的风格为list
					menubar:true,
					// toolbarShow:["add","edit","delete"],
					initLevel: 3,//默认全部展开
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
								layer.msg("删除成功")
								DemoTree.reload()
								return true;
							}else{
								layer.msg("删除失败")
								return false;
							}
						})
						//url: module/deleteModuleByIds
					  }
					},
					checkbar:true, //开启复选框
					response: {message:"msg",statusCode:0}  //修改response中返回数据的定义
				  });
		}
		/* 根据id将Dtree值初始化*/
		function treeValueInit(id){
		    //根据id查询角色权限
			setTimeout(function(){
				dtree.chooseDataInit("moduleTree2",id+"");
			},200)
		}
		
		<!-- 表单js -->
		//监听提交
		form.on('submit(Modulesubmits)', function(data){
			var url = "/module/updateNodeById";
			if(data.field.id=="" || !data.field.id){
				url = "/module/insertNode";
			}
				  var checks = dtree.getCheckbarNodesParam("moduleTree2");
				  console.log(checks)
				  var ids = [];//将所有节点遍历到这里面然后传到后台删除
				  for (var i = 0; i < checks.length; i++) {
				  	ids[i] = parseInt(checks[i].nodeId);
				  }
				  data.field.parentId = ids.toString()
			  //当前容器的全部表单字段，名值对形式：{name: value}
			  $.post(url,data.field,function(r){
				  console.log(r)
				  layer.msg("OJBK")
				  treeTable.render(re);
			  })
		    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
		
		$("#Moduleditform [name='name']").blur(function(){
				//检查用户名是否存在
			isExists("name",$(this))
		});//失去焦点时验证
		
		
		//检查指定信息是否存在的方法
		function isExists(column,data){
			var value = data[0].value;
			if(value){
				console.log(column,value)
				$.get("/module/isExists",{"column":column,"value":value},function(r){
					if(r.code==0){
						if(r.data){
							layer.msg("模块名可以使用",{icon:1})
						}else{
							layer.msg("模块名已被使用",{icon:2})
						}
					}else{
						layer.alert("服务器繁忙",{icon:2})
					}
				})
				//查询服务器
			}
		}
	})
</script>
