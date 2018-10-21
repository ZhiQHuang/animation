<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0042)flipin.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改个人资料</title>
    <link href="css/demo.css" rel="stylesheet" type="text/css">
    <!--Framework-->
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <!--End Framework-->
    <script src="js/jquery.ffform.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#form').ffform({ animation: 'flip', submitButton: '#submit', validationIndicator: '#validation', errorIndicator: '#error', successIndicator: '#success', 'fields': [{ 'id': 'name', required: true,requiredMsg:'Name is required', type: 'alpha', validate: true, msg: 'Invalid Name' }, { 'id': 'email', required: true,requiredMsg:'E-Mail is required', type: 'email', validate: true, msg: 'Invalid E-Mail Address' }, { 'id': 'phone', required: false, type: 'custom', validate: false, msg: 'Invalid Phone #' }, { 'id': 'message', required: false, type: 'text', validate: false, msg: ''}] });
        });
        function opera(x, y) {
    		var rs = new Number(document.getElementById(x).value);
    		
    		if (y) {
    			document.getElementById(x).value = rs + 1;
    		} else if( rs >0) {
    			document.getElementById(x).value = rs - 1;
    		}
    		
    	}

        function showPreview(source) {
        	var file = source.files[0];
          	if(window.FileReader) {
            	var fr = new FileReader();
              	var portrait = document.getElementById('portrait');
              	fr.onloadend = function(e) {
                	portrait.src = e.target.result;
              	};
              	fr.readAsDataURL(file);
              	portrait.style.display = 'block';
        	}
        }
    </script>
    <style type="text/css">
		 *{border:none;margin:0px;padding:0px;}
		.number{ padding: 36px 0 28px;width:400px;margin:auto}
		.mui-numbox{ display: inline-block;}
		.minus{width: 30px; height: 30px; text-align: center;border: solid 1px #eaeaea; background: #f5f5f5; color: #9e9e9e;} 
		.numbox{-moz-appearance:textfield;  border-top: solid 1px #eaeaea; border-bottom: solid 1px #eaeaea; height: 28px; width:60px; color: #333333; margin-left:-8px; text-align: center; background: transparent;}
		.numbox::textfield-decoration-container {
		   
		}
		.numbox::-webkit-inner-spin-button {
		     -webkit-appearance: none;
		}
		.numbox::-webkit-outer-spin-button {
		     -webkit-appearance: none;	/* 有无看不出差别 */
		}
		.plus { margin-left: -8px;}
	 </style>
</head>
<body>
	<div class="container" style="border-bottom: 0;">
	    <h1>
	        <span>修改个人资料</span>
	    </h1>
	</div>
    <div class="container">
    	<form class="contact" action="#" method="post" id="form">
    		<div class="row clearfix">
                <div class="lbl">
                    <label for="name">头像：&nbsp;</label>
					<input class="input-file" multiple="multiple" id="imageFile" name="imageFile" type="file" accept="image/*" onchange="showPreview(this)"  />
					<img id="portrait" src="" style="display:none;width:200px;height:auto" />
                </div>
            </div>
        	<div class="row clearfix">
                <div class="lbl">
                    <label for="name">用户名:</label>
                    <input type="text" id="name" name="name" />
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">
                	<label for="name">性别：&nbsp;</label>
				    <input id='radio-1' type="radio" name='r-group-1' checked='checked' />
				    <label for="radio-1">男</label>
				    <input id='radio-2' type="radio" name='r-group-1' />
				    <label for="radio-2">女</label>
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl mui-numbox">
                    <label for="name">年龄：&nbsp;</label>
                    <button class="minus" type="button" onclick="opera('val', false);">-</button>
					<input class="numbox" type="number" id="val" value="0" min="1"/>
					<button class="minus plus" type="button" onclick="opera('val', true);">+</button>
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">
                    <label for="email">邮箱：</label>
                    <input type="text" id="email" name="email" />
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">
                    <label for="email">手机号码：</label>
                    <input type="text" id="phone" name="phone" />
                </div>
            </div>
            <div class="row  clearfix">
                <div class="span10 offset2">
                    <input type="submit" name="submit" id="submit" class="submit" value="提交信息" />
                </div>
            </div>
    	</form>
	</div>
</body>
</html>
