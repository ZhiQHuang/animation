<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>搜索结果</title>
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
<%@include file="header.jsp" %>
<!-- banner -->
<div id="searchContainer" v-cloak>
<!-- //banner -->
<!-- news-and-events -->
	<div class="news-and-events">
		<div class="container" >
			<div class="news">
					<div class="news-grids">
						<div class="col-md-8 news-grid-left">
							<h3>最新资讯</h3>
							<p style="margin-top: 5px; font-size: 14px">当前位置 / 搜索结果</p>
							<ul id="load">
								<li v-for="(item, index) in newsSearch">
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
							<p style="text-align: center; margin-top: 10px; font-size: 18px; color: #999" v-show="newsLength == 0 ">很抱歉，没有搜索到相关新闻。试试别的关键词吧^_^</p>
							<div id="preloader_3" v-show="isShow < newsLength && newsLength > 6"></div>
							<div class="order" v-show="isShow >= newsLength && newsLength != 0">
						        <span style="white-space:pre">   </span><span class="line"></span>
						        <span style="white-space:pre">   </span><span class="txt">我也是有底线的~</span>
						        <span style="white-space:pre">   </span><span class="line"></span>
						    </div>
						</div>
						<div class="col-md-4 blog-right">
							<h3>最新资讯</h3>
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
	el : '#searchContainer',
	data : {
		newsHits:[],
		newsSearch:[],
		tagList:[],
		isShow:-1,
		newsLength:-1,
		keyword:"",
		typeList:[],
   		isActive:-1
	},
	methods : {
		getTypeList:function(tid,index){
   			 location.href="typeList.jsp?tid="+tid;
   			 sessionStorage.setItem("isActive", JSON.stringify(index));
       	},
       	
       	newsTag:function(tagid){
   			window.open("tagList.jsp?tagid="+tagid);
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
		
		getInitialNews:function(){
			this.$http.post("admin/demo/getNewsByTitle",{"keyword":this.keyword},{emulateJSON:true}).then(function(res) {
   				res.data.data.forEach(function(item){
	            	item.date=new Date(item.date).format("hh:mm");
	            });
	            this.newsLength = res.data.data.length;
	            if(this.newsLength > 7){
		            for(var i = 0; i < 7; i++){
	            		this.newsSearch.push(res.data.data[i]);
	            	}
	            } else{
	            	for(var j = 0; j < this.newsLength; j++){
	            		this.newsSearch.push(res.data.data[j]);
	            	}
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
		          	this.$http.post("admin/demo/getNewsByTitle",{"keyword":this.keyword},{emulateJSON:true}).then(function(res) {
		   				res.data.data.forEach(function(item){
			            	item.date=new Date(item.date).format("hh:mm");
			            });
			            var temp = [];
			            var temp1 = [];
			            var temp2 = [];
			            setTimeout(() => {
			            	var i = this.newsSearch.length;
			            	if(i <= this.newsLength-10){
			            		 for(i = this.newsSearch.length; i < this.newsSearch.length+10; i++){
			            		 	temp1.push(res.data.data[i]);
			            		 }
			            	} else{
		            			let i=this.newsLength;
		          				for(let j = this.newsSearch.length; j < i; j++){
		          					temp2.push(res.data.data[j]);
		          				}
			            	}
				            temp=temp1.concat(temp2);
				            this.newsSearch = this.newsSearch.concat(temp);
							isLoading = false;
				      	}, 1000)
			     		this.isShow = this.newsSearch.length;
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
		this.scroll(this.newsSearch);
	},
	
	created : function() {
		this.keyword = getQueryString("keyword");
		this.$http.get("getNewsByHits").then(
			function(res) {
				this.newsHits = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.get("admin/demo/getTags").then(
			function(res) {
				this.tagList = res.data;
			}, function(res) {
				console.log(res);
		});
		
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