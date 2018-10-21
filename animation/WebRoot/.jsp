<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<title>资讯详情</title>
<meta name="referrer" content="never">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="News Times Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-1.11.3.min.js"></script>

<!-- //js -->
<link href='https://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>
<style>
[v-cloak] {
	display: none;
}

.content img{
	width:600px;
	height:auto;
}

.blog-leftr-bottom a{
    text-decoration: none;
    font-size: 1em;
    color:#999;
    font-size: 16px;
}

.blog-leftr-bottom span{
	padding-right: 5px;
}
.blog-leftr-bottom a:hover{
	color:#27b311; 
}

</style>
<body>
<%@include file="headTop.jsp" %>
<!-- banner -->
	<%@ include file="header.jsp" %>
<!-- //banner -->
<!-- single -->
	<div class="single" id="nInfoContainer" style="overflow: scroll" onscroll="SetH(this)" v-cloak>
		<div class="container">
			<div class="single-grid">
				<div class="col-md-8 blog-left">
					<div class="blog-left-grid">
						<div class="blog-leftr">
							<h2 style="padding-bottom: 8px;">{{newsInfo.title}}</h2>
							<span style="font-size: 12px;">{{newsInfo.date}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源：{{newsInfo.newsfrom}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;阅读量：{{newsInfo.readnum}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编辑：{{newsInfo.author}}</span>
							<hr /> 
							<p v-html="newsInfo.content" class="content"></p>
							<hr /> 
							<div class="blog-leftr-bottom">
								<i class="fa fa-tags" aria-hidden="true"></i> 标签：
								<span  v-for="item in tagname"><a href="####" @click="showTagList(item)">{{item}}</a></span>
								<span style="float: right;"><i class="fa fa-share-alt" aria-hidden="true"></i> 分享到：
									<a href="#"><i class="fa fa-qq" aria-hidden="true"></i>&nbsp;&nbsp;</a>
									<a href="#"><i class="fa fa-weixin" aria-hidden="true"></i>&nbsp;&nbsp;</a>
									<a href="#"><i class="fa fa-weibo" aria-hidden="true"></i>&nbsp;&nbsp;</a>
								</span>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="coment-form">
							<h4>发表评论</h4>
							<form>
								<textarea type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '您的评论...';}" required="" v-model="comment">您的评论...</textarea>
								<input type="button" value="发表评论" @click="addComment()">
							</form>
						</div>
						<div class="response">
							<h4>网友评论</h4>
							<div class="media response-info" v-for="item in commentList">
								<div class="media-left response-text-left">
									<a href="####">
										<img class="media-object" src="images/icon1.png" alt=""/>
									</a>
									<h5><a href="#">{{item.username}}</a></h5>
								</div>
								<div class="media-body response-text-right">
									<p>{{item.content}}</p>
									<ul>
										<li>{{item.time}}</li>
										<li @click="alertReply(item.cid)"><a href="####">回复</a></li>
										<li v-if="item.uid == uid"><a href="####" @click="deleteComment(item.cid)">删除</a></li>
									</ul>
									<div class="coment-form" :id="item.cid" style="display: none;">
										<form>
											<textarea type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '您的评论...';}" required="" v-model="reply">您的评论...</textarea>
											<input type="button" value="发表回复" @click="addReply(item.uid,item.cid,item.newsid)">
										</form>
									</div>
									<div class="media response-info" v-for="r in replyList" v-if="item.uid == r.touid">
										<div class="media-left response-text-left">
											<a href="#">
												<img class="media-object" src="images/icon1.png" alt=""/>
											</a>
											<h5><a href="#">{{r.username}}</a></h5>
										</div>
										<div class="media-body response-text-right">
											<p>{{r.content}}</p>
											<ul>
												<li>{{r.time}}</li>
												<li v-if="r.uid == uid"><a href="####" @click="deleteReply(r.rid)">删除</a></li>
											</ul>		
										</div>
										<div class="clearfix"> </div>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>	
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
<!-- //single -->
</body>
<script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script src="admin/js/util.js"></script>
<script type="text/javascript">
  var pinfovue=new Vue({
     el:'#nInfoContainer',
     data:{
		newsInfo:[],
		tagname:[],
		newsHits:[],
		tagList:[],
		tagid:"",
		hits:"",
		commentList:[],
		replyList:[],
		comment:"",
		reply:"",
		uid:""
     },
     methods:{
     	newsTag:function(tagid){
   			window.open("tagList.jsp?tagid="+tagid);
   		},
   		
   		showDetail : function(newsid) {
			window.open("single.jsp?newsid=" + newsid);
		},
		
		deleteComment:function(cid){
			this.$http.post("admin/demo/deleteComment",{"cid":cid},{emulateJSON:true}).then(
     		function(res){
     			alert("删除成功！");
     			window.location.reload();
        	},
        	function(res){
        		console.log(res);
        	});
		},
		
		deleteReply:function(rid){
			this.$http.post("admin/demo/deleteReply",{"rid":rid},{emulateJSON:true}).then(
     		function(res){
     			alert("删除成功！");
     			window.location.reload();
        	},
        	function(res){
        		console.log(res);
        	});
		},
		
		showTagList:function(name){
			this.$http.post("getNewsByTagname",{"name":name},{emulateJSON:true}).then(
     		function(res){
     			this.tagid = res.data;
     			console.log(res.data);
     			window.open("tagList.jsp?tagid="+this.tagid);
        	},
        	function(res){
        		console.log(res);
        	});
		},
		
		alertReply:function(cid){
 			$("#"+cid).toggle();
		},
		
		addComment:function(){
			if(this.uid==null){
				alert("您未登录，请先登录后再发表评论！");
		        location.href="login.jsp";
			}else{
				var params={"content":this.comment, "newsid":getQueryString("newsid"), "uid":this.uid};
				this.$http.post("insertComment",params,{emulateJSON:true}).then(
	     		function(res){
	     			if(res.data == "ok"){
	     				alert("发表成功");
	     				window.location.reload();
	     			}
	        	},
	        	function(res){
	        		console.log(res);
	        	});
			}
		},
		
		addReply:function(touid,cid,newsid){
			if(this.uid==null){
				alert("您未登录，请先登录后再发表回复！");
		        location.href="login.jsp";
			}else{
				var params={"content":this.reply, "newsid":newsid, "uid":this.uid, "touid":touid, "cid":cid};
				this.$http.post("insertReply",params,{emulateJSON:true}).then(
	     		function(res){
	     			if(res.data == "ok"){
	     				alert("发表成功");
	     				window.location.reload();
	     			}
	        	},
	        	function(res){
	        		console.log(res);
	        	});
			}
		}
		
     },
     
     
     created:function(){
     	var email="<%=session.getAttribute("user")%>";
     	this.$http.post("getUserByEmail",{"email":email},{emulateJSON:true}).then(
     		function(res){
				this.uid=res.data.uid;
				console.log(this.uid);
        	},
        	function(res){
        		console.log(res);
        });
   		this.$http.post("getNewsById",{"newsid":getQueryString("newsid")},{emulateJSON:true}).then(
     		function(res){
        		this.newsInfo=res.data[0];
        		this.hits = res.data[0].readnum;
        		var ttname=new Array();
        		res.data.forEach(function(item){
        			if(item.name != null){
        				ttname.push(item.name);
        			} else{
        				ttname.push("无");
        			}
	            });
				this.tagname=ttname;
        	},
        	function(res){
        		console.log(res);
        });
        
        setTimeout(() => {
        	var params = {"newsid":getQueryString("newsid"), "readnum":this.hits+1}
        	this.$http.post("updateHits",params,{emulateJSON:true}).then(
				function(res) {
					console.log();
				}, function(res) {
					console.log();
			});
      	}, 1000)
        
        this.$http.post("getCommentByNewsid",{"newsid":getQueryString("newsid")},{emulateJSON:true}).then(
     		function(res){
				this.commentList=res.data;
				this.cid = res.data.cid;
        	},
        	function(res){
        		console.log(res);
        });
        
        this.$http.post("getReplyByNewsid",{"newsid":getQueryString("newsid")},{emulateJSON:true}).then(
     		function(res){
				this.replyList=res.data;
        	},
        	function(res){
        		console.log(res);
        });
        
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
     }
     
  });

</script>
<script type="text/javascript">
	
</script>
<script src="js/bootstrap.js"></script>
</html>