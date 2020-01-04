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
</head>
<body>
 <div class="layui-form">
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">中文版</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	layui.use("laydate",function(){
	 var laydate = layui.laydate;
	 laydate.render({
	    elem: '#test1' ,//指定元素
		type: "datetime",
/* 		用于单独提供不同的选择器类型，可选值如下表：
		type可选值	名称	用途
		year	年选择器	只提供年列表选择
		month	年月选择器	只提供年、月选择
		date	日期选择器	可选择：年、月、日。type默认值，一般可不填
		time	时间选择器	只提供时、分、秒选择
		datetime	日期时间选择器	可选择：年、月、日、时、分、秒*/
		// range: "~",//开启范围选择
		// range - 开启左右面板范围选择   类型：Boolean/String，默认值：false
		// 如果设置 true，将默认采用 “ - ” 分割。 你也可以直接设置 分割字符。五种选择器类型均支持左右面板的范围选择。
		format: "yyyy年的MM月的dd日的 HH:mm:ss",//时间格式化 
		value: new Date(),	//value - 初始值
		isInitValue:true, //isInitValue - 是否使用初始值
		// min:"2000-08-28",
		// max:"2050-08-28"
		// min:-7,
		// max:7
		min:"10:10:10",
		max:"20:20:20",
		// min/max - 最小/大范围内的日期时间值
		// 类型：string，默认值：min: '1900-1-1'、max: '2099-12-31'
		trigger:"focus",//trigger - 自定义弹出控件的事件  类型：String，默认值：focus，如果绑定的元素非输入框，则默认事件为：click
		show:true ,//show - 是否一上来默认显示
		//position  用于设置位置 默认为贴着输入框
		showBottom:true,// 是否显示底部栏 默认为true
		btns:['confirm'],//btns - 工具按钮  类型：Array，默认值：['clear', 'now', 'confirm']
		lang:"cn",//lang - 语言类型：String，默认值：cn我们内置了两种语言版本：cn（中文版）、en（国际版，即英文版）。这里并没有开放自定义文字，是为了避免繁琐的配置。
		theme:"#1111FF",//theme - 主题类型：String，默认值：default我们内置了多种主题，theme的可选值有：default（默认简约）、molv（墨绿背景）、#颜色值（自定义颜色背景）、grid（格子主题）
		calendar:true,// - 是否显示公历节日类型：Boolean，默认值：false
		mark:{"0-8-28":"我生日"} ,// 标注重要日子
		/*  准备事件  控件初始打开的回调
			ready: function(date){
			    console.log(date); //得到初始的日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
			}
			时间被改变时事件
			change: function(value, date, endDate){
			    console.log(value); //得到日期生成的值，如：2017-08-18
			    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
			    console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
			  }
			选择完毕后事件
			done: function(value, date, endDate){
			    console.log(value); //得到日期生成的值，如：2017-08-18
			    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
			    console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
			  }
		*/
	  });
	})
</script>
</body>
</html>