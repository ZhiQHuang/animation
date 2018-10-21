<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>欢迎~</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
</head>
<body class="body">
	
	<div class="my-page-box">
	    <h3>WELCOME</h3>
	    <p class="msg" style="font-size: 40px;">XXX</p>
	    <p class="text">欢迎使用本后台管理系统</p>
	    <div class="my-btn-box">
        <button type="button" class="layui-btn layui-btn-small add-tab" lay-id="1">
	        <a style="color: white;" href="javascript:;" href-url="demo/listNews.jsp">资讯列表</a>
	    </button>
	    <button type="button" class="layui-btn layui-btn-small layui-btn-danger add-tab" lay-id="1">
	        <a style="color: white;" href="javascript:;" href-url="demo/listUser.jsp">用户列表</a>
	    </button>
    </div>
	</div>

	<script type="text/javascript" src="../frame/layui/layui.js"></script>
	<script type="text/javascript" src="../js/index.js" ></script>
	<script type="text/javascript">
	   layui.use(['layer', 'vip_tab'], function () {

        // 操作对象
        var layer = layui.layer
                , vipTab = layui.vip_tab
                , $ = layui.jquery;

        // 按照按钮上的数据生成选项卡
        $(document).on('click', '.add-tab', function () {
            vipTab.add($(this));
        });

        // you code ...

    });
	</script>
</body>
</html>