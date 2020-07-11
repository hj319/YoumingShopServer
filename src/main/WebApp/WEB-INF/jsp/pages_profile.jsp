<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>个人信息修改</title>
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" type="image/x-icon">
<meta name="author" content="yinqi">
<link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css" rel="stylesheet">
<!--对话框-->
<link rel="stylesheet" href="${ctx}/static/js/jconfirm/jquery-confirm.min.css">
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
            <span class="navbar-page-title"> 个人信息 </span>
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
         <%-- <li> <a href="${ctx}/invalidate"><i class="mdi mdi-delete"></i> 清空缓存</a></li> --%>
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
                 <form method="" action="" id="fm" class="site-form" enctype="multipart/form-data">
                <div class="edit-avatar">
                <input type="hidden" value="${loginuser.uid}" name="uid" id="uid"/>
                  <img src="/imgUrl/headImage/${loginuser.headImage}" id="stu_pic" alt="..." class="img-avatar">
              
                  <div class="avatar-divider"></div>
                  <div class="edit-avatar-content">                  
                      <input type="file" id="uploadFile" name="headImage">
                      <input type="hidden" name="img" id="editimg" value="${loginuser.headImage}"/>
                     
                    <p class="m-0">选择一张你喜欢的图片，裁剪后会自动生成264x264大小，上传图片大小不能超过2M。</p>
                  </div>
                </div>
                <hr>
               
                
              
                  <div class="form-group">
                    <label for="username">登录账号</label>             
                    <input type="text" class="form-control" name="loginId" id="loginId" readonly="readonly" value="${loginuser.uphone }"/>           
                  </div>
                  <div class="form-group">
                    <label for="nickname">用户昵称</label>
                    <input type="text" class="form-control" name="uname" id="uname" placeholder="输入您的昵称" value="${loginuser.uname}">
                  </div>
                  <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="email" class="form-control" name="uemail" id="uemail" aria-describedby="emailHelp" placeholder="请输入正确的邮箱地址" value="${loginuser.uemail}">
                    <small id="emailHelp" class="form-text text-muted">请保证您填写的邮箱地址是正确的。</small>
                  </div>
                  <div class="form-group">
                    <label for="remark">简介</label>
                    <textarea class="form-control" name="uintroduce" id="uintroduce" rows="3">${loginuser.uintroduce}</textarea>
                  </div>
                  <button type="submit" class="btn btn-primary btn-block example-p-5">保存修改</button>
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
<script type="text/javascript" src="${ctx}/static/js/jquery-form.js"></script>
<!--对话框-->
<script src="${ctx}/static/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript">
//选择好图片之后及时显示图片
 $(document).off('change','uploadFile').on('change','#uploadFile',function(){
	
	$('#stu_pic').attr('src',URL.createObjectURL($(this)[0].files[0]));
});


$('.example-p-5').on('click', function () {
	var uid=$("#uid").val();
	var img=$("#editimg").val();
	//alert(img);
	var uname=$("#uname").val();
	var uemail=$("#uemail").val();
	var uintroduce=$("#uintroduce").val();
	$.ajax({
		url: "${ctx}/update",
		type: "post",
		data: {uid:uid,img:img,uname:uname,uemail:uemail,uintroduce:uintroduce},
		success: function(data) {
				alert("修改成功,请回到登录页面重新登录！");
				window.location.href = "${ctx}/login.html";			
		}
	});
    
});
</script>
<script type="text/javascript">
$("#uploadFile").on("change", function () {
    var crowd_file = $('#uploadFile')[0].files[0];
	 var formData = new FormData();
	 formData.append("crowd_file",$('#uploadFile')[0].files[0]);
   	 //alert(formData);
    //formData.append("file", $("#uploadFile")[0].files[0]);
    $.ajax({
        url: "${ctx}/updatepages_profile",
        type: "POST",
        data: formData,
        processData: false, // 告诉jQuery不要去处理发送的数据
        contentType: false,
        success: function (data) {
        	if(data.result>0){
     		   alert("上传成功"); 
     	   }
     	   else{
					alert("上传失败");
     	   }
            /* $("#relativeSrc").val(data.result);
            $("#stu_pic").attr("src",data.fullPath); */
        }
    });

});


</script>
</body>
</html>