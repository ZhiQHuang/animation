<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>修改视频</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="stylesheet" href="../frame/static/css/font-awesome.min.css">
    <link rel="icon" href="../frame/static/image/code.png">
</head>
<body class="body">

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>修改视频</legend>
</fieldset>

<form class="layui-form" action="" id="uploadForm" method="post" enctype="multipart/form-data">
    <div class="layui-form-item">
        <label class="layui-form-label">视频ID</label>
        <div class="layui-input-block">
            <input type="text" name="vid" lay-verify="title" autocomplete="off" placeholder="请输入视频标题" class="layui-input" readonly="readonly">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入视频标题" class="layui-input">
        </div>
    </div>
    
     <div class="layui-form-item">
        <label class="layui-form-label">视频链接</label>
        <div class="layui-input-block">
            <input type="text" name="src" lay-verify="title" autocomplete="off" placeholder="请输入视频链接" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item">
        <label class="layui-form-label">来源</label>
        <div class="layui-input-block">
            <input type="text" name="vfrom" lay-verify="title" autocomplete="off" placeholder="请输入视频来源" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block" name="tid">
            <select id="tid" name="tid">
            </select>
        </div>
    </div>
    
    <div class="layui-form-item">
		<label class="layui-form-label">海报图片</label>
		<div class="controls" >
			<input class="input-file" multiple="multiple" id="imageFile" name="imageFile" type="file" accept="image/*" onchange="showPreview(this)"  />
			<img id="portrait" src="" style="width:200px; height:auto" />
		</div>
		<div class="controls" id="imgs">
			
		</div>
	</div>
    
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script src="../js/util.js" charset="utf-8"></script>
<script src="../../js/jquery-1.11.3.min.js" charset="utf-8"></script>
<script src="../frame/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
		getType("getType");
	});
function child(obj){
	console.log(obj);
	$("input[name='vid']").attr("value",obj.vid);
	$("input[name='title']").attr("value",obj.title);
	$("input[name='src']").attr("value",obj.src);
	$("input[name='vfrom']").attr("value",obj.vfrom);
	var option=$("<option select='selected'></option>");
	option.val(obj.tid);
	option.html(obj.tname);
	$("select[id='tid']").append(option);
	$("img[id='portrait']").attr("src",obj.picture);
    layui.use(['form', 'layedit', 'upload'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,upload = layui.upload
                ,layedit = layui.layedit;
        
        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 1){
                    return '不能为空';
                }
            }
        });
        
        //监听提交
        //submit(*)中的 * 号为事件过滤器的值，是在绑定执行提交的元素时设定的,eg:lay-filter="*"
        form.on('submit(demo1)', function(data){
        console.log(data);
        	var params=new FormData($("#uploadForm")[0]);
        	$.ajax({
	        	url:"editVideo",
	        	data:params,
	        	type:"POST",
	        	async:false,
	    	   	cache:false,
	    	   	contentType:false,
	    	   	processData:false,
	        	success:function(data){
		        	console.log(data);
		        	alert("修改成功");
		        	layer.close(layer.index);
	                window.parent.location.reload();
	        	},
	        	error:function(error){
	        		alert(error);
	        	}
        	});
        	return false;
            
        });
       
        // you code ...
        
    });
    }
    
    function showPreview(source) {
	      var file = source.files[0];
	      if(window.FileReader) {
	          var fr = new FileReader();
	          console.log(fr);
	          var portrait = document.getElementById('portrait');
	          fr.onloadend = function(e) {
	            portrait.src = e.target.result;
	          };
	          fr.readAsDataURL(file);
	          portrait.style.display = 'block';
	      }
	    }
    
</script>

</body>
</html>