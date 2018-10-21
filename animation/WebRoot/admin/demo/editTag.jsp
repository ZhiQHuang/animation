<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>修改标签</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="stylesheet" href="../frame/static/css/font-awesome.min.css">
    <link rel="icon" href="../frame/static/image/code.png">
</head>
<body class="body">

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>修改标签</legend>
</fieldset>

<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">标签名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入标签名称" class="layui-input">
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
<script src="../../js/jquery-1.11.3.min.js" charset="utf-8"></script>
<script type="text/javascript">
function child(obj){
 layui.use(['form', 'layedit', 'upload'], function(){
        var form = layui.form
                ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 1){
                    return '不能为空';
                }
            }
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });
        
        //监听提交
        //submit(*)中的 * 号为事件过滤器的值，是在绑定执行提交的元素时设定的,eg:lay-filter="*"
        form.on('submit(demo1)', function(data){
        	console.log(data);
        	var params={"name":data.field.name,"tagid":obj.tagid}
			$.ajax({
	        	url:"editTag",
	        	data:params ,
	        	dataType:"text",
	        	type:"POST",
	        	traditional: true,
	        	success:function(data){
	        		alert("修改成功！");
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
       
        // you code ...
        
    });
        $("input[name='name']").attr("placeholder",obj.name);
        console.log(obj);//获取父界面的传值
    }
</script>

</body>
</html>