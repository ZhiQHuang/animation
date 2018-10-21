<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Home </title>
<meta name="referrer" content="never">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="News Times Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-1.11.3.min.js"></script>
<!-- //js -->
<style>
[v-cloak] {
	  display: none;
	}
	.br-bm-gd-lt{
		position: relative;
		background-size: cover !important;
		background-repeat: no-repeat !important;
	}
  .br-bm-gd-lt1{
 	background: url(images/dott.png)repeat 0px 0px;
    background-size: 0.1px;
    -webkit-background-size: 0.1px;
    -moz-background-size: 0.1px;
    -o-background-size: 0.1px;
    -ms-background-size: 0.1px;
    padding: 2em 0;
 }
    .dim{
      opacity:0.6; filter: alpha(opacity=60);
    }
     
    .dimback{
      background: #000;
    }
    
     .dim1{
      opacity:0.6; filter: alpha(opacity=60);
      height: 196.25px !important;
      width: 255px !important;
    }
     
    .dimback1{
      background: #000;
    }
    
    .img{
    	width: 182.5px;
    	height: 138.567px;
    }
</style>

</head>

<body>
<!-- banner -->
	<div class="header-top" id="htContainer" v-cloak>
		<div class="wrap">
			<div class="top-menu">
				<ul>
					<li><p>欢迎来到animation动漫资讯网站</p></li>
				</ul>
			</div>
			<div class="top-menu1">
				<ul v-show="username == null">
					<li><a href="login.jsp">登录</a></li>
					<li>|</li>
					<li><a href="register.jsp">注册</a></li>
				</ul>
				<ul v-show="username != null">
					<li><a href="">欢迎您：{{username}}</a></li>
					<li>|</li>
					<li @click="userLogout()"><a href="">退出</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
<!-- //banner-bottom -->
</body>
<script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script src="admin/js/util.js"></script>
<script type="text/javascript">
	var pinfovue=new Vue({
     el:'#htContainer',
     data:{
		username:""
     },
     methods:{
     	userLogout:function(){
     		this.$http.post("userLogout").then(
	     		function(res){
					console.log(res);
	        	},
	        	function(res){
	        		console.log(res);
	        });
     	}
     },
     created:function(){
     	var url = location.href;
     	sessionStorage.setItem("url", url);
     	console.log(url);
     	var email="<%=session.getAttribute("user")%>";
     	this.$http.post("getUserByEmail",{"email":email},{emulateJSON:true}).then(
     		function(res){
				this.username=res.data.username;
        	},
        	function(res){
        		console.log(res);
        });
     }
     
  });
</script>
</html>