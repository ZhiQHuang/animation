<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>资讯列表</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <!--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">-->
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
</head>
<body class="body">

<!-- 工具集 -->
<div class="my-btn-box">
    <span class="fl">
        <a class="layui-btn layui-btn-danger radius btn-delect batchDel" id="btn-delete-all">批量删除</a>
        <button type="button" class="layui-btn add-tab" lay-id="1">
	        <a style="color: white;" href="javascript:;" href-url="demo/addNews.jsp">添加资讯</a>
	    </button>
        <a class="layui-btn btn-add btn-default" id="btn-refresh"><i class="layui-icon">&#x1002;</i></a>
    </span>
    <span class="fr">
        <span class="layui-form-label">搜索条件：</span>
        <div class="layui-input-inline">
            <input type="text" autocomplete="off" id="keyword" placeholder="请输入搜索条件" class="layui-input">
        </div>
        <button class="layui-btn mgl-20 search">查询</button>
    </span>
</div>

<!-- 表格 -->
<table class="layui-hide" id="dateTable" lay-filter="table"></table>

<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../frame/layui/layui.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script type="text/javascript">
	
	var limitcount = 10;
    var curnum = 1;
	function pageNews(page,limit) {
	 	    // layui方法
    layui.use(['table', 'form', 'layer', 'vip_table', 'vip_tab', 'laypage'], function () {

        // 操作对象
        var form = layui.form
                , table = layui.table
                , layer = layui.layer
                , vipTable = layui.vip_table
                , laypage = layui.laypage
                , vipTab = layui.vip_tab
                , $ = layui.jquery;

        // 表格渲染
        var tableIns = table.render({
            elem: '#dateTable'                  //指定原始表格元素选择器（推荐id选择器）
            , height: vipTable.getFullHeight()    //容器高度
            , cols: [[                  //标题栏
                {checkbox: true, sort: true, fixed: true, space: true}
                , {field: 'newsid', title: 'ID', width: 80, align: 'center'}
                , {field: 'title', title: '标题', width: 280, align: 'center'}
                , {field: 'author', title: '发布者', width: 120, align: 'center'}
                , {field: 'date', title: '发布时间', width: 120, align: 'center'}
                , {field: 'readnum', title: '阅读量', width: 120, align: 'center'}
                , {field: 'newsfrom', title: '新闻来源', width: 120, align: 'center'}
                , {field: 'tname', title: '分类', width: 120, align: 'center'}
                , {field: 'name', title: '标签', width: 120, align: 'center'}
                , {fixed: 'right', title: '操作', width: 230, align: 'center', toolbar: '#barOption'} //这里的toolbar值是模板元素的选择器
            ]]
            , id: 'dataCheck'
            , url: 'getAllNews'
            , method: 'get'
            , page: true
            , loading: false
            , done: function (res, curr, count) {
            	//如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
               // console.log(res);
                //得到当前页码
                //console.log(curr);
                //得到数据总量
                //console.log(count);
            }
        });
        
        //监听查看，删除、编辑按钮--------这里就是上面说的lay-event绑定
	      table.on('tool(table)', function(obj){
	           var data = obj.data;
	           if(obj.event === 'del'){
	              layer.confirm('确认删除吗？', function(index){
	                  $.post("deleteNews",{"newsid":data.newsid},function(msg){
	                      if(msg.code==1){
	                          obj.del();
	                          layer.close(index);
	                      }else{
	                          layer.msg('删除成功！');
	                          tableIns.reload();
	                      }
	                  });
                	});
	            }else if(obj.event === 'addNewsTag'){
            		addNewsTag(data,obj);
	            }else if(obj.event === 'editNews'){
            		editNews(data,obj);
	            }
	          });

        // 刷新
        $('#btn-refresh').on('click', function () {
            tableIns.reload();
        });
		

        // 按照按钮上的数据生成选项卡
        $(document).on('click', '.add-tab', function () {
            vipTab.add($(this));
        });

        //查找资讯
       $('.search').on('click', function(){
  			var demoReload = $('#keyword');
  			console.log(demoReload.val());
          	tableIns.reload({
          		url:'getNewsByTitle'
               ,where: {
                   keyword: demoReload.val()
               }
           });
        });
        //批量删除
        var checkedArr=[];
        table.on('checkbox(table)', function (obj) {
        	if(obj.checked){
        		checkedArr.push(obj.data.newsid);
        		console.log(checkedArr);
        	}
       	});
        $('.batchDel').on('click', function(){
        	if(checkedArr.length>0){
	        	layer.confirm('确认删除吗？', function(index){
	        		var params={"newsids":checkedArr}
						$.ajax({
				        	url:"batchDelNews",
				        	data:params ,
				        	dataType:"text",
				        	type:"POST",
				        	traditional: true,
				        	success:function(data){
				        		alert("删除成功！");
			                    location.reload();
					        	
				        	},
				        	error:function(error){
				        		alert("error");
			        	}
		        	});
	         	});
	        }else{
	        	layer.alert("请选择要删除的数据");
	        }
       	});
   		});
	}

    pageNews(curnum,limitcount);
    
    function  addNewsTag(data,obj) {
	    layer.open({
		    type: 2,
		    title: '添加资讯标签',
		    shadeClose: false,
		    shade: [0.3],
		    maxmin: true, //开启最大化最小化按钮
		    area: ['900px', '90%'],
		    scrollbar: false, //屏蔽滚动条
		    content: 'addNewsTag.jsp',
            success: function (layero, index) {
                var iframe = window['layui-layer-iframe' + index];
                iframe.child(data);
           	}
		});
	}
	
	function editNews(data,obj) {
	    layer.open({
		    type: 2,
		    title: '修改资讯',
		    shadeClose: false,
		    shade: [0.3],
		    maxmin: true, //开启最大化最小化按钮
		    area: ['900px', '90%'],
		    scrollbar: false, //屏蔽滚动条
		    content: 'editNews.jsp',
            success: function (layero, index) {
                var iframe = window['layui-layer-iframe' + index];
                iframe.child(data);
           	}
		});
	}
    
</script>
<!-- 表格操作按钮集 -->
<script type="text/html" id="barOption">
    <a class="layui-btn layui-btn-mini layui-btn-primary" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-mini" lay-event="editNews">修改</a>
	<a class="layui-btn layui-btn-mini layui-btn-normal" lay-event="addNewsTag">标签</a>
    <a class="layui-btn layui-btn-mini layui-btn-danger" lay-event="del">删除</a>
</script>
</body>
</html>