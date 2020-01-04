<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
layui.config({
		base: 'layui/layui_ext/dist/',   // {/}的意思即代表采用自有路径，即不跟随 base 路径
	 }).use(['dtree','form','table','layer','jquery'], function(){
  $("#bgbody").css("background","url(../../images/006smjLKly1fvoa457lb3j31hc0u0jvm.jpg)")
  var table = layui.table,
  form = layui.form,
  layer = layui.layer,
  dtree = layui.dtree;
  //第一个实例
  $("#main").html("")
  $("#treeDiv").html("<ul id='moduleModlTree' class='dtree' data-id='0'></ul>")
  $(".layui-border-box").remove()
  $("#tree-table").html("")
  table.render({
    elem: '#main'//选中的元素
    ,url: '/role/findRoles/-' //数据接口
	,toolbar: '#rooletoolbar'//'default'   指定工具条
	// ,cellMinWidth:500//设置每列最小宽度
	,defaultToolbar: ['filter', 'print', 'exports']//设置表头右边的工具
	//请求到数据后 会传入参数给这个函数 并执行函数内的内容 一般用于额外操作
	,done: function(res, curr, count){console.log("res",res);console.log("curr",curr);console.log("count",count)}
	,totalRow: true //开启行计数  需要指定的列也加上这个
	,loading: true//是否显示加载条
	,title: 'JK小姐姐赛高!!!!'//设置导出时的文件名
	// ,text: {none:'哎呀 你要找的数据貌似跟人跑了'}//设置没有数据了时显示的内容可以为为对象
	,cols: [[ //表头
      {field: 'id', title: '角色ID',sort: true}
      ,{field: 'name', title:'角色名',edit:true}
      ,{field: 'explained', title: '角色描述',edit:true,templet: function(d){return new Date(d.created).toLocaleString()}}
      ,{field: 'created', title: '创建时间', sort: true,templet: function(d){return new Date(d.created).toLocaleString()}}
	  ,{field: 'updated', title: '修改时间', sort: true,templet: function(d){return new Date(d.created).toLocaleString()}}
      ,{field: 'createUser', title: '创建用户'}
	  ,{field: 'createUser', title: '修改用户'}
	  ,{title: '操作',fixed: 'right', align:'center', toolbar: '#rolebar'}//添加一个工具条
    ]],
  });
	//监听行工具事件
	table.on('tool(tableBody)', function(obj){ //注：tool 是工具条事件名，tableBody 是 table 原始容器的属性 lay-filter="对应的值"
	  var data = obj.data //获得当前行数据
	  ,layEvent = obj.event; //获得 lay-event 对应的值
	  if(layEvent == 'detail'){
		  layer.alert(JSON.stringify(data),{icon:1})//查看详细
	  } else if(layEvent === 'del'){
		layer.confirm('真的删除行么', function(index){
		console.log(obj)
		  obj.del(); //删除对应行（tr）的DOM结构
		  layer.close(index);
		  //向服务端发送删除指令
		     var params={ids:data.id}
			 var url = "/role/deleteByIds";
			 $.post(url,params,function(r){
				if(r.code==200){
					 console.log(r.msg)
				}else{
					 console.log(r.msg)
				}
			 })
		});
	  } else if(layEvent == 'edit'){
		//编辑操作 需要用户id值
		layer.open({
			type: 1, //默认为0    1是页面层   2是ifream层
			title: '编辑用户', //标题
			content: $("#rolesubmits"),//type 1下的content里是网页元素 可以用选择器
			skin: 'layui-layer-molv', //layui-layer-lan layui-layer-molv
			area: '600px',//如果只设置了宽 高度自适应
			// area: ['700px', '350px'],
			// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
			icon: 1, //图标只有在type0时有效
			btnAlign: 'c', //按钮居中对齐
			closeBtn: 2, //- 关闭按钮有1和2 默认1
			shade: [0.8, '#393D49'], //遮罩
			shadeClose: true, //点击遮罩关闭弹窗
			anim: 4, //动画类型
			maxmin: true, //是否显示最大化最小化 type12有效
			success: function(layero, index){
				form.val('roleeditform',data)
				dtreeInit()
				console.log(data)
				treeValueInit(data.id)
				//数据回显
			}
		})
	 }
	});
	  
	  //监听头部工具栏
	  table.on('toolbar(tableBody)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    switch(obj.event){//组件是通过 event属性来确定是哪一个的
	      case 'add':
	        layer.open({
	        	type: 1, //默认为0    1是页面层   2是ifream层
	        	title: '添加用户', //标题
	        	content: $("#rolesubmits"),//type 1下的content里是网页元素 可以用选择器
	        	skin: 'layui-layer-molv', //layui-layer-lan layui-layer-molv
	        	area: '600px',//如果只设置了宽 高度自适应
	        	// area: ['700px', '400px'],
	        	// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
	        	icon: 1, //图标只有在type0时有效
	        	btnAlign: 'c', //按钮居中对齐
	        	closeBtn: 2, //- 关闭按钮有1和2 默认1
	        	shade: [0.8, '#393D49'], //遮罩
	        	shadeClose: true, //点击遮罩关闭弹窗
	        	anim: 4, //动画类型
	        	maxmin: true, //是否显示最大化最小化 type12有效
	        	success: function(layero, index) {//层创建完毕后执行此代码
					$("#roleeditform")[0].reset()//清空数据   选第0个后变为了js对象  reset是js的方法
					$("#hiddenIn").val("")
					dtreeInit()
	        	}
	        })
	      break;
		  case 'reload':
			table.reload('main'); //只重载数据
		  break;
		  case 'search':
		  	table.reload('main', {url: '/role/findRoles/'+$("#search").val()+"-"}
			);
		  break;
	    }
 	  })
	  //编辑事件
	  table.on('edit(tableBody)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
	    // console.log(obj.value); //得到修改后的值
	    // console.log(obj.field); //当前编辑的字段名
	    // console.log(obj.data); //所在行的所有相关数据  
		var url = "/role/updateOne";  //根据编辑的字段名修改值
		var params = {"id":obj.data.id,"column":obj.field,"value":obj.value};
		console.log(params)
		$.post(url,params,function(r){
			 if(r.code==200){
				 console.log(r.msg)
			 }else{
				 console.log(r.msg)
			 }
		})
	  });
	  
	  
	  //Dtree树初始化
	  function dtreeInit(){
			/*树js*/
		  // 初始化树
		  var DemoTree = dtree.render({
			elem: "#moduleTree",
			line: true,//开启树线
			load: true,//加载遮罩，开启后，初始化加载和加载子节点时，会出现遮罩层
			skin: "layui",
			checkbarType: "self",//没有任何级联关系
			// checkbarType: "p-casc",//父级选中子集全选，子集无法改变父级选中状态
			cache: true,//开启缓存 数据缓存，开启后，当节点收缩后展开时，不会重新访问url。
			url: "/role/getModuleTree" ,// 使用url加载（可与data加载同时存在）
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
		  $.post("/role/findModulesByRoleId",{"id":id},function(r){
			  if(r.code==0){
				  console.log(r)
				  setTimeout(function(){
						dtree.chooseDataInit("moduleTree",r.data.toString());
				  },200)
			  }else{
				  layer.msg("数据回显异常")
			  }
		  })
	  }
	  
	  <!-- 表单js -->
	  //监听提交
	  form.on('submit(rolesubmits)', function(data){
	  	var url = "/role/updateRole";
	  	if(data.field.id=="" || !data.field.id){
	  		url = "/role/addRole";
	  	}
	  	  // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
	  	  // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
		  var checks = dtree.getCheckbarNodesParam("moduleTree");
		  console.log(checks)
		  var ids = [];//将所有节点遍历到这里面然后传到后台删除
		  for (var i = 0; i < checks.length; i++) {
		  	ids[i] = parseInt(checks[i].nodeId);
		  }
		  data.field.moduleIds = ids.toString()
	  	  //当前容器的全部表单字段，名值对形式：{name: value}
	  	  $.post(url,data.field,function(r){
	  		  console.log(r)
	  		  layer.msg("OJBK")
	  		  table.reload('main'); //只重载数据
	  	  })
	      return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	  });
	  $("#roleeditform [name='name']").blur(function(){
		//检查用户名是否存在
	  	isExists("name",$(this))
	  });//失去焦点时验证
	  
	  //检查指定信息是否存在的方法
	  function isExists(column,data){
	  	var value = data[0].value;
	  	if(value){
	  		console.log(column,value)
	  		//通过判断userId是否为空来决定是什么提交方式
	  		
	  		$.get("/role/isExists",{"column":column,"value":value},function(r){
	  			if(r.code==0){
	  				if(r.data){
	  					layer.msg("角色名可以使用",{icon:1})
	  				}else{
	  					layer.msg("角色名已被使用",{icon:2})
	  				}
	  			}else{
	  				layer.alert("服务器繁忙",{icon:2})
	  			}
	  		})
	  		//查询服务器
	  	}
	  }
});
</script>
