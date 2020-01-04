<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css"/>
</head>
<body>
	<form style="background: #00FF00; margin: auto;" action="" method="post">
		<textarea name="area" id="mytextarea">
			
		</textarea>
		<input type="submit" value="提交咯"/>
	</form>
	<div style="height: 500px;width: 500px;border: #EE9900 solid 5px;margin: auto;margin-top: 100px;" id="qweqwe">
		quickimage将图片快速插入到编辑器中。
		图片文件的上传可以参考这里上传图片和文件进行配置。
		quicktable快捷工具将快速插入宽度为100%的2×2表格。
		虽然不引入table插件也能使用，但为了更好的体验，最好引入table插件。
		注：以上这段是下方代码的例子，可以点鼠标尝试一下。快速表格和快速图片需要在段尾回车才会出现快速工具栏。
	</div>
</body>
<script src="../../tinymce/tinymce.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
	 tinymce.init({   //初始化文本域
	    selector: '#qweqwe',//selector的目标设为textarea是无法启用内联模式的，必须是普通的块元素，div最佳。
		inline: true,//开启内联模式 不再使用iframe 样式随父  
		//plugins配置参数用于指定哪些插件被用在当前编辑器实例中。
		// plugins : 'advlist autolink link ,image lists preview', //字符串方式   //plugins : ['advlist','autolink','link'], //数组方式
		plugins: [ 'table,link,quickbars,image' ],//不引入link插件也能使用链接，但要想更好的体验，最好引入link插件，如下方示例。
		quickbars_insert_toolbar: 'quickimage quicktable',//quickbars_selection_toolbar : false 禁用执行插入操作出现的工具栏
		quickbars_selection_toolbar:false,//（执行选择后出现的工具栏）
		//quickbars_insert_toolbar（执行插入操作出现的工具栏）	 默认值：bold italic | quicklink h2 h3 blockquote
		//quickimage将图片快速插入到编辑器中。     quicktable快捷工具将快速插入宽度为100%的2×2表格。
		toolbar: 'undo redo | styleselect | bold italic | link image',
		images_upload_url: '/file/tinUpImg',// 要使用图片上传需要 1加入image插件 2工具栏加入image 3加入上传地址
		menubar: 'file edit my1 木大',
		menu: {
			my1: {title: '我的菜单', items: 'copy paste'},木大: {title: '木大木大',items: 'bold italic underline'}
		},
		language:'zh_CN',//指定语言包注意大小写
		// toolbar: false//如要隐藏工具栏，则将其设为false即可。
		// menubar: false//菜单栏消失
		// toolbar: ['undo | bold italic ','alignleft styleselect alignright']
		// 固定宽高（单位：像素）
		width: 600,
		height: 300,
		// 设置编辑器中可编辑区域内的样式
		// content_css: 'css/content.css',
	  });
	  /*TinyMCE默认的工具栏按钮列表：
			newdocument（新文档）
			bold（加粗）
			italic（斜体）
			underline（下划线）
			strikethrough（删除线）
			alignleft（左对齐）
			aligncenter（居中对齐）
			alignright（右对齐）
			alignjustify（两端对齐）
			styleselect（格式设置）
			formatselect（段落格式）
			fontselect（字体选择）
			fontsizeselect（字号选择）
			cut（剪切）
			copy（复制）
			paste（粘贴）
			bullist（项目列表UL）
			numlist（编号列表OL）
			outdent（减少缩进）
			indent（增加缩进）
			blockquote（引用）
			undo（撤销）
			redo（重做/重复）
			removeformat（清除格式）
			subscript（下角标）
			superscript（上角标）
			使用toolbar来配置工具栏上可用的按钮，多个控件使用空格分隔，使用“|”来创建分组。 */
			
			/*默认menubar控件：
			此处默认的意思，是指未加载任何插件，仅由核心提供的控件。
			newdocument（新文档））
			undo（撤销））
			redo（重做/重复）
			visualaid（网格线）
			cut（剪切）
			copy（复制））
			paste（粘贴））
			selectall（全选）
			bold（加粗））
			italic（斜体））
			underline（下划线））
			strikethrough（删除线））
			subscript（下角标））
			superscript（上角标））
			removeformat（清除格式））
			formats（格式）*/
</script>
</html>