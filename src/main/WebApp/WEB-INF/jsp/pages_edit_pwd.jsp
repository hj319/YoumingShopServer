<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>修改密码 </title>
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" type="image/x-icon">
<meta name="author" content="yinqi">
<link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css" rel="stylesheet">
</head>
  
<body data-logobg="color_8" data-sidebarbg="color_8">
<div class="layout-web">
  <div class="layout-container">
    <!--左侧导航-->
    <aside class="layout-sidebar">
       
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="${ctx}/static/images/logo-sidebar.png" title="" alt="" /></a>
      </div>
      <div class="layout-sidebar-scroll">
        
        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <li class="nav-item active"> <a href="index.html"><i class="mdi mdi-home"></i> 后台首页</a> </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-account-box"></i> 用户管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="user-list.html">用户列表</a> </li>
                <li> <a href="user-role.html">角色管理</a> </li>
              </ul>
            </li>
             <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-briefcase"></i> 商品管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="product-list.html">商品列表</a> </li>
                <li> <a href="product-category.html">分类列表</a> </li>
                <li> <a href="product-comment.html">评论列表</a> </li>
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-tooltip-text"></i> 博客管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="blog-list.html">博客列表</a> </li>
                <li> <a href="blog-category.html">分类列表</a> </li>
                <li> <a href="blog-comment.html">评论列表</a> </li>
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-comment-processing-outline"></i> 消息管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="">消息列表</a> </li>
                
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-cart-outline"></i> 订单管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="">订单列表</a> </li>
              </ul>
            </li>
            <!-- <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-cube"></i> 广告管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="">广告列表</a> </li>
                
              </ul>
            </li> -->
            <!-- <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-link"></i> 链接管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="">友情链接列表</a> </li>
              </ul>
            </li> -->
          </ul>
        </nav>
        
        <div class="sidebar-footer">
          <p class="copyright">Copyright &copy; 2020  YoumingShop <a href="">小白联盟</a></p>
        </div>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <!--头部信息-->
    <header class="layout-header">
      
      <nav class="navbar navbar-default">
        <div class="topbar">
          
          <div class="topbar-left">
            <div class="aside-toggler">
              <span class="toggler-bar"></span>
              <span class="toggler-bar"></span>
              <span class="toggler-bar"></span>
            </div>
            <span class="navbar-page-title"> 修改密码 </span>
          </div>
          
          <ul class="topbar-right">
            <li class="dropdown dropdown-profile">
              <a href="javascript:void(0)" data-toggle="dropdown">
                <img class="img-avatar img-avatar-48 m-r-10" src="/imgUrl/headImage/${loginuser.headImage}" alt="管理员" />
                <span>${loginuser.uname} <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li> <a href="${ctx}/pages_profile"><i class="mdi mdi-account"></i> 个人信息</a> </li>
                <li> <a href="${ctx}/pages_edit_pwd"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
               <!--  <li> <a href="javascript:void(0)"><i class="mdi mdi-delete"></i> 清空缓存</a></li> -->
                <li class="divider"></li>
                <li> <a href="${ctx}/loginOut"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
              </ul>
            </li>
            <!--切换主题配色-->
		    <li class="dropdown dropdown-skin">
			  <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
			  <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                <li class="drop-title"><p>主题</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                </li>
			    <li class="drop-title"><p>LOGO</p></li>
				<li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                    <label for="logo_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                    <label for="logo_bg_8"></label>
                  </span>
				</li>
				<li class="drop-title"><p>头部</p></li>
				<li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
				</li>
				<li class="drop-title"><p>侧边栏</p></li>
				<li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                    <label for="sidebar_bg_8"></label>
                  </span>
				</li>
			  </ul>
			</li>
            <!--切换主题配色-->
          </ul>
          
        </div>
      </nav>
      
    </header>
    <!--End 头部信息-->
    
    <!--页面主要内容-->
    <main class="layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                
                <form action="${ctx }/updatepassword" title="找回密码" class="form-group" method="post">
                <p>
                    <label for="account">登录账号：</label>
                    <input class="form-control" id="account" placeholder="请输入账号" name="account">
                    <div id="account-tips"></div><div style="display: none"><input value="false" id="account-check"></div>
                </p>
                <p>
                    <label for="email">邮箱：</label>
                    <input class="form-control" id="email" placeholder="请输入邮箱" name="email">
                    <div id="email-tips"></div><div style="display: none"><input value="false" id="email-check"></div>
                </p>
                <p>
                    <label for="captcha">验证码：</label>
                    <input class="form-control" id="captcha" placeholder="请输入验证码" name="captcha">
                    <div id="captcha-tips"></div><div style="display: none"><input value="false" id="captcha-check"></div>
                    <input class="btn btn-info" type="button" value="获取验证码" id="get-captcha">
                </p>
                <p>
                    <label for="pwd">输入密码：</label>
                    <input class="form-control" id="pwd" placeholder="请输入密码" name="pwd" type="password">
                    <div id="pwd-tips"></div><div style="display: none"><input value="false" id="pwd-check"></div>
                </p>
                <p>
                    <label for="confirm-pwd">确认密码：</label>
                    <input class="form-control" id="confirm-pwd" placeholder="再次确认密码" name="confirm-pwd" type="password">
                    <div id="confirm-pwd-tips"></div><div style="display: none"><input value="false" id="confirm-pwd-check"></div>
                </p>
                <p>
                    <input class="btn btn-success" id="submit-btn" type="button" value="确认提交" >
                </p>
            </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>

<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/main.js"></script>
<script type="text/javascript">
$(function(){
	
	/* $("#get-captcha").click(function(){
		var email=$("#email").val();
		$.ajax({
    		url:"${ctx}/email/send",
            type:"post", 
            data:{email:email},
            success:function (res) {
                if(res){
                    alert("验证码发送成功");
                    var count = 60;
                    var countdown = setInterval(CountDown, 1000);
                    function CountDown() {
                        $("#get-captcha").attr("disabled", true);
                        $("#get-captcha").val(count + "s");
                        if (count == 0) {
                            $("#get-captcha").val("重新获取验证码").removeAttr("disabled");
                            clearInterval(countdown);
                            $.ajax({
                                url : "${ctx}/deletecaptcha",
                                datatype : "json",
                                type : "post",
                                success:function () {
                                    alert("获取验证码失效，请重新获取")
                                }
                            })
                        }
                        count--;
                    }
                    ,error:function () {
                        alert("获取验证码失败")
                        $("#get-captcha").val("重新获取验证码").removeAttr("disabled");
                    } 
                }
            }     
   		 });
	}); */
	
	
	
	
	
	
	 $("#get-captcha").click(function () {
        if($("#email").val()==""){
            alert("邮箱不能为空");
            $("#email").focus();
            return false;
        } else if($("#email").val().indexOf('@')=='-1'||$("#email").val().indexOf('.com')=='-1'){
            alert("请检查邮箱格式是否正确")
        } else{
            $.ajax({
                url:'${ctx}/checkemail',
                datatype : "json",
                type : "post",
                data:{
                    email:$("#email").val()
                },
                success:function (res) {
                    if(res==true){
                        $("#get-captcha").attr("disabled", true);
                        $("#get-captcha").val("发送中...");
                        $.ajax({
                            url:'${ctx}/email/send',
                            datatype : "json",
                            type : "post",
                            data:{
                                email:$("#email").val()
                            },
                            success:function (res) {
                                if(res){
                                    alert("验证码发送成功")
                                    var count = 60;
                                    var countdown = setInterval(CountDown, 1000);
                                    function CountDown() {
                                        $("#get-captcha").attr("disabled", true);
                                        $("#get-captcha").val(count + "s");
                                        if (count == 0) {
                                            $("#get-captcha").val("重新获取验证码").removeAttr("disabled");
                                            clearInterval(countdown);
                                            $.ajax({
                                                url : "${ctx}/deletecaptcha",
                                                datatype : "json",
                                                type : "post",
                                                success:function () {
                                                    alert("获取验证码失效，请重新获取")
                                                }
                                            })
                                        }
                                        count--;
                                    }
                                }
                            },error:function () {
                                alert("获取验证码失败")
                                $("#get-captcha").val("重新获取验证码").removeAttr("disabled");
                            }
                        })
                    }else{
                        alert("该邮箱不能获取验证码")
                    }

                }})
        }
    });
    $("#submit-btn").click(function () {
        $.ajax({
            url:"${ctx}/findPhone",
            data:{
                phone:$("#account").val()
            },
            dataType:"json",
            type:"post",
            success:function(result){
                if(result==true){
                    alert("没有该账号");
                    return false;
                }else{
                    $.ajax({
                        url:"${ctx}/checkcaptcha",
                        data:{
                            captcha:$("#captcha").val()
                        },
                        dataType:"json",
                        type:"post",
                        success:function (res) {
                            if(res==false){
                                alert("验证码不正确");
                                return false;
                            }else{
                                alert("修改成功,请重新登录")
                                $("form").submit();
                            }
                        }
                    })
                }
            }
        })
    });
function checkinput(id) {
    if($("#"+id+"").val()==""){
        $("#"+id+"-tips").html("");
        $("#"+id+"-tips").append("<h5 style='color:red'>不能为空！</h5>");
        $("#"+id+"-check").val("false");
    }else{
        if(id=='confirm-pwd'){
            if($("#"+id+"").val()!=$("#pwd").val()){
                $("#"+id+"-tips").html("");
                $("#"+id+"-tips").append("<h5 style='color:red'>两次密码不正确</h5>");
                $("#"+id+"-check").val("false");
            }else{
                $("#"+id+"-tips").html("");
                $("#"+id+"-check").val("true");}
        }else{
            $("#"+id+"-tips").html("");
            $("#"+id+"-check").val("true");
        }
    }
    if($("#account-check").val()=="true"&&$("#pwd-check").val()=="true"&&$("#email-check").val()=="true"&&$("#confirm-pwd-check").val()=="true"&&$("#captcha-check").val()=="true"){
        $("#submit-btn").removeAttr("disabled");
    }else{
        $("#submit-btn").attr("disabled", true);
    }
} 

});
</script>
</body>
</html>