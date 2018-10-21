<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Single.html</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-1.11.3.min.js"></script>
<!-- //js -->
<link href='https://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>
<body>

<!-- banner -->
	<div class="banner1">
		<div class="banner-info1">
			<div class="container">
				<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
						<div class="logo">
							<a class="navbar-brand" href="index.jsp"><span>A</span> 2333~</a>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div id="headContainer">
						<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav cl-effect-18" id="cl-effect-18" >
								<li><a href="index.jsp">主页</a></li>
								<li v-for="(item,index) in typeList" :class="{'act':index==isActive}" @click="checkItem(index)"><a href="#" @click="getTypeList(item.tid)" :class="{'active':index==isActive}">{{item.tname}}</a></li>
							</ul>
						</div>
					</div>
					<!-- /.navbar-collapse -->	
					
				</nav>
			</div>
		</div>
	</div>
<!-- //banner -->
</body>
<script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script type="text/javascript">

    var headvue=new Vue({
        el:'#headContainer',
	   	data: {
	    	typeList:[],
	   		isActive:-1
		},
	        
        methods:{
        	checkItem(index){
				this.isActive=index;
			},
       		getTypeList:function(tid){
       			 location.href="newsType.jsp?tid="+tid
       		}
        },
        
      	created:function(){
       		this.$http.get("admin/demo/getType").then(
       			function(res){
       				this.typeList=res.data;
       			},
		       function(res){
		       	console.log(res);
		       });
       }
   
   });

</script>
</html>