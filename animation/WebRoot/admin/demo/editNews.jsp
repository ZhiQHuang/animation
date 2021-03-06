<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>修改资讯</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="stylesheet" href="../frame/static/css/font-awesome.min.css">
    <link rel="icon" href="../frame/static/image/code.png">
</head>
<body class="body">

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>修改资讯</legend>
</fieldset>

<form class="layui-form" action="" id="uploadForm" method="post" enctype="multipart/form-data" lay-filter="example">
	<div class="layui-form-item">
        <label class="layui-form-label">资讯ID</label>
        <div class="layui-input-block">
            <input type="text" name="newsid" lay-verify="title" autocomplete="off" class="layui-input" readonly="readonly">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="title" autocomplete="off" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item">
        <label class="layui-form-label">来源</label>
        <div class="layui-input-block">
            <input type="text" name="newsfrom" lay-verify="title" autocomplete="off" class="layui-input">
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
			<img id="portrait" style="width:auto;height:auto" />
		</div>
		<div class="controls" id="imgs">
		</div>
	</div>
    
    <div class="layui-form-item">
        <label class="layui-form-label">轮播</label>
        <div class="layui-input-block">
            <input type="checkbox" name="isbroadcast" lay-skin="switch" lay-text="ON|OFF" value="1"/>
        </div>
    </div>
    
    <div class="layui-form-item">
        <label class="layui-form-label">本周热推</label>
        <div class="layui-input-block">
            <input type="checkbox" name="isweek" lay-skin="switch" lay-text="ON|OFF" value="1">
        </div>
    </div>
    
    <div class="layui-form-item">
        <label class="layui-form-label">头条</label>
        <div class="layui-input-block">
            <input type="checkbox" name="ishot" lay-skin="switch" lay-text="ON|OFF" value="1">
        </div>
    </div>

  <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">编辑器</label>
        <div class="layui-input-block">
            <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor" id="con"></textarea>
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
	$("input[name='newsid']").attr("value",obj.newsid);
	$("input[name='title']").attr("value",obj.title);
	$("input[name='newsfrom']").attr("value",obj.newsfrom);
	var option=$("<option select='selected'></option>");
	option.val(obj.tid);
	option.html(obj.tname);
	$("select[id='tid']").append(option);
	$("img[id='portrait']").attr("src",obj.pictures);
	if(obj.isbroadcast == 1){
		$("input[name='isbroadcast']").prop("checked",true);
	}
	if(obj.isweek == 1){
		$("input[name='isweek']").prop("checked",true);
	}
	if(obj.ishot == 1){
		$("input[name='ishot']").prop("checked",true);
	}
	
    layui.use(['form', 'layedit', 'upload'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,upload = layui.upload
                ,layedit = layui.layedit;
		
		layedit.set({
            uploadImage: {
            url: 'uploadFile' //接口url
            ,type: 'post' //默认post
      
              }
           });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        layedit.setContent(editIndex,obj.content,false);
       
        
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
        	var params=new FormData($("#uploadForm")[0]);
        	
        	if(data.field.isbroadcast == "on") {
                data.field.isbroadcast = "1";
            } else {
                data.field.isbroadcast = "0";
            }
            console.log(data.field.isbroadcast);
            if(data.field.isweek == "on") {
                data.field.isweek = "1";
            } else {
                data.field.isweek = "0";
            }
            if(data.field.ishot == "on") {
                data.field.ishot = "1";
            } else {
                data.field.ishot = "0";
            }
            params.append('isbroadcast',data.field.isbroadcast);
            params.append('isweek',data.field.isweek);
            params.append('ishot',data.field.ishot);
        	$.ajax({
	        	url:"editNews",
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