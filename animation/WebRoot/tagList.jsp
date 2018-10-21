<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>标签</title>
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
<!-- banner -->
<%@include file="header.jsp" %>
<div id="tagContainer" v-cloak>
<!-- //banner -->
<!-- news-and-events -->
	<div class="news-and-events">
		<div class="container" >
			<div class="news">
					<div class="news-grids">
						<div class="col-md-8 news-grid-left">
							<h3>最新资讯</h3>
							<p style="margin-top: 5px; font-size: 14px">当前位置 / 标签 / {{tagname}}</p>
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
							<p style="text-align: center; margin-top: 10px; font-size: 18px; color: #999" v-show="newsLength == 0 ">很抱歉，该标签下暂时没有相关资讯^_^</p>
							<div id="preloader_3" v-show="isShow < newsLength && newsLength > 7"></div>
							<div class="order" v-show="isShow >= newsLength && newsLength > 0">
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
	el : '#tagContainer',
	data : {
		newsHits:[],
		newsType:[],
		isShow:-1,
		newsLength:-1,
		typeList:[],
   		isActive:-1,
   		tagid:"",
   		keyword:"",
   		tagname:""
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
		
		getInitialNews:function(){
			this.$http.post("getNewsByTag",{"tagid":this.tagid},{emulateJSON:true}).then(function(res) {
   				res.data.forEach(function(item){
	            	item.date=new Date(item.date).format("hh:mm");
	            });
	            this.newsLength = res.data.length;
	            
	            if(this.newsLength > 7){
		            for(var i = 0; i < 7; i++){
	            		this.newsType.push(res.data[i]);
		            }
	            } else{
	            	for(var j = 0; j < this.newsLength; j++){
	            		this.newsType.push(res.data[j]);
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
		          	this.$http.post("getNewsByTag",{"tagid":this.tagid},{emulateJSON:true}).then(function(res) {
		   				res.data.forEach(function(item){
			            	item.date=new Date(item.date).format("hh:mm");
			            });
			            var temp = [];
			            var temp1 = [];
			            var temp2 = [];
			            setTimeout(() => {
			            	if(this.newsType.length <= this.newsLength-10){
			            		 for(var i = this.newsType.length; i < this.newsType.length+10; i++){
			            		 	temp1.push(res.data[i]);
			            		 }
			            	} else{
		          				for(var j = this.newsType.length; j < this.newsLength; j++){
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
		this.tagid = getQueryString("tagid");
		this.$http.get("getNewsByHits").then(
			function(res) {
				this.newsHits = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getTagname",{"tagid":this.tagid},{emulateJSON:true}).then(
			function(res) {
				this.tagname = res.data;
				console.log(this.tagname);
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