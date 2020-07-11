<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>用户列表</title>
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" type="image/x-icon">
<meta name="author" content="yinqi">
<link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css" rel="stylesheet">
<!--对话框-->
<link rel="stylesheet" href="${ctx}/static/js/jconfirm/jquery-confirm.min.css">
<style type="text/css">
table {
	table-layout: fixed;
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
  
<body data-logobg="color_8" data-sidebarbg="color_8">
<div class="layout-web">
  <div class="layout-container">
    <!--左侧导航-->
    <aside class="layout-sidebar">
       
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.jsp"><img src="${ctx}/static/images/logo-sidebar.png" title="" alt="" /></a>
      </div>
      <div class="layout-sidebar-scroll">
        
        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <li class="nav-item"> <a href="index.html"><i class="mdi mdi-home"></i> 后台首页</a> </li>
            <li class="nav-item nav-item-has-subnav active open">
              <a href="javascript:void(0)"><i class="mdi mdi-account-box"></i> 用户管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="user-list.html">用户列表</a> </li>
                <!-- <li> <a href="user-role.html">角色管理</a> </li> -->
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
                <li> <a href="product-list.html">博客列表</a> </li>
                <li> <a href="product-category.html">分类列表</a> </li>
                <li> <a href="product-comment.html">评论列表</a> </li>
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-comment-processing-outline"></i> 消息管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="information-list.html">消息列表</a> </li>
                
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-cart-outline"></i> 订单管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="order-list.html">订单列表</a> </li>
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
            <span class="navbar-page-title"> 用户管理 - 用户列表 </span>
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
                <!-- <li> <a href="javascript:void(0)"><i class="mdi mdi-delete"></i> 清空缓存</a></li> -->
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
    <c:if test="${loginuser.rid==1}">
    <!--页面主要内容-->
    	<main class="layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-toolbar clearfix">
	              	<form action="${ctx }/user-list.html" class="pull-right " method="get">       
					     <select name="rid" id="findrid" style="width:60px;height:27px;">
					          <option value="0">分类</option>	
					          <!-- <option value="1">超级管理员</option>
					          <option value="2">普通管理员</option>
					          <option value="3">普通用户</option>	 -->	                        
					     </select> 
							<input type="text" name="uname" value="" placeholder="用户名称"/>
										
							<input type="submit"  value="查询"/>
					</form>
                
                <div class="toolbar-btn-action">
                 <button type="button" class="btn btn-yellow m-r-3" data-toggle="modal" data-target="#addUserModel"> <i class="mdi mdi-plus"></i>增加</button>
                  <!-- <a class="btn btn-success m-r-5 example-p-1" href="#!"><i class="mdi mdi-check"></i> 启用</a>
                  <a class="btn btn-warning m-r-5 example-p-2" href="#!"><i class="mdi mdi-block-helper"></i> 禁用</a> -->
                 <button type="button" class="btn btn-danger m-r-3" onclick="deleteAll()">
					<i class="mdi mdi-window-close"></i>批量删除
				</button>
                </div>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 50px;">
                          <label class="checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th>
                        <th style="width: 80px;">编号</th>
                        <th style="width: 120px;" >用户</th>
                        <th style="width: 100px;">用户角色</th>
                        <th>电子邮箱</th>
                        <th>个人简介</th>
                        <th style="width: 115px;">手机号</th>
                        <th>用户住址</th>
	                    <!-- <th>状态</th> -->
	                    <th style="width: 90px;">操作</th>
                      </tr>
                    </thead>
                    <tbody>
                      	<c:forEach items="${pageInfo.list }" var="userList">
                      
                      		<tr>
	                        <td style="width: 50px;">
	                          <label class="checkbox checkbox-primary">
	                            <input type="checkbox" name="ids" id="ids" value="${userList.uid}"><span></span>
	                          </label>
	                        </td>
	                        <td>${userList.uid }</td>
	                        <td>${userList.uname }</td>
	                        <td>${userList.role.rname }</td>
	                        <td>${userList.uemail }</td>
	                        <td>${userList.uintroduce }</td>
	                        <td >${userList.uphone }</td>
	                        <td>${userList.uaddress }</td>	                        
	                        <td>
	                          <div class="btn-group">
	                            <a class="btn btn-xs btn-default" href="javascript:void(0);" onclick="btn_edit(${userList.uid})" title="编辑" data-toggle="modal" data-target="#updateUserModel"><i class="mdi mdi-pencil"></i></a>
	                            <a class="btn btn-xs btn-default" href="javascript:void(0);" onclick='btn_delete(${userList.uid})' title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>	                          		
	                          </div>
	                        </td> 
	                      </tr>
                     
	                      	
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                <div id="div_pagination_bottom">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                     <li>
                         <a href="${ctx}/user-list.html?currpage=${pageInfo.pageNum-1}"
                           aria-label="Previous">
                             <span aria-hidden="true">&laquo;</span>
                         </a>
                     </li>
                     <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                         <c:if test="${page_Num == pageInfo.pageNum }">
                             <li class="active"><a href="#" style="margin-top: 7px;">${ page_Num}</a></li>
                        </c:if>
                         <c:if test="${page_Num != pageInfo.pageNum }">
                            <li>
                                 <a style="margin-top: 7px;" href="${ctx}/user-list.html?currpage=${ page_Num}">${ page_Num}</a>
                            </li>
                        </c:if>
                     </c:forEach>
                    <li>
                        <a href="${ctx}/user-list.html?currpage=${pageInfo.pageNum+1}"
                            aria-label="Next">
                             <span aria-hidden="true">&raquo;</span>
                         </a>
                    </li>
                </ul>
            </nav>
        </div>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
    </c:if>
    <c:if test="${loginuser.rid==2 }">
    	<!--页面主要内容-->
    	<main class="layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-toolbar clearfix">
	              	<form action="${ctx }/user-list.html" class="pull-right " method="get">       
					     <select name="rid" id="findrid" style="width:60px;height:27px;">
					          <option value="0">分类</option>	
					          <!-- <option value="1">超级管理员</option>
					          <option value="2">普通管理员</option>
					          <option value="3">普通用户</option>	 -->	                        
					     </select> 
							<input type="text" name="uname" value="" placeholder="用户名称"/>
										
							<input type="submit"  value="查询"/>
					</form>
                
                <div class="toolbar-btn-action">
               
                </div>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <!-- <th>
                          <label class="checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th> -->
                        <th>用户编号</th>
                        <th>用户昵称</th>
                        <th>用户角色</th>
                        <th>电子邮箱</th>
                        <th>个人简介</th>
                        <th>手机号</th>
                        <th>用户住址</th>
	                   <!--  <th>状态</th> -->
	                    <!-- <th>操作</th> -->
                      </tr>
                    </thead>
                    <tbody>                 
                      	<c:forEach items="${pageInfo.list }" var="userList">                     	
                      		<tr>
	                        
	                        <td>${userList.uid }</td>
	                        <td>${userList.uname }</td>
	                        <td>${userList.role.rname }</td>
	                        <td>${userList.uemail }</td>
	                        <td>${userList.uintroduce }</td>
	                        <td>${userList.uphone }</td>
	                        <td>${userList.uaddress }</td>	                      
	                         
	                      </tr>                    	                  	
                      </c:forEach>                    
                    </tbody>
                  </table>
                </div>
                <div id="div_pagination_bottom">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                     <li>
                         <a href="${ctx}/user-list.html?currpage=${pageInfo.pageNum-1}"
                           aria-label="Previous">
                             <span aria-hidden="true">&laquo;</span>
                         </a>
                     </li>
                     <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                         <c:if test="${page_Num == pageInfo.pageNum }">
                             <li class="active"><a href="#" style="margin-top: 7px;">${ page_Num}</a></li>
                        </c:if>
                         <c:if test="${page_Num != pageInfo.pageNum }">
                            <li>
                                 <a style="margin-top: 7px;" href="${ctx}/user-list.html?currpage=${ page_Num}">${ page_Num}</a>
                            </li>
                        </c:if>
                     </c:forEach>
                    <li>
                        <a href="${ctx}/user-list.html?currpage=${pageInfo.pageNum+1}"
                            aria-label="Next">
                             <span aria-hidden="true">&raquo;</span>
                         </a>
                    </li>
                </ul>
            </nav>
        </div>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
    </c:if>
    
    
              <!--增加部分的模態框-->
                <div class="modal fade" id="addUserModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myLargeModalLabel">增加用户</h4>
                      </div>
                      <div class="modal-body">
                       <form class="form-horizontal" id="saveForm" action="" method="post" onsubmit="return false;">
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">用戶名</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="example-hf-email" name="uname" placeholder="请输入用戶名..">
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="col-md-3 control-label" for="example-select">用戶角色</label>
                            <div class="col-md-7">
                              <select class="form-control" id="addrid" name="rid" size="1">
                                <option value="0">请选择</option>
                                <!-- <option value="1">超級管理員</option>
                                <option value="2">普通管理員</option>
                                <option value="3">普通用户</option> -->
                              </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">用戶邮箱</label>
                            <div class="col-md-7">
                              <input class="form-control" type="email" id="example-hf-email" name="uemail" placeholder="请输入邮箱..">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">密码</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="example-hf-email" name="upassword" placeholder="请输入密码..">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">个人简介</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="example-hf-email" name="uintroduce" placeholder="请输入简介..">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">用戶电话</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="example-hf-email" name="uphone" placeholder="请输入电话..">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">用戶地址</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="example-hf-email" name="uaddress" placeholder="请输入地址..">
                            </div>
                          </div>
                        
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary save">确定</button>
                      </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
                
                
         <!--修改部分的模態框-->
                 <div class="modal fade" id="updateUserModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myLargeModalLabel">修改用戶</h4>
                      </div>
                      <div class="modal-body">
                       <form class="form-horizontal" id="updateForm" action="" method="post" onsubmit="return false;">
                          
                          <input id="euid" type="hidden" name="uid">
                          
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">用戶名</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="euname" name="uname" placeholder="请输入用戶名..">
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="col-md-3 control-label" for="example-select">用戶角色</label>
                            <div class="col-md-7">
                              <select class="form-control" id="erid" name="rid" size="1">
                                <option value="0">请选择</option>
                                <!-- <option value="1">超級管理員</option>
                                <option value="2">普通管理員</option>
                                <option value="3">普通用户</option> -->
                              </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">用戶邮箱</label>
                            <div class="col-md-7">
                              <input class="form-control" type="email" id="euemail" name="uemail" placeholder="请输入邮箱..">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">密码</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="eupassword" name="upassword" placeholder="请输入密码..">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">个人简介</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="euintroduce" name="uintroduce" placeholder="请输入简介..">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">用戶电话</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="euphone" name="uphone" placeholder="请输入电话..">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">用戶地址</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="euaddress" name="uaddress" placeholder="请输入地址..">
                            </div>
                          </div>
                        
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="buttonUpdate" class="btn btn-primary updateM">修改</button>
                      </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>

  </div>
</div>

<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/main.js"></script>
<!--对话框-->
<script src="${ctx}/static/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript">
$(function(){
    /* $('.search-bar .dropdown-menu a').click(function() {
        var field = $(this).data('field') || '';
        $('#search-field').val(field);
        $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
    }); */
  //获得所有的角色信息
	  $.get("${ctx}/getRoleList",function(data){
		 //将数据设置到页面的table中
		 //alert(data);
		 $(data).each(function(){
			 var option="<option value='"+this.rid+"'>"+this.rname+"</option>";
			 //将创建的列表项添加到下拉列表中
			  $("#addrid").append(option);
			 $("#erid").append(option);
			 $("#findrid").append(option);
			 //$("#tid2").append(option);
			
		 });
	 });
 
    //增加
    $('.save').on('click', function () {
      /* if($(this).text()=="确定"){ */
    	  $.ajax({
        	  url:"${ctx}/addUser",
        	  type:"POST",
        	  data:$("#saveForm").serialize(),
        	  success:function(data){
        		 if(data.result >0){
        			 alert("增加成功");
        			 $(".modal").hide();
        			 location.reload();
        		 }else{
         			alert("增加失败");
         		}
        	  }  
          });
    });
    
    //修改
    $(".updateM").click(function(){
    	$.ajax({
      	  url:"${ctx}/updateUser",
      	  type:"POST",
      	  data:$("#updateForm").serialize(),
      	  success:function(data){
      		 if(data.result >0){
      			 alert("修改成功");
      			 $(".modal").hide();
      			 location.reload();
      		 }else{
       			alert("修改失败");
       		}
      	  }  
        });
    	
    });
    
		

});
</script>
<script type="text/javascript">
<!-- 批量删除的操作 -->
  function deleteAll() {
      var checkNum=$("input[name='ids']:checked").length;
      if(checkNum==0){
          alert("请至少选择一项");
          return;
           }
           if(confirm("确定要删除吗？")){
               var productList=new Array();
               $("input[name='ids']:checked").each(function () {
            	   productList.push($(this).val())
               });
           }
           $.ajax({
               type:"post",
               url:"${ctx}/deleteManyUser",
               data:{productList:productList.toString()},
               success:function (data) {
            	   if(data.result>0){
            		   alert("删除成功")
                       location.reload();
            	   }
                   
               },
               error:function () {
                   alert("删除失败")
               }
    	  })
       }
       
  
//编辑
	var btn_edit=function(uid){
	//alert("进入方法");
		$.get("${ctx}/findById",{uid:uid},function(data){
			$("#euid").val(data.uid);
			$("#euname").val(data.uname);
			$("#erid").val(data.rid);
			$("#euemail").val(data.uemail);
			$("#eupassword").val(data.upassword);
			$("#euintroduce").val(data.uintroduce);
			$("#euphone").val(data.uphone);
			$("#euaddress").val(data.uaddress);
		});
	}
	
	//删除
	 var btn_delete=function(uid){ 
		if(confirm("您确定要删除吗？"))
		{
			$.ajax({
				type:"get",
				url:"${ctx}/deleteUser",
				data:{uid:uid},
				dataType:"json",
				success:function(data){
					if(data.result>0){
						alert("删除成功！");
						location.reload();
					}
				}
			}); 
		}
		 
	}  

</script>
</body>
</html>