<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>添加标签</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="stylesheet" href="../frame/static/css/font-awesome.min.css">
    <link rel="icon" href="../frame/static/image/code.png">
</head>
<body class="body">

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>添加标签</legend>
</fieldset>

<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">标签名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" autocomplete="off" placeholder="请输入标签名称" lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<script src="../frame/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
// layui方法
    layui.use('form', function () {

        // 操作对象
        var form = layui.form
                , $ = layui.jquery;

		form.verify({
            tname: function(value){
            }
        });
        // you code ...
        
        //监听提交
        //submit(*)中的 * 号为事件过滤器的值，是在绑定执行提交的元素时设定的,eg:lay-filter="*"
        form.on('submit(demo1)', function(data){
        	var params=$("form").serializeArray();
			$.ajax({
	        	url:"insertTag",
	        	data:params,
	        	type:"POST",
	        	success:function(data){
	        		console.log(data);
		        	alert("添加成功!");
		        	location.reload(true);
	        	},
	        	error:function(error){
	        		alert(error);
	        	}
        	});
        	return false;
        });

    });
</script>

</body>
</html>