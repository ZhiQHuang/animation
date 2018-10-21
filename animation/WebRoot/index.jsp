<!DOCTYPE HTML>
<html>
<head>
<title>Home </title>
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
<link href='https://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<style type="text/css">
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

<script src="js/responsiveslides.js"></script>
<script>
	// You can also use "$(window).load(function() {"
	$(function () {
	  // Slideshow 4
	  $("#slider3").responsiveSlides({
	auto: true,
	pager: true,
	nav:true,
	speed: 500,
	namespace: "callbacks",
	before: function () {
	  $('.events').append("<li>before event fired.</li>");
	},
	after: function () {
	  $('.events').append("<li>after event fired.</li>");
	}
	  });

	});	
</script>
</head>

<body>
<div id="indexContainer">
<!-- banner -->
	<div class="header-top" >
			<div class="wrap">
				<div class="top-menu">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="about.html">About Us</a></li>
						<li><a href="privacy-policy.html">Privacy Policy</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul>
				</div>
				<div class="top-menu1">
					<ul>
						<li><a href="login.jsp">登录</a></li>
						<li><a href="register.jsp">注册</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	<div class="banner">
		<div class="banner-info">
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
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav cl-effect-18" id="cl-effect-18">
							<li class="act"><a href="index.jsp" class="effect1 active">主页</a></li>
							<li v-cloak v-for="(item,index) in typeList"><a href="events.jsp">{{item.tname}}</a></li>
						</ul>
					</div><!-- /.navbar-collapse -->	
					
				</nav>
				<!--banner-Slider-->
					
					<div  id="top" class="callbacks_container">
						<ul class="rslides" id="slider3">
							<li v-cloak v-for="(item,index) in newsBroadcast">
								<div class="banner-info-slider">
									<ul>
										<li><a href="single.jsp">{{item.tname}}</a></li>
										<li>{{item.date}}</li>
									</ul>
									<h1 @click="showDetail(item.newsid)">{{item.title}}</h1>
									<p @click="showDetail(item.newsid)"><span><i v-html="item.content"></i></span></p>
									<div class="more" @click="showDetail(item.newsid)">
										<a href="#" @click="showDetail(item.newsid)" class="type-1">
											<span> Read More </span>
											<span> Read More </span>
										</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
			</div>
		</div>
	</div>
<!-- banner -->
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<div class="banner-bottom-grids">
				<div v-for="(item,index) in newsHot" v-if="index<4"  class="col-md-3 banner-bottom-grid-left">
					<div class="br-bm-gd-lt" style="background-size: cover !important;" :style="{background:'url(' + item.pictures + ')'}" >
					<div class="br-bm-gd-lt1"></div>
						<div class="overlay">
							<div class="arrow-left"></div>
							<div class="rectangle"></div>
						</div>
						<div class="health-pos">
							<div class="health">
								<ul>
									<li><a href="#" :class="{'sport':index==1,'plane':index==2,'general':index==3}">{{item.tname}}</a></li>
									<li>{{item.date}}</li>
								</ul>
							</div>
							<a href="#" @click="showDetail(item.newsid)">
								<h3 @click="showDetail(item.newsid)" style="font-size: 20px">{{item.title}}</h3>
								<div @click="showDetail(item.newsid)" class="dummy">
									<p style="font-size: 14px" v-html="item.content"></p>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="banner-bottom-grids">
				<div v-for="(item,index) in newsHot" v-if="index>3"  class="col-md-3 banner-bottom-grid-left">
					<div class="br-bm-gd-lt" :style="{background:'url(' + item.pictures + ')',}" >
					<div class="br-bm-gd-lt1"></div>
						<div class="overlay">
							<div class="arrow-left"></div>
							<div class="rectangle"></div>
						</div>
						<div class="health-pos">
							<div class="health">
								<ul>
									<li><a href="#" :class="{'pol':index==4,'world':index==5,'national':index==6,'business':index==7}">{{item.tname}}</a></li>
									<li>{{item.date}}</li>
								</ul>
							</div>
							<a @click="showDetail(item.newsid)" href="#">
								<h3 @click="showDetail(item.newsid)" style="font-size: 20px">{{item.title}}</h3>
								<div @click="showDetail(item.newsid)" class="dummy">
									<p style="font-size: 14px" v-html="item.content"></p>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="move-text">
				<div class="breaking_news">
					<h2>头条资讯</h2>
				</div>
				<div class="marquee" v-if="newsHits.length>0">
					<div class="marquee1"><a class="breaking" href="#" @click="showDetail(newsHits[0].newsid)">{{newsHits[0].title}}</a></div>
					<div class="marquee2"><a class="breaking" href="#" @click="showDetail(newsHits[1].newsid)">{{newsHits[1].title}}</a></div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- video-grids -->
				<div class="video-grids">
					<div class="col-md-8 video-grids-left">
						<div class="video-grids-left1">
							<div class="dimback"> 
								<img :src="newsVideo[0].picture" alt=" " class="img-responsive dim" style="height: 489px !important"/>
							</div>
							<a class="play-icon popup-with-zoom-anim" href="#small-dialog">
									<span> </span>
							</a>
							
							<div class="video-grid-pos">
								<h3>{{newsVideo[0].title}}</h3>
								<ul>
									<li>{{newsVideo[0].date}} <label>|</label></li>
									<li><i>{{newsVideo[0].vfrom}}</i> <label>|</label></li>
									<li><span>{{newsVideo[0].tname}}</span></li>
								</ul>
							</div>
						<div id="small-dialog" class="mfp-hide">
							<iframe :src="newsVideo[0].src" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
						</div>
								
						</div>
						<div class="video-grids-left2">
							<div class="course_demo1">
								<ul id="flexiselDemo1">	
									<li v-for="(item,index) in newsVideo" v-if="index>0">
										<div class="item">
											<img :src="item.picture" alt=" " class="img-responsive" />
											<a class="play-icon popup-with-zoom-anim" :href="'#'+item.vid">
													<i> </i>
											</a>
											<div :id="item.vid" class="mfp-hide">
												<div id="small-dialog">
													<iframe :src="item.src" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
												</div>
											</div>
											<div class="floods-text">
												<h3>{{item.title}} <span>{{item.tname}} <label>|</label> <i>{{item.vfrom}}</i></span></h3>
												<p>{{item.date}}</p>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<!-- pop-up-box -->
												
						</div>
					</div>
					<div class="col-md-4 video-grids-right">
						<div class="sap_tabs">	
							<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
								<ul class="resp-tabs-list">
									<li class="resp-tab-item grid1" aria-controls="tab_item-0" role="tab"><span>本周推荐</span></li>
									<li class="resp-tab-item grid2" aria-controls="tab_item-1" role="tab"><span>热门推荐</span></li>
									<div class="clear"></div>
								</ul>				  	 
								<div class="resp-tabs-container">
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
										<div class="facts" v-for="(item,index) in newsWeek" @click="showDetail(item.newsid)"> 
											<div class="tab_list" @click="showDetail(item.newsid)">
												<img :src="item.pictures" alt=" " height="77px" width="100px"/>
											</div>
											<div class="tab_list1">
												<ul>
													<li><a style="font-size: 16px" href="#" :class="{'green':index==1,'orange':index==2,'orange1':index==3},'orange2':index==4">{{item.tname}}</a> <label>|</label></li>
													<li>{{item.date}}</li>
												</ul>
												<p @click="showDetail(item.newsid)"><a href="#">{{item.title}}</a></p>
											</div>
											<div class="clearfix"> </div>
										</div>
									</div>
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
										<div class="facts" v-for="(item,index) in newsHits">
											<div class="tab_list">
												<img :src="item.pictures" alt=" " height="77px" width="100px" @click="showDetail(item.newsid)" />
											</div>
											<div class="tab_list1">
												<ul>
													<li><a style="font-size: 16px" href="#" :class="{'green':index==1,'orange':index==2,'orange1':index==3},'orange2':index==4">{{item.tname}}</a> <label>|</label></li>
													<li>{{item.date}}</li>
												</ul>
												<p @click="showDetail(item.newsid)"><a href="#">{{item.title}}</a></p>
											</div>
											<div class="clearfix"> </div>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			<!-- //video-grids -->
			<!-- video-bottom-grids -->
				<div class="video-bottom-grids">
					<div class="video-bottom-grids1">
						<div class="col-md-3 video-bottom-grid">
							<div class="video-bottom-grid1" >
								<div class="video-bottom-grid1-before" @click="showDetail(newsType1[0].newsid)">
									<div class="dimback1">
										<img :src="newsType1[0].pictures" alt=" " class="img-responsive dim1" />
									</div>
									<div class="video-bottom-grid1-pos">
										<p>{{newsType1[0].title}}</p>
									</div>
								</div>
								<ul>
									<li v-for="(item,index) in newsType1" v-if="index>0"><a href="#" @click="showDetail(item.newsid)">{{item.title}}</a></li>
									
								</ul>
								<div class="read-more">
									<a href="single.jsp">阅读更多关于动画</a>
								</div>
							</div>
						</div>
						<div class="col-md-3 video-bottom-grid">
							<div class="video-bottom-grid1">
								<div class="video-bottom-grid1-before before1" @click="showDetail(newsType2[0].newsid)">
									<div class="dimback1">
										<img :src="newsType2[0].pictures" alt=" " class="img-responsive dim1" />
									</div>
									<div class="video-bottom-grid1-pos">
										<p>{{newsType2[0].title}}</p>
									</div>
								</div>
								<ul class="list">
									<li v-for="(item,index) in newsType2" v-if="index>0"><a href="#" @click="showDetail(item.newsid)">{{item.title}}</a></li>
								</ul>
								<div class="read-more res">
									<a href="single.jsp">阅读更多关于音乐</a>
								</div>
							</div>
						</div>
						<div class="col-md-3 video-bottom-grid">
							<div class="video-bottom-grid1">
								<div class="video-bottom-grid1-before before2" @click="showDetail(newsType3[0].newsid)">
									<div class="dimback1">
										<img :src="newsType3[0].pictures" alt=" " class="img-responsive dim1" />
									</div>
									<div class="video-bottom-grid1-pos">
										<p>{{newsType3[0].title}}</p>
									</div>
								</div>
								<ul class="list1">
									<li v-for="(item,index) in newsType3" v-if="index>0"><a href="#" @click="showDetail(item.newsid)">{{item.title}}</a></li>
								</ul>
								<div class="read-more res1">
									<a href="single.jsp">阅读更多关于游戏</a>
								</div>
							</div>
						</div>
						<div class="col-md-3 video-bottom-grid">
							<div class="video-bottom-grid1">
								<div class="video-bottom-grid1-before before3" @click="showDetail(newsType4[0].newsid)">
									<div class="dimback1">
										<img :src="newsType4[0].pictures" alt=" " class="img-responsive dim1" />
									</div>
									<div class="video-bottom-grid1-pos">
										<p>{{newsType4[0].title}}</p>
									</div>
								</div>
								<ul class="list2">
									<li v-for="(item,index) in newsType4" v-if="index>0"><a href="#" @click="showDetail(item.newsid)">{{item.title}}</a></li>
								</ul>
								<div class="read-more res2">
									<a href="single.jsp">阅读更多关于声优</a>
								</div>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="video-bottom-grids1">
						<div class="col-md-3 video-bottom-grid">
							<div class="video-bottom-grid1">
								<div class="video-bottom-grid1-before before4" @click="showDetail(newsType5[0].newsid)">
									<div class="dimback1">
										<img :src="newsType5[0].pictures" alt=" " class="img-responsive dim1" />
									</div>
									<div class="video-bottom-grid1-pos">
										<p>{{newsType5[0].title}}</p>
									</div>
								</div>
								<ul class="list2">
									<li v-for="(item,index) in newsType5" v-if="index>0"><a href="#" @click="showDetail(item.newsid)">{{item.title}}</a></li>
								</ul>
								<div class="read-more res3">
									<a href="single.jsp">阅读更多关于漫画</a>
								</div>
							</div>
						</div>
						<div class="col-md-3 video-bottom-grid">
							<div class="video-bottom-grid1">
								<div class="video-bottom-grid1-before before5" @click="showDetail(newsType6[0].newsid)">
									<div class="dimback1">
										<img :src="newsType6[0].pictures" alt=" " class="img-responsive dim1" />
									</div>
									<div class="video-bottom-grid1-pos">
										<p>{{newsType6[0].title}}</p>
									</div>
								</div>
								<ul class="list4">
									<li v-for="(item,index) in newsType6" v-if="index>0"><a href="#" @click="showDetail(item.newsid)">{{item.title}}</a></li>
								</ul>
								<div class="read-more res4">
									<a href="single.jsp">阅读更多关于杂志</a>
								</div>
							</div>
						</div>
						<div class="col-md-3 video-bottom-grid">
							<div class="video-bottom-grid1">
								<div class="video-bottom-grid1-before before6" @click="showDetail(newsType7[0].newsid)">
									<div class="dimback1">
										<img :src="newsType7[0].pictures" alt=" " class="img-responsive dim1" />
									</div>
									<div class="video-bottom-grid1-pos">
										<p>{{newsType7[0].title}}</p>
									</div>
								</div>
								<ul class="list5">
									<li v-for="(item,index) in newsType7" v-if="index>0"><a href="#" @click="showDetail(item.newsid)">{{item.title}}</a></li>
								</ul>
								<div class="read-more res5">
									<a href="single.jsp">阅读更多关于周边</a>
								</div>
							</div>
						</div>
						<div class="col-md-3 video-bottom-grid">
							<div class="video-bottom-grid1">
								<div class="video-bottom-grid1-before before7" @click="showDetail(newsType8[0].newsid)">
									<div class="dimback1">
										<img :src="newsType8[0].pictures" alt=" " class="img-responsive dim1" />
									</div>
									<div class="video-bottom-grid1-pos">
										<p>{{newsType8[0].title}}</p>
									</div>
								</div>
								<ul class="list6">
									<li v-for="(item,index) in newsType8" v-if="index>0"><a href="#" @click="showDetail(item.newsid)">{{item.title}}</a></li>
								</ul>
								<div class="read-more res6">
									<a href="single.jsp">阅读更多关于杂谈</a>
								</div>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			<!-- //video-bottom-grids -->
			<!-- news-and-events -->
				<div class="news">
					<div class="news-grids">
						<div class="col-md-8 news-grid-left">
							<h3>最近资讯</h3>
							<ul>
								<li v-for="(item, index) in newsDate">
									<div class="news-grid-left1">
										<img :src="item.pictures" alt=" " class="img-responsive img" />
									</div>
									<div class="news-grid-right1">
										<h4><a href="single.jsp">{{item.title}}</a></h4>
										<h5>By <a href="#">{{item.author}}</a> <label>|</label> <i>{{item.date}}</i></h5>
										<p>{{item.content}}</p>
									</div>
									<div class="clearfix"> </div>
								</li>
							</ul>
						</div>
						<div class="col-md-4 blog-right">
							<h3>最近天气</h3>
							<div class="news-grid-rght1">
					 			<iframe src="//www.seniverse.com/weather/weather.aspx?uid=UB3CEB5CC9&cid=CHBJ000000&l=&p=SMART&a=1&u=C&s=1&m=2&x=1&d=3&fc=&bgc=&bc=&ti=0&in=0&li=" frameborder="0" scrolling="no" width="360" height="150" allowTransparency="true"></iframe>
							</div>
							<div class="recent">
							</div>
							<div class="footer-top-grid1">
								<h3>标签</h3>
								<ul class="tag2">
									<li><a href="#">awesome</a></li>
									<li><a href="#">strategy</a></li>
									<li><a href="#">development</a></li>
								</ul>
								<ul class="tag2">
									<li><a href="#">css</a></li>
									<li><a href="#">photoshop</a></li>
									<li><a href="#">photography</a></li>
									<li><a href="#">html</a></li>
								</ul>
								<ul class="tag2">
									<li><a href="#">awesome</a></li>
									<li><a href="#">strategy</a></li>
									<li><a href="#">development</a></li>
								</ul>
								<ul class="tag2">
									<li><a href="#">css</a></li>
									<li><a href="#">photoshop</a></li>
									<li><a href="#">photography</a></li>
									<li><a href="#">html</a></li>
								</ul>
								<ul class="tag2">
									<li><a href="#">awesome</a></li>
									<li><a href="#">strategy</a></li>
									<li><a href="#">development</a></li>
								</ul>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			<!-- //news-and-events -->
		</div>
	</div>
<!-- //banner-bottom -->

</div>
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
</body>

<script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script src="admin/js/util.js"></script>
<script type="text/javascript">
var headvue = new Vue( {
	el : '#indexContainer',
	data : {
		typeList : [],
		newsBroadcast:[],
		newsHot:[],
		newsWeek:[],
		newsHits:[],
		newsDate:[],
		newsVideo:[],
		newsType1:[],
		newsType2:[],
		newsType3:[],
		newsType4:[],
		newsType5:[],
		newsType6:[],
		newsType7:[],
		newsType8:[]
	},
	methods : {
		showDetail : function(newsid) {
				location.href = "single.jsp?newsId=" + newsid;
			}
	},

	created : function() {
		this.$http.get("admin/demo/getType").then(
			function(res) {
				this.typeList = res.data;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByBroadcast").then(
			function(res) {
				this.newsBroadcast = res.data.list;
				res.data.list.forEach(function(item){
	                item.date=new Date(item.date).format("MM-dd hh:mm");
	             });
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByHot").then(
			function(res) {
				this.newsHot = res.data.list;
				res.data.list.forEach(function(item){
	                item.date=new Date(item.date).format("MM-dd hh:mm");
	             });
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByWeek").then(
			function(res) {
				this.newsWeek = res.data.list;
				res.data.list.forEach(function(item){
	                item.date=new Date(item.date).format("MM-dd hh:mm");
	             });
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByHits").then(
			function(res) {
				this.newsHits = res.data.list;
				res.data.list.forEach(function(item){
	                item.date=new Date(item.date).format("MM-dd hh:mm");
	             });
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByDate").then(
			function(res) {
				this.newsDate = res.data.list;
				res.data.list.forEach(function(item){
	                item.date=new Date(item.date).format("hh:mm");
	             });
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getVideo").then(
			function(res) {
				this.newsVideo = res.data.list;
				res.data.list.forEach(function(item){
	                item.date=new Date(item.date).format("hh:mm");
	             });
			}, function(res) {
				console.log(res);
		});
		
		
		this.$http.post("getNewsByType",{"tid":1},{emulateJSON:true}).then(
			function(res) {
				this.newsType1 = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByType",{"tid":2},{emulateJSON:true}).then(
			function(res) {
				this.newsType2 = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByType",{"tid":3},{emulateJSON:true}).then(
			function(res) {
				this.newsType3 = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByType",{"tid":4},{emulateJSON:true}).then(
			function(res) {
				this.newsType4 = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByType",{"tid":5},{emulateJSON:true}).then(
			function(res) {
				this.newsType5 = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByType",{"tid":6},{emulateJSON:true}).then(
			function(res) {
				this.newsType6 = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByType",{"tid":7},{emulateJSON:true}).then(
			function(res) {
				this.newsType7 = res.data.list;
			}, function(res) {
				console.log(res);
		});
		
		this.$http.post("getNewsByType",{"tid":8},{emulateJSON:true}).then(
			function(res) {
				this.newsType8 = res.data.list;
			}, function(res) {
				console.log(res);
		});

	}
});
</script>

<script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box -->
<script>
$(document).ready(function() {
$('.popup-with-zoom-anim').magnificPopup({
	type: 'inline',
	fixedContentPos: false,
	fixedBgPos: true,
	overflowY: 'auto',
	closeBtnInside: true,
	preloader: false,
	midClick: true,
	removalDelay: 300,
	mainClass: 'my-mfp-zoom-in'
});
																
});
</script>
<!-- requried-jsfiles-for owl -->
<script type="text/javascript">
$(window).load(function() {
$("#flexiselDemo1").flexisel({
	visibleItems: 3,
	animationSpeed: 1000,
	autoPlay: true,
	autoPlaySpeed: 3000,    		
	pauseOnHover: true,
	enableResponsiveBreakpoints: true,
	responsiveBreakpoints: { 
		portrait: { 
			changePoint:480,
			visibleItems: 1
		}, 
		landscape: { 
			changePoint:640,
			visibleItems: 2
		},
		tablet: { 
			changePoint:768,
			visibleItems: 3
		}
	}
});

});
 </script>
<script type="text/javascript" src="js/jquery.flexisel.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$('#horizontalTab').easyResponsiveTabs({
			type: 'default', //Types: default, vertical, accordion           
			width: 'auto', //auto or any width like 600px
			fit: true   // 100% fit in a container
		});
	});
</script>
<!-- pop-up-box -->
<script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box -->

<script>
	$(document).ready(function() {
	$('.popup-with-zoom-anim').magnificPopup({
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});
																	
	});
</script>
<script type="text/javascript" src="js/jquery.marquee.js"></script>
<script>
  $('.marquee').marquee({ pauseOnHover: true });
  //@ sourceURL=pen.js
</script>
</html>