<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<img src="" >
<script type="text/javascript">
	layui.use(['form','table','layer'], function(){
	  $("#bgbody").css("background","url(../../images/絵師100人展%2009_114_113.png)")
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
	    ,url: '/log/findLogs/-' //数据接口
		,page: true//开启分页
		,toolbar: '#logtoolbar'//'default'   指定工具条
		// ,cellMinWidth:500//设置每列最小宽度
		,defaultToolbar: ['filter', 'print', 'exports']//设置表头右边的工具
		//请求到数据后 会传入参数给这个函数 并执行函数内的内容 一般用于额外操作
		,done: function(res, curr, count){console.log("res",res);console.log("curr",curr);console.log("count",count)}
		// ,totalRow: true //开启行计数  需要指定的列也加上这个
		,loading: true//是否显示加载条
		,title: 'JK小姐姐赛高!!!!'//设置导出时的文件名
		// ,text: {none:'哎呀 你要找的数据貌似跟人跑了'}//设置没有数据了时显示的内容可以为为对象
		,cols: [[ //表头
		  { id: 'bodyData'
		  ,type: 'checkbox', fixed: 'left',title:'全选'}
	      ,{field: 'id', title: '日志ID', sort: true}
	      ,{field: 'username', title: '操作用户名', sort: true}
	      ,{field: 'operation', title: '操作名',sort: true}
		  ,{field: 'method', title: '操作方法'}
		  ,{field: 'params', title: '操作参数'}
	      ,{field: 'time', title: '操作时长'}
	      ,{field: 'ip', title: '操作IP'}
	      ,{field: 'created', title: '创建时间'}
		  ,{title: '删除',fixed: 'right',align:'center',toolbar: '#logbar'}//添加一个工具条
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
				 var url = "/log/deleteByIds";
				 $.post(url,params,function(r){
					if(r.code==200){
						 console.log(r.msg)
					}else{
						 console.log(r.msg)
					}
				 })
			});
		  }
		});
		
		form = layui.form;
		  //监听头部工具栏
		  table.on('toolbar(tableBody)', function(obj){
		    var checkStatus = table.checkStatus(obj.config.id);
		    switch(obj.event){//组件是通过 event属性来确定是哪一个的
		      case 'deletes':   //批量删除
				// $(".layui-table-main tbody")[0].children[0].remove()
				if(!checkStatus.data.length){//获取选中行数量，可作为是否有选中行的条件
				 layer.msg('请至少选择一个日志');
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
					var url = "/log/deleteByIds";
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
			  	table.reload('main', {url: '/log/findLogs/'+$("#search").val()+"-"}
				);
			  break;
		    }
	 	  })
	});
</script>