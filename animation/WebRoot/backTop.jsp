<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">

<title>火箭返回顶部</title>

<style>

/* 小火箭css */
#gotop1 {
    width: 80px;
    position: fixed;
    bottom: 90px;
    cursor: pointer;
    z-index: 99998;
    right: 50%;
    margin-right: -620px;
}

/* 小火箭悬停特效 */

#gotop1:hover {
    animation: rubberBand 1s;
}

@keyframes rubberBand {
  from {
    transform: scale3d(1, 1, 1);
  }

  30% {
    transform: scale3d(1.25, 0.75, 1);
  }

  40% {
    transform: scale3d(0.75, 1.25, 1);
  }

  50% {
    transform: scale3d(1.15, 0.85, 1);
  }

  65% {
    transform: scale3d(.95, 1.05, 1);
  }

  75% {
    transform: scale3d(1.05, .95, 1);
  }

  to {
    transform: scale3d(1, 1, 1);
  }
}

/* end 小火箭 */




/* 以下css不用理会和复制 */

body{margin: 0; padding: 0; text-align:center;}

#gotop5{
	padding: 12px 0;
    font-size: 24px;
    background: #45d3ff;
    display: block;
    color: #fff;
}

.box2{
	background: #ffa341;
    height: 70px;
    line-height: 70px;
}

.box2>a{margin-left: 15px;}

</style>

</head>
<body>

<!-- 右侧小火箭图标返回顶部 -->
	<div id="shangxia2">
		<span id="gotop1">
			<img src="images/huojian.svg" alt="返回顶部小火箭">
		</span>
	</div>

<!-- 底部文字返回顶部 -->

<!-- js -->
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/TweenMax.min.js"></script>
<script src="js/ScrollToPlugin.min.js"></script>

<script>

/* 选择你喜欢的速度类型，复制下面的某段代码即可。不明处请咨询：qpjk.cc */

$(function() {

// 默认速度
$("#gotop6").click(function() {
TweenMax.to(window, 1, {scrollTo:0});
 });


// 弹跳球式滚动底部 .box2是要滚动地方的id或者锚点
$("#gotop5").click(function() {
TweenMax.to(window, 2, {scrollTo:".box2", ease:Bounce.easeOut});
 });


// 返回顶部，绑定gotop1图标和gotop2文字事件
$("#gotop1,#gotop2").click(function(e) {
   TweenMax.to(window, 1.5, {scrollTo:0, ease: Expo.easeInOut});
   var huojian = new TimelineLite();
	huojian.to("#gotop1", 1, {rotationY:720, scale:0.6, y:"+=40", ease:  Power4.easeOut})
	.to("#gotop1", 1, {y:-1000, opacity:0, ease:  Power4.easeOut}, 0.6)
	.to("#gotop1", 1, {y:0, rotationY:0, opacity:1, scale:1, ease: Expo.easeOut, clearProps: "all"}, "1.4");
 });


// 以1秒慢快慢的速度滚动顶部
$("#gotop3").click(function() {
TweenMax.to(window, 1, {scrollTo:0, ease:Expo.easeInOut});
 });

// 以1.5秒快慢快的速度滚动顶部
$("#gotop4").click(function() {
TweenMax.to(window, 1.5, {scrollTo:0, ease:SlowMo.ease.config(0.7, 0.7, false)});
 });


});

</script>
</body>
</html>