<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>资讯分类</title>
<meta name="referrer" content="never">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="News Times Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-1.11.3.min.js"></script>
<!-- //js -->
<script src="js/bootstrap.js"></script>
<link href='https://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<style>
    .img{
    	width: 182.5px;
    	height: 138.567px !important;
    }
    [v-cloak] {
	  display: none;
	}
</style>
</head>
<body>
<%@include file="headTop.jsp" %>
<div id="typeContainer" v-cloak>
<!-- banner -->
	<div class="banner1">
		<div class="banner-info1">
			<div class="container">
				<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<div class="logo">
							<a class="navbar-brand" href="index.jsp"><span>A</span> 2333~</a>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div id="headContainer" v-cloak>
						<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav cl-effect-18" id="cl-effect-18" >
								<li style="margin-top: 10px;"><input class="search" v-model="keyword" @keyup.enter="searchNews()" type="search" placeholder="请输入关键字"></li>
								<li><a href="index.jsp">主页</a></li>
								<li v-for="(item,index) in typeList" :class="{'act':index==isActive}" ><a href="#" @click="getTypeList(item.tid,index)" :class="{'active':index==isActive}">{{item.tname}}</a></li>
							</ul>
						</div>
						
					</div>
					<!-- /.navbar-collapse -->	
					
				</nav>
				
			</div>
		</div>
	</div>
<!-- //banner -->
<!-- news-and-events -->
	<div class="news-and-events">
		<div class="container" id="typeContainer" v-cloak>
			<div class="news">
					<div class="news-grids">
						<div class="col-md-8 news-grid-left">
							<h3>最新资讯</h3>
							<p style="margin-top: 5px; font-size: 14px">当前位置 / 分类 / {{tname}}</p>
							<ul id="load">
								<li v-for="(item, index) in newsType">
									<div class="news-grid-left1">
										<img :src="item.pictures" alt=" " @click="showDetail(item.newsid)" class="img-responsive img" />
									</div>
									<div class="news-grid-right1">
										<h4><a href="####" @click="showDetail(item.newsid)">{{item.title}}</a></h4>
										<h5>By <a>{{item.author}}</a> <label>|</label> <i>{{item.date}}</i></h5>
										<p style="color: grey; font-size: 14px;" v-html="item.summary"></p>
									</div>
									<div class="clearfix"> </div>
								</li>
							</ul>
							<div id="preloader_3" v-show="isShow < newsLength "></div>
							<div class="order" v-show="isShow >= newsLength">
						        <span style="white-space:pre">   </span><span class="line"></span>
						        <span style="white-space:pre">   </span><span class="txt">我也是有底线的~</span>
						        <span style="white-space:pre">   </span><span class="line"></span>
						    </div>
						</div>
						<div class="col-md-4 blog-right">
						
							<h3>最近资讯</h3>
							<div class="banner-bottom-video-grid-left">
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								  <div class="panel panel-default" v-for="item in newsHits">
									<div class="panel-heading" role="tab" id="headingOne">
									  <h4 class="panel-title">
										<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" :href="'#'+item.newsid" aria-expanded="true" :aria-controls="item.newsid">
										  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><i class="glyphicon glyphicon-minus" aria-hidden="true"></i>{{item.title}}
										</a>
									  </h4>
									</div>
									<div :id="item.newsid" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" style="height: 0px;">
									  <div class="panel-body" @click="showDetail(item.newsid)"  v-html="item.summary">
									  </div>
									</div>
								  </div>
								</div>
							</div>
							
							<h3>最近天气</h3>
							<div class="news-grid-rght1">
					 			<iframe src="//www.seniverse.com/weather/weather.aspx?uid=UB3CEB5CC9&cid=CHBJ000000&l=&p=SMART&a=1&u=C&s=1&m=2&x=1&d=3&fc=&bgc=&bc=&ti=0&in=0&li=" frameborder="0" scrolling="no" width="360" height="150" allowTransparency="true"></iframe>
							</div>
							<div class="recent">
							</div>
							<div class="footer-top-grid1">
								<h3>标签</h3>
								<ul class="tag2">
									<li style="padding-right: 3px"  v-for="item in tagList"><a href="####" @click="newsTag(item.tagid)">{{item.name}}</a></li>
								</ul>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
		</div>
	</div>
</div>
<!-- //news-and-events -->
</body>

<script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script src="admin/js/util.js"></script>
<script type="text/javascript">
var headvue = new Vue( {
	el : '#typeContainer',
	data : {
		newsHits:[],
		tname:"",
		newsType:[],
		tagList:[],
		isShow:-1,
		newsLength:-1,
		tid:"",
		typeList:[],
   		isActive:-1,
   		keyword:""
	},
	methods : {
	
		getTypeList:function(tid,index){
     		location.href="typeList.jsp?tid="+tid;
     		sessionStorage.setItem("isActive", JSON.stringify(index));
     	},
     	
      	searchNews:function(){
      		if(this.keyword == null || this.keyword.split(" ").join("").length == 0){
      			alert("请输入关键字！");
      		} else{
      			var content=encodeURI(encodeURI(this.keyword));
      			location.href="searchList.jsp?keyword="+content;
      		}
      	},
		
		showDetail : function(newsid) {
			window.open("single.jsp?newsid=" + newsid);
		},
		
		newsTag:function(tagid){
   			window.open("tagList.jsp?tagid="+tagid);
   		},
		
		getInitialNews:function(){
			this.$http.post("getNewsByTid",{"tid":this.tid},{emulateJSON:true}).then(function(res) {
   				res.data.forEach(function(item){
	            	item.date=new Date(item.date).format("hh:mm");
	            });
	            this.newsLength = res.data.length;
	            for(var i = 0; i < 7; i++){
	            	this.newsType.push(res.data[i]);
	            }
			}, function(res) {
				console.log(res);
			});
   		},
   		
   		scroll:function(news) {
 			let isLoading = false
   			window.onscroll = () => {
   				let bottomOfWindow = document.documentElement.offsetHeight - document.documentElement.scrollTop - window.innerHeight <= 200
   				if (bottomOfWindow && isLoading == false) {
			     	isLoading = true
		          	this.$http.post("getNewsByTid",{"tid":this.tid},{emulateJSON:true}).then(function(res) {
		   				res.data.forEach(function(item){
			            	item.date=new Date(item.date).format("hh:mm");
			            });
			            var temp = [];
			            var temp1 = [];
			            var temp2 = [];
			            setTimeout(() => {
			            	var i = this.newsType.length;
			            	if(i <= this.newsLength-10){
			            		 for(i = this.newsType.length; i < this.newsType.length+10; i++){
			            		 	temp1.push(res.data[i]);
			            		 }
			            	} else{
		            			let i=this.newsLength;
		          				for(let j = this.newsType.length; j < i; j++){
		          					temp2.push(res.data[j]);
		          				}
			            	}
				            temp=temp1.concat(temp2);
				            this.newsType = this.newsType.concat(temp);
							isLoading = false;
				      	}, 1000)
			     		this.isShow = this.newsType.length;
						}, function(res) {
							console.log(res);
					});
		     	}
   			}
		}
	},
	
	beforeMount(){
		this.getInitialNews();
	},
	
	mounted(){
		this.scroll(this.newsType);
	},
	
	created : function() {
		this.tid = getQueryString("tid");
		
		this.$http.get("admin/demo/getType").then(
      		function(res){
      			this.typeList=res.data;
      			this.isActive=sessionStorage.getItem("isActive");
   			},
	    	function(res){
	       		console.log(res);
	    });
		
		this.$http.post("getNewsTypeByHits",{"tid":this.tid},{emulateJSON:true}).then(
			function(res) {
				this.newsHits = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getTname",{"tid":this.tid},{emulateJSON:true}).then(
			function(res) {
				this.tname = res.data.tname;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.get("admin/demo/getTags").then(
			function(res) {
				this.tagList = res.data;
			}, function(res) {
				console.log(res);
		});
	}
});
</script>

</html>