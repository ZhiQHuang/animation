<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>添加资讯所属标签</title>
		<link rel="stylesheet" href="../frame/layui/css/layui.css">
		<link rel="stylesheet" href="../frame/static/css/style.css">
		<link rel="stylesheet" href="../frame/static/css/formSelects-v4.css">
		<link rel="stylesheet" href="../frame/static/css/font-awesome.min.css">
		<link rel="icon" href="../frame/static/image/code.png">
	</head>
	<body class="body">

		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>
				添加资讯所属标签
			</legend>
		</fieldset>

		<form class="layui-form" action="" id="addNewsTags" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">
					资讯标题
				</label>
				<div class="layui-input-block">
					<input id="title" class="layui-input" readonly="readonly" value="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">
					标签
				</label>
				<div class="layui-input-block">
					<select id="tagS" xm-select="select6_2" name="tagsIds">
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">
						立即提交
					</button>
					<button type="reset" class="layui-btn layui-btn-primary">
						重置
					</button>
				</div>
			</div>
		</form>


		<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
		<script src="../js/util.js"></script>
		<script src="../frame/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript">
	$(function() {
		getTags("getTags");
	});

	

	//全局定义一次, 加载formSelects
	layui.config( {
		base : '../js/' //此处路径请自行处理, 可以使用绝对路径
		}).extend( {
		formSelects : 'formSelects-v4'
	});

	function child(obj) {
		$("input[id='title']").attr("value", obj.title);
		newsId=obj.newsid;
			layui.use([ 'form', 'layer', 'formSelects' ],
		function() {
			
			var form = layui.form, layer = layui.layer, formSelects = layui.formSelects;

			layui.formSelects.on('select6_2', function(id, vals,val, isAdd, isDisabled) {

				tagsId = new Array();
				for (x in vals) {
					tagsId.push(parseInt(vals[x].val));
				}
				tagsId.push(parseInt(val.val));

			});
			
			form.on('submit(demo1)', function(data) {
				var params={"tagsids":tagsId,"newsid":newsId}
				$.ajax({
	        	url:"insertNewsTags",
	        	data:params ,
	        	dataType:"text",
	        	type:"POST",
	        	traditional: true,
	        	success:function(data){
	        		alert("添加成功！");
	        		console.log(data);
		        	layer.close(layer.index);
                    window.parent.location.reload();
		        	
	        	},
	        	error:function(error){
	        		alert("error");
	        	}
        	});
			return false
		});
});
	}
	
</script>

	</body>
</html>