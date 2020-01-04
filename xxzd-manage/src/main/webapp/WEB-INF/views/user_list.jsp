<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
layui.use(['form','table','layer'], function(){
  $("#bgbody").css("background","url(../../images/cat.jpg)")
  var table = layui.table,
  layer = layui.layer,
  form = layui.form;
  
  $("#main").html("")
  $("#tree-table").html("")
  $("#treeDiv").html("<ul id='moduleModlTree' class='dtree' data-id='0'></ul>")
  $(".layui-border-box").remove()
  
  //第一个实例
  table.render({
    elem: '#main'//选中的元素
    ,height: 'full-200' //设置高度
	,limit: 15//自定义初始化分页
	,limits: [15,30,45,60]//自定义分页
    ,url: '/user/findUsers/-' //数据接口
	,page: true//开启分页
	,toolbar: '#toolbar'//'default'   指定工具条
	// ,cellMinWidth:500//设置每列最小宽度
	,defaultToolbar: ['filter', 'print', 'exports']//设置表头右边的工具
	//请求到数据后 会传入参数给这个函数 并执行函数内的内容 一般用于额外操作
	,done: function(res, curr, count){console.log("res",res);console.log("curr",curr);console.log("count",count)}
	,totalRow: true //开启行计数  需要指定的列也加上这个
	,loading: true//是否显示加载条
	,title: 'JK小姐姐赛高!!!!'//设置导出时的文件名
	// ,text: {none:'哎呀 你要找的数据貌似跟人跑了'}//设置没有数据了时显示的内容可以为为对象
	,initSort: {                       //设置请求到数据后默认根据什么排序
		field: 'id' //排序字段，对应 cols 设定的各字段名
		,type: 'asc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
		}
    ,cols: [[ //表头
	  { id: 'bodyData'
	  ,type: 'checkbox', fixed: 'left',title:'全选',width:'3%'}
      ,{field: 'id', title: 'ID', width:'5%', sort: true}
      ,{field: 'name', title: '用户名', width:'10%',edit:true}
      ,{field: 'mobile', title: '手机号', width:'10%',sort: true,edit:true}
	  ,{field: 'exp', title: '经验', width: '5%',edit:true}
	  ,{field: 'gold', title: '金', width: '5%',edit:true}
      ,{field: 'addr', title: '地址', width: '12%',edit:true}
      ,{field: 'intro', title: '描述', width: '12%',edit:true}
      ,{field: 'created', title: '创建时间', width: '12%', sort: true,templet: function(d){return new Date(d.created).toLocaleString()}}
	  ,{field: 'updated', title: '修改时间', width: '12%', sort: true,templet: function(d){return new Date(d.created).toLocaleString()}}
	  ,{field: 'lastTime', title: '最后上线时间', width: '12%', sort: true,templet: function(d){return new Date(d.created).toLocaleString()}}
	  ,{field: 'registerIp', title: '注册账号ip', width: '10%'}
	  ,{field:'valid', title:'禁用/启用', width:'7%', templet: '#switchTpl', unresize: true}
	  ,{title: '操作',fixed: 'right', width:'12%', align:'center', toolbar: '#userbar'}//添加一个工具条
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
			 var url = "/user/deleteByIds";
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
			content: $("#submits"),//type 1下的content里是网页元素 可以用选择器
			skin: 'layui-layer-lan', //layui-layer-lan layui-layer-molv
			// area: '600px'//如果只设置了宽 高度自适应
			area: ['700px', '400px'],
			// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
			icon: 1, //图标只有在type0时有效
			btnAlign: 'c', //按钮居中对齐
			closeBtn: 2, //- 关闭按钮有1和2 默认1
			shade: [0.8, '#393D49'], //遮罩
			shadeClose: true, //点击遮罩关闭弹窗
			anim: 4, //动画类型
			maxmin: true, //是否显示最大化最小化 type12有效
			success: function(layero, index){
				form.val('editform',data)
				roleSelectInit(data.id)
				//角色数据回显
			}
		})
	 }
	});
	form = layui.form;
	//监听禁用启用操作
	  form.on('switch(validBox)', function(obj){
		 layer.tips(this.name + ' ' + this.value + '：'+ obj.elem.checked, obj.othis);
		 //向服务器发起ajax异步请求
		 var url = "/user/valids";
		 var params = {ids:this.value,valid:obj.elem.checked?1:0};
		 console.log(params)
		 $.post(url,params,function(r){
			 if(r.code==200){
				 console.log(r.msg)
			 }else{
				 console.log(r.msg)
			 }
		 })
	  });
	  
	  //监听头部工具栏
	  table.on('toolbar(tableBody)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    switch(obj.event){//组件是通过 event属性来确定是哪一个的
	      case 'add':
	        layer.open({
	        	type: 1, //默认为0    1是页面层   2是ifream层
	        	title: '添加用户', //标题
	        	content: $("#submits"),//type 1下的content里是网页元素 可以用选择器
	        	skin: 'layui-layer-lan', //layui-layer-lan layui-layer-molv
	        	// area: '600px'//如果只设置了宽 高度自适应
	        	area: ['700px', '400px'],
	        	// offset:'lt'//设置位置 用简称  默认auto 水平垂直居中
	        	icon: 1, //图标只有在type0时有效
	        	btnAlign: 'c', //按钮居中对齐
	        	closeBtn: 2, //- 关闭按钮有1和2 默认1
	        	shade: [0.8, '#393D49'], //遮罩
	        	shadeClose: true, //点击遮罩关闭弹窗
	        	anim: 4, //动画类型
	        	maxmin: true, //是否显示最大化最小化 type12有效
	        	success: function(layero, index) {//层创建完毕后执行此代码
					$("#editform")[0].reset()//清空数据   选第0个后变为了js对象  reset是js的方法
					$("#hiddenIn").val("")
					roleSelectInit()
	        	}
	        })
	      break;
	      case 'deletes':   //批量删除
			// $(".layui-table-main tbody")[0].children[0].remove()
			if(!checkStatus.data.length){//获取选中行数量，可作为是否有选中行的条件
			 layer.msg('请至少选择一个用户');
			 return;	
			}
			layer.confirm('真的删除行么', function(index){
				//获取选中行的数据
				var data = checkStatus.data
				//根据ids删除数据
				console.log("data",data)
				var ids=[];
				for (var i = 0; i < data.length; i++) {
					ids[i]=data[i].id   
				}
				var params={"ids":ids.toString()}
				var url = "/user/deleteByIds";
				$.post(url,params,function(r){
					if(r.code==200){
						 console.log(r.msg)
					}else{
						 console.log(r.msg)
					}
				})
				table.reload('main'); //只重载数据
				layer.close(index);
			});	
			
	      break;
		  case 'reload':
			table.reload('main'); //只重载数据
		  break;
		  case 'search':
		  	table.reload('main', {url: '/user/findUsers/'+$("#search").val()+"-"}
			);
		  break;
	    }
 	  })
	  //初始化角色选择框
	  function roleSelectInit(id){
		  var st = $("#roleSelect");
		  st.html("")
		  
		  $.get("/role/getRoleMap",function(r){
			if(r.code==0){
				if(id!=null){
					console.log("id不为空")
					  $.get("/role/findRoleByUserId?id="+id,function(rr){
						  r.data.forEach(function(d){
							if(rr.data==d.id){
								st.append("<input type='radio' checked name='roleSelect' value="+d.id+" title="+d.name+">")
							}else{
								st.append("<input type='radio' name='roleSelect' value="+d.id+" title="+d.name+">")
							}
						  })
					  })
				}else{
					console.log("id为空")
					r.data.forEach(function(d){
						st.append("<input type='radio' name='roleSelect' value="+d.id+" title="+d.name+">")
					})
				}
			}else{
				st.append("<option value='-1'>服务器繁忙</option>")
			}
		  })
		  setTimeout(function(){form.render();},200)//全部重新渲染
		  
	  }
	  
	  //编辑事件
	  table.on('edit(tableBody)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
	    // console.log(obj.value); //得到修改后的值
	    // console.log(obj.field); //当前编辑的字段名
	    // console.log(obj.data); //所在行的所有相关数据  
		var url = "/user/updateOne";  //根据编辑的字段名修改值
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
});
</script>
<!-- 表单js -->
<script type="text/javascript">
		layui.use(['table','jquery', 'form','layer'], function() {
			var form = layui.form,
			layer = layui.layer,
			$ = layui.jquery,
			table = layui.table;
			//监听提交
			form.on('submit(submits)', function(data){
				if(!data.field.roleSelect){
					layer.msg("必须选择一个角色",{anim:6})
				}
				var url = "/user/updateUser";
				if(data.field.id=="" || !data.field.id){
					url = "/user/addUser";
				}
				  // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				  // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				  console.log("file",data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				  $.post(url,data.field,function(r){
					  console.log(r)
					  layer.msg("OJBK")
					  table.reload('main'); //只重载数据
				  })
				
			    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
			$("#editform [name='name']").blur(function(){
				//检查用户名是否存在
				isExists("name",$(this))
			});//失去焦点时验证
			$("#editform [name='email']").blur(function(){
				//检查用户名是否存在
				isExists("email",$(this))
			});//失去焦点时验证
			
			
			//检查指定信息是否存在的方法
			function isExists(column,data){
				var value = data[0].value;
				if(value){
					console.log(column,value)
					//通过判断userId是否为空来决定是什么提交方式
					
					$.get("/user/isExists",{"column":column,"value":value},function(r){
						if(r.code==0){
							if(r.data){
								layer.msg(value+"可以使用",{icon:1})
							}else{
								layer.msg(value+"已被使用",{icon:2})
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