﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>商品分类列表</title>
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
        <a href="index.html"><img src="${ctx}/static/images/logo-sidebar.png" title="" alt="" /></a>
      </div>
      <div class="layout-sidebar-scroll">
        
        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <li class="nav-item"> <a href="index.html"><i class="mdi mdi-home"></i> 后台首页</a> </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-account-box"></i> 用户管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="user-list.html">用户列表</a> </li>
                <!-- <li> <a href="user-role.html">角色管理</a> </li> -->
              </ul>
            </li>
             <li class="nav-item nav-item-has-subnav active open">
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
            <span class="navbar-page-title"> 商品管理 - 分类列表 </span>
          </div>
          
          <ul class="topbar-right">
           <li class="dropdown dropdown-profile"><a
								href="javascript:void(0)" data-toggle="dropdown"> <img
									class="img-avatar img-avatar-48 m-r-10"
									src="/imgUrl/headImage/${loginuser.headImage}"
									alt="管理员" /> <span>${loginuser.uname} <span
										class="caret"></span></span>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="${ctx}/pages_profile"><i
											class="mdi mdi-account"></i> 个人信息</a></li>
									<li><a href="${ctx}/pages_edit_pwd"><i
											class="mdi mdi-lock-outline"></i> 修改密码</a></li>
									<!-- <li><a href="javascript:void(0)"><i
											class="mdi mdi-delete"></i> 清空缓存</a></li> -->
									<li class="divider"></li>
									<li><a href="${ctx}/loginOut"><i
											class="mdi mdi-logout-variant"></i> 退出登录</a></li>
								</ul></li>
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
							<div class="card-toolbar clearfix">
								<form class="pull-right " method="get" action="${ctx}/product-category.html">       
				                      
									<input type="text" id="findByname" name="typeName"  value="" placeholder="分类名称"/>
									
									<input type="submit" value="搜索"/>
								</form>
								<div class="toolbar-btn-action">
								 <button type="button" class="btn btn-yellow m-r-3" data-toggle="modal" data-target="#myModal"><i class="mdi mdi-plus"></i>增加分类</button>
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
												<th style="width: 50px;"><label
													class="checkbox checkbox-primary"> <input
														type="checkbox" id="check-all"><span></span>
												</label></th>
												<th style="width: 100px;">编号</th>
												<th class="text-center">分类名称</th>
												<th class="text-center">备注</th>
												<th class="text-center">创建时间</th>
												<th class="text-center">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${pageInfo.list}" var="proty">
												<tr>
													<td style="width: 50px;"><label
														class="checkbox checkbox-primary"> <input
															type="checkbox" name="ids" id="ids" value="${proty.tid}"><span></span>
													</label></td>
													<td style="width: 100px;">${proty.tid}</td>
													<td class="text-center">${proty.typeName}</td>
													<td>${proty.typeNotes }</td>
													<td class="text-center"><fmt:formatDate value="${proty.createTime}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
													<td class="text-center">
														<div class="btn-group">
															<a class="btn btn-xs btn-default" href="" title="编辑" onclick="btn_edit(${proty.tid})"
																data-toggle="modal" data-target="#myModalUpdate"><i class="mdi mdi-pencil"></i></a>
															<a class="btn btn-xs btn-default" href="#!" title="删除" onclick='deleteProductType(${proty.tid})'
																data-toggle="tooltip"><i
																class="mdi mdi-window-close"></i></a>
														</div>
													</td>
												</tr>
											</c:forEach>


										</tbody>
									</table>
								</div>
								<!-- 分页显示 开始 -->
								<ul class="pagination">
									<li><a
										href="${ctx}/product-category.html?currpage=${pageInfo.pageNum-1}"
										aria-label="Previous"> <span>&laquo;</span>
									</a></li>
									<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
										<c:if test="${page_Num == pageInfo.pageNum }">
											<li class="active"><a href="#" style="margin-top: 7px;">${ page_Num}</a></li>
										</c:if>
										<c:if test="${page_Num != pageInfo.pageNum }">
											<li><a style="margin-top: 7px;"
												href="${ctx}/product-category.html?currpage=${ page_Num}">${ page_Num}</a>
											</li>
										</c:if>
									</c:forEach>
									<li><a
										href="${ctx}/product-category.html?currpage=${pageInfo.pageNum+1}"
										aria-label="Next"> <span>&raquo;</span>
									</a></li>
								</ul>
								<!-- 分页显示结束 -->
							</div>
						</div>
					</div>

				</div>
			</div>
			</main>
    <!--End 页面主要内容-->
    <!-- 增加的模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">增加分类</h4>
                      </div>
                      <div class="modal-body">
                    		<form class="form-horizontal" id="addProductType" action="#" method="post" enctype="multipart/form-data" onsubmit="return false;">
								 
								 <div class="form-group">
				                    <label class="col-xs-8" for="example-text-input">分类名称：</label>
				                    <div class="col-xs-8">
				                      <input class="form-control" type="text" id="typeName" name="typeName" value="" placeholder="请输入分类名称">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-textarea-input">分类描述：</label>
				                    <div class="col-xs-8">
				                      <textarea class="form-control" id="typeNotes" name="typeNotes" value="" rows="6" placeholder="请输入分类描述"></textarea>
				                    </div>
				                  </div>
							</form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>                                              
                        <button type="button" class="btn btn-primary addProductType">保存</button>                                               
                      </div>
                    </div>
                  </div>
                </div>
    <!--修改的模态框-->
		 <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改分类</h4>
                      </div>
                      <div class="modal-body">
                    		<form class="form-horizontal" id="updateProductType" action="#" method="post" enctype="multipart/form-data" onsubmit="return false;">
								 <input type="hidden" name="tid" id="edittid" value="${empty productType ? '':productType.tid}" />
								 <div class="form-group">
				                    <label class="col-xs-8" for="example-text-input">分类名称：</label>
				                    <div class="col-xs-8">
				                      <input class="form-control" type="text" id="edittypeName" name="typeName" value="${empty productType ? '':productType.typeName}" placeholder="请输入分类名称">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-textarea-input">分类描述：</label>
				                    <div class="col-xs-8">
				                      <textarea class="form-control" id="edittypeNotes" name="typeNotes" value="${empty productType ? '':productType.typeNotes}" rows="6" placeholder="请输入分类描述"></textarea>
				                    </div>
				                  </div>
							</form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>                                              
                        <button type="button" class="btn btn-primary edit_update">修改</button>                                               
                      </div>
                    </div>
                  </div>
                </div>
  </div>
</div>


<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/perfect-scrollbar.min.js"></script>
<!--对话框-->
	<script type="text/javascript" src="${ctx}/static/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/main.js"></script>
<script type="text/javascript">
$(function(){
    $('.search-bar .dropdown-menu a').click(function() {
        var field = $(this).data('field') || '';
        $('#search-field').val(field);
        $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
    });
    
    //增加
    $('.addProductType').on('click', function () {
    	$.ajax({
    		url:"${ctx}/saveProductType",
            type:"post", 
            data:$("#addProductType").serialize(),
            success:function (data) {
         	   if(data.result>0){
         		   alert("增加成功");
         		   $(".model").hide();
                    location.reload();
         	   }
         	   else{
					alert("增加失败");
         	   }
            }         
   		 });
    });
  //修改
    $('.edit_update').on('click', function () {
    	//alert("进入方法");
    	$.ajax({
    		url:"${ctx}/updateProductType",
            type:"post", 
            data:$("#updateProductType").serialize(),
            success:function (data) {
         	   if(data.result>0){
         		   alert("修改成功");
         		   $(".model").hide();
                    location.reload();
         	   }
         	   else{
					alert("修改失败");
         	   }
            }         
   		 });
    });
  
  
    
});
</script>
<!-- 批量删除的操作 -->
<script type="text/javascript">
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
               url:"${ctx}/deleteManyOfCategory",
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
       var btn_edit=function(tid){
       	//alert("进入方法");
       	$.get("${ctx}/getProductTypeById",{tid:tid},function(data){
       		$("#edittid").val(data.tid);
       		$("#edittypeName").val(data.typeName);
       		$("#edittypeNotes").val(data.typeNotes);
       	});
       }
     
     //删除单条数据
	var deleteProductType = function(tid) {
		//alert("进入方法")
		if(confirm("确定要删除吗"))
		{
			$.ajax({
	    		url:"${ctx}/deleteProductType",
	            type:"get", 
	            data:{tid:tid},
	            success:function (data) {
	         	   if(data.result>0){
	         		   alert("删除成功");
	                    location.reload();
	         	   }
	         	  /*  else{
					alert("删除失败");
	         	   } */
	            }         
	   		 });
		}		 
	}
</script>
</body>
</html>