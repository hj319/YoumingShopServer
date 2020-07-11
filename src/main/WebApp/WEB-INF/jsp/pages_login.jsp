<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>登录页面</title>
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" type="image/x-icon">
<meta name="author" content="yinqi">
<link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css" rel="stylesheet">
<style>
.wrapper {
    position: relative;
}
.login {
    display: flex !important;
    min-height: 100vh;
    align-items: center !important;
    justify-content: center !important;
}
.login-center {
    background: #fff;
    min-width: 38.25rem;
    padding: 2.14286em 3.57143em;
    border-radius: 5px;
    margin: 2.85714em 0;
}
.login-header {
    margin-bottom: 1.5rem !important;
}
.login-center .has-feedback.feedback-left .form-control {
    padding-left: 38px;
    padding-right: 12px;
}
.login-center .has-feedback.feedback-left .form-control-feedback {
    left: 0;
    right: auto;
    width: 38px;
    height: 38px;
    line-height: 38px;
    z-index: 4;
    color: #dcdcdc;
}
.login-center .has-feedback.feedback-left.row .form-control-feedback {
    left: 15px;
}
</style>
</head>
  
<body data-logobg="color_8" data-sidebarbg="color_8">
<div class="row wrapper">
  <div class="login">
    <div class="login-center">
      <div class="login-header text-center">
        <img alt="light year admin" src="${ctx }/static/images/logo-sidebar.png"> 
      </div>
      <form action="${ctx}/dologin.html" id="denglu" method="post">
        <div class="form-group has-feedback feedback-left">
          <input type="text" placeholder="手机" class="form-control" name="uname" id="uname" />
          <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left">
          <input type="password" placeholder="密码" class="form-control" id="upassword" name="upassword" />
          <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left row">
          <div class="col-xs-7">
            <input type="text" name="code" value="" id="reregname" class="form-control" placeholder="验证码">
            <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
          </div>
          <div class="col-xs-5">
            <div id="re_right">
				 <a href="javascript:changeImg();"><img id="codeImg" src=""/>看不清</a>
			 </div>
          </div>
        </div>
        <c:if test="${msg!=null}">
        	<span  style="color:red;">${msg}</span>
        </c:if>
        <!-- <span id="checkpwd_msg" style="color:red;"></span> -->
        <div class="form-group">
          <button class="btn btn-block btn-primary" type="submit">立即登录</button>
        </div>
      </form>
      <hr>
      <footer class="col-sm-12 text-center">
        <!-- <p class="m-b-0">Copyright © 2019 <a href="http://lyear.itshubao.com">IT书包</a>. All right <a href="http://www.bootstrapmb.com/">reserved</a></p> -->
      </footer>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	changeImg();
 });
    // 定义一个当src发生改变时就到后台去获得一个随机的验证码
	function changeImg() {
		// 获得验证码图片元素 使用JavaScript获得
		var img = document.getElementById("codeImg");
		// 当src的路径发生改变，都会到后台去请求一次
		// new Date().getTime() 避免浏览器不去后台请求数据，因为有缓存
		img.src="${ctx}/CodeImg?"+new Date().getTime();
	}	
    
	/* function check(){
		var gr_tel = $('input[name="uphone"]').val();
		var re = /^1\d{10}$/;
	 	if (!re.test(gr_tel)) {
	 		document.getElementById("checkpwd_msg").innerText = "请输入正确的手机号";
	  		return false;
	 	}
	 	var pwdCheck = /^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{8,20}$/;
	 	if ($("input[name=upassword]").val().length < 1) {
	 

	 	document.getElementById("checkpwd_msg").innerText = "*确认密码不能为空";
	 	return false;
	 	}else if ($("input[name=upassword]").val().length < 8 ){
	 	document.getElementById("checkpwd_msg").innerText = "*请输入8位以上的密码";
	 	return false;
	 	}else if(!pwdCheck.test($("input[name=upassword]").val())){
	 	document.getElementById("checkpwd_msg").innerText = "*不能为纯数字或纯字母";
	 	return false;
	 	}else{
	 	document.getElementById("checkpwd_msg").innerText = "";
	 	}
	 	
		$("#denglu").submit();
	} */
</script>
</body>
</html>