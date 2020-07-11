<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>商品列表</title>
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
	<div class="layout-web tabs">
		<div class="layout-container">
			<!--左侧导航-->
			<aside class="layout-sidebar">

				<!-- logo -->
				<div id="logo" class="sidebar-header">
					<a href="index.html"><img
						src="${ctx}/static/images/logo-sidebar.png" title="" alt="" /></a>
				</div>
				<div class="layout-sidebar-scroll">

					<nav class="sidebar-main">
						<ul class="nav nav-drawer">
							<li class="nav-item"><a href="index.html"><i
									class="mdi mdi-home"></i> 后台首页</a></li>
							<li class="nav-item nav-item-has-subnav"><a
								href="javascript:void(0)"><i class="mdi mdi-account-box"></i>
									用户管理</a>
								<ul class="nav nav-subnav">
									<li><a href="user-list.html">用户列表</a></li>
									<!-- <li><a href="user-role.html">角色管理</a></li> -->
								</ul></li>
							<li class="nav-item nav-item-has-subnav active open"><a
								href="javascript:void(0)"><i class="mdi mdi-briefcase"></i>
									商品管理</a>
								<ul class="nav nav-subnav">
									<li><a href="product-list.html">商品列表</a></li>
									<li><a href="product-category.html">分类列表</a></li>
									<li><a href="product-comment.html">评论列表</a></li>
								</ul></li>
							<li class="nav-item nav-item-has-subnav"><a
								href="javascript:void(0)"><i class="mdi mdi-tooltip-text"></i>
									博客管理</a>
								<ul class="nav nav-subnav">
									<li><a href="blog-list.html">博客列表</a></li>
									<li><a href="blog-category.html">分类列表</a></li>
									<li><a href="blog-comment.html">评论列表</a></li>
								</ul></li>
							<li class="nav-item nav-item-has-subnav"><a
								href="javascript:void(0)"><i
									class="mdi mdi-comment-processing-outline"></i> 消息管理</a>
								<ul class="nav nav-subnav">
									<li><a href="information-list.html">消息列表</a></li>

								</ul></li>
							<li class="nav-item nav-item-has-subnav"><a
								href="javascript:void(0)"><i class="mdi mdi-cart-outline"></i>
									订单管理</a>
								<ul class="nav nav-subnav">
									<li><a href="order-list.html">订单列表</a></li>
								</ul></li>
							<!-- <li class="nav-item nav-item-has-subnav"><a
								href="javascript:void(0)"><i class="mdi mdi-cube"></i> 广告管理</a>
								<ul class="nav nav-subnav">
									<li><a href="">广告列表</a></li>

								</ul></li> -->
							<!-- <li class="nav-item nav-item-has-subnav"><a
								href="javascript:void(0)"><i class="mdi mdi-link"></i> 链接管理</a>
								<ul class="nav nav-subnav">
									<li><a href="">友情链接列表</a></li>
								</ul></li> -->
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
								<span class="toggler-bar"></span> <span class="toggler-bar"></span>
								<span class="toggler-bar"></span>
							</div>
							<span class="navbar-page-title"> 商品管理 - 商品列表 </span>
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
							<li class="dropdown dropdown-skin"><span
								data-toggle="dropdown" class="icon-palette"><i
									class="mdi mdi-palette"></i></span>
								<ul class="dropdown-menu dropdown-menu-right"
									data-stopPropagation="true">
									<li class="drop-title"><p>主题</p></li>
									<li class="drop-skin-li clearfix"><span class="inverse">
											<input type="radio" name="site_theme" value="default"
											id="site_theme_1" checked> <label for="site_theme_1"></label>
									</span> <span> <input type="radio" name="site_theme"
											value="dark" id="site_theme_2"> <label
											for="site_theme_2"></label>
									</span> <span> <input type="radio" name="site_theme"
											value="translucent" id="site_theme_3"> <label
											for="site_theme_3"></label>
									</span></li>
									<li class="drop-title"><p>LOGO</p></li>
									<li class="drop-skin-li clearfix"><span class="inverse">
											<input type="radio" name="logo_bg" value="default"
											id="logo_bg_1" checked> <label for="logo_bg_1"></label>
									</span> <span> <input type="radio" name="logo_bg"
											value="color_2" id="logo_bg_2"> <label
											for="logo_bg_2"></label>
									</span> <span> <input type="radio" name="logo_bg"
											value="color_3" id="logo_bg_3"> <label
											for="logo_bg_3"></label>
									</span> <span> <input type="radio" name="logo_bg"
											value="color_4" id="logo_bg_4"> <label
											for="logo_bg_4"></label>
									</span> <span> <input type="radio" name="logo_bg"
											value="color_5" id="logo_bg_5"> <label
											for="logo_bg_5"></label>
									</span> <span> <input type="radio" name="logo_bg"
											value="color_6" id="logo_bg_6"> <label
											for="logo_bg_6"></label>
									</span> <span> <input type="radio" name="logo_bg"
											value="color_7" id="logo_bg_7"> <label
											for="logo_bg_7"></label>
									</span> <span> <input type="radio" name="logo_bg"
											value="color_8" id="logo_bg_8"> <label
											for="logo_bg_8"></label>
									</span></li>
									<li class="drop-title"><p>头部</p></li>
									<li class="drop-skin-li clearfix"><span class="inverse">
											<input type="radio" name="header_bg" value="default"
											id="header_bg_1" checked> <label for="header_bg_1"></label>
									</span> <span> <input type="radio" name="header_bg"
											value="color_2" id="header_bg_2"> <label
											for="header_bg_2"></label>
									</span> <span> <input type="radio" name="header_bg"
											value="color_3" id="header_bg_3"> <label
											for="header_bg_3"></label>
									</span> <span> <input type="radio" name="header_bg"
											value="color_4" id="header_bg_4"> <label
											for="header_bg_4"></label>
									</span> <span> <input type="radio" name="header_bg"
											value="color_5" id="header_bg_5"> <label
											for="header_bg_5"></label>
									</span> <span> <input type="radio" name="header_bg"
											value="color_6" id="header_bg_6"> <label
											for="header_bg_6"></label>
									</span> <span> <input type="radio" name="header_bg"
											value="color_7" id="header_bg_7"> <label
											for="header_bg_7"></label>
									</span> <span> <input type="radio" name="header_bg"
											value="color_8" id="header_bg_8"> <label
											for="header_bg_8"></label>
									</span></li>
									<li class="drop-title"><p>侧边栏</p></li>
									<li class="drop-skin-li clearfix"><span class="inverse">
											<input type="radio" name="sidebar_bg" value="default"
											id="sidebar_bg_1" checked> <label for="sidebar_bg_1"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
											value="color_2" id="sidebar_bg_2"> <label
											for="sidebar_bg_2"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
											value="color_3" id="sidebar_bg_3"> <label
											for="sidebar_bg_3"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
											value="color_4" id="sidebar_bg_4"> <label
											for="sidebar_bg_4"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
											value="color_5" id="sidebar_bg_5"> <label
											for="sidebar_bg_5"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
											value="color_6" id="sidebar_bg_6"> <label
											for="sidebar_bg_6"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
											value="color_7" id="sidebar_bg_7"> <label
											for="sidebar_bg_7"></label>
									</span> <span> <input type="radio" name="sidebar_bg"
											value="color_8" id="sidebar_bg_8"> <label
											for="sidebar_bg_8"></label>
									</span></li>
								</ul></li>
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
								<form class="pull-right " method="get" action="${ctx}/product-list.html">       
				                      <select id="typeId" name="tid" id="findBytypeId" style="width:60px;height:27px;">
				                        <option value="0">分类</option>			                        
				                      </select> 
									<input type="text" id="findBypname" name="pname"  value="" placeholder="商品名称"/>
									
									<input type="submit" value="搜索"/>
								</form>
								<div class="toolbar-btn-action">
									
									 <button type="button" class="btn btn-yellow m-r-3" data-toggle="modal" data-target="#myModal">
								        <i class="mdi mdi-plus"></i>增加商品
								     </button>
									 <button type="button" class="btn btn-danger m-r-3" onclick="deleteAll()">
										<i class="mdi mdi-window-close"></i>批量删除
									</button>
								</div>
							</div>
							<div class="card-body">

								<div class="table-responsive">
									<table class="table table-bordered" id="tbRecord">
										<thead>
											<tr>
												<th style="width: 50px;"><label
													class="checkbox checkbox-primary"> <input
														type="checkbox" id="check-all"><span></span>
												</label></th>
												<th style="width: 100px;">编号</th>
												<th class="text-center">商品名称</th>
												<th class="text-center">商品图片</th>
												<th class="text-center">原价</th>
												<th class="text-center">折扣价</th>
												<th class="text-center">种类</th>
												<th class="text-center">描述</th>
												<th class="text-center">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${pageInfo.list}" var="pro">
												<tr>
													<td style="width: 50px;"><label
														class="checkbox checkbox-primary"> <input
															type="checkbox" name="ids" id="ids" value="${pro.pid}"><span></span>
													</label></td>
													<td style="width: 100px;">${pro.pid}</td>
													<td class="text-center">${pro.pname}</td>
													<td class="text-center"><img alt="商品图片"
														src="/imgUrl/product/${pro.img}"
														class="img-circle" style="height: 50px; width: 50px;">
													</td>
													<td class="text-center">￥${pro.originalPrice}</td>
													<td class="text-center">￥${pro.discountPrice}</td>
													<td class="text-center">${pro.producttype.typeName}</td>
													<td>${pro.describe}</td>
													<td class="text-center">
														<div class="btn-group">
							                            <a onclick="btn_edit(${pro.pid})" class="btn btn-xs btn-default" href="#!" title="编辑" data-toggle="modal" data-target="#myModalUpdate"><i class="mdi mdi-pencil"></i></a>
							                            <a class="btn btn-xs btn-default" href="javascript:void(0);" onclick='deleteProduct(${pro.pid})' title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
							                          		
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
										href="${ctx}/product-list.html?currpage=${pageInfo.pageNum-1}"
										aria-label="Previous"> <span>&laquo;</span>
									</a></li>
									<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
										<c:if test="${page_Num == pageInfo.pageNum }">
											<li class="active"><a href="#" style="margin-top: 7px;">${ page_Num}</a></li>
										</c:if>
										<c:if test="${page_Num != pageInfo.pageNum }">
											<li><a style="margin-top: 7px;"
												href="${ctx}/product-list.html?currpage=${ page_Num}">${ page_Num}</a>
											</li>
										</c:if>
									</c:forEach>
									<li><a
										href="${ctx}/product-list.html?currpage=${pageInfo.pageNum+1}"
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
                        <h4 class="modal-title" id="myModalLabel">增加商品</h4>
                      </div>
                      <div class="modal-body">
                       	<form class="form-horizontal" action="#" id="addProduct" method="post" enctype="multipart/form-data" onsubmit="return false;">
								 <div class="form-group">
				                    <label class="col-xs-8" for="example-text-input">商品名称：</label>
				                    <div class="col-xs-8">
				                      <input class="form-control" type="text" id="pname" name="pname" placeholder="请输入商品名称">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-file-input">商品图片：</label>
				                    <div class="col-xs-8">
				                      <input type="file" class="btn_file" id="fileUp" name="fileUp" >
				                      <img id="stu_pic" width="50" height="50">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-number-input">原价：</label>
				                    <div class="col-xs-8">
				                      <input class="form-control" type="number" id="originalPrice" name="originalPrice" placeholder="请输入商品原价">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-number-input">折扣价：</label>
				                    <div class="col-xs-8">
				                      <input class="form-control" type="number" id="discountPrice" name="discountPrice" placeholder="请输入商品折扣价">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-select">商品类别：</label>
				                    <div class="col-xs-8">
				                      <select class="form-control" id="tid1" name="tid" size="1">
				                        <option value="0">请选择</option>
				                        
				                      </select>
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-textarea-input">商品描述：</label>
				                    <div class="col-xs-8">
				                      <textarea class="form-control" id="describe" name="describe" rows="6" placeholder="请输入商品描述"></textarea>
				                    </div>
				                  </div>
							</form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary addProduct">点击保存</button>
                      </div>
                    </div>
                  </div>
                </div>
			<!-- 修改的模态框 -->
			<div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改商品</h4>
                      </div>
                      <div class="modal-body">
                       	<form class="form-horizontal" action="#" id="updateProduct" method="post" enctype="multipart/form-data" onsubmit="return false;">
								 <input type="hidden" id="editpid" name="pid" />
								 <div class="form-group">
				                    <label class="col-xs-8" for="example-text-input">商品名称：</label>
				                    <div class="col-xs-8">
				                      <input class="form-control" type="text" id="editpname" name="pname" placeholder="请输入商品名称">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-file-input">商品图片：</label>
				                    <div class="col-xs-8">
				                    	<input type="hidden" name="img" id="img"/>
				                      <input type="file" class="editbtn_file" id="editfileUp" name="fileUp" >
				                      <img id="editImg" width="50" height="50">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-number-input">原价：</label>
				                    <div class="col-xs-8">
				                      <input class="form-control" type="number" id="editoriginalPrice" name="originalPrice" placeholder="请输入商品原价">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-number-input">折扣价：</label>
				                    <div class="col-xs-8">
				                      <input class="form-control" type="number" id="editdiscountPrice" name="discountPrice" placeholder="请输入商品折扣价">
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-select">商品类别：</label>
				                    <div class="col-xs-8">
				                      <select class="form-control" id="tid2" name="tid" size="1">
				                        <option value="0">请选择</option>
				                        
				                      </select>
				                    </div>
				                  </div>
				                  <div class="form-group">
				                    <label class="col-xs-8" for="example-textarea-input">商品描述：</label>
				                    <div class="col-xs-8">
				                      <textarea class="form-control" id="editdescribe" name="describe" rows="6" placeholder="请输入商品描述"></textarea>
				                    </div>
				                  </div>
							</form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary updateProduct">点击修改</button>
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
	<script type="text/javascript" src="${ctx}/static/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript">
	//选择好图片之后及时显示图片
	$(document).off('change','fileUp').on('change','#fileUp',function(){
		
		$('#stu_pic').attr('src',URL.createObjectURL($(this)[0].files[0]));
	});
	$(document).off('change','editfileUp').on('change','#editfileUp',function(){
		
		$('#editImg').attr('src',URL.createObjectURL($(this)[0].files[0]));
	});
	$(function(){
					
	//获得所有的分类信息
	  $.get("${ctx}/getProductTypeList",function(data){
		 //将数据设置到页面的table中
		 //alert(data);
		 $(data).each(function(){
			 var option="<option value='"+this.tid+"'>"+this.typeName+"</option>";
			 //将创建的列表项添加到下拉列表中
			  $("#typeId").append(option);
			 $("#tid1").append(option);
			 $("#tid2").append(option);	
		 });
	 });  
	
	//上传图片方法
	  $(".btn_file").on("change",function() {
			//alert("进入方法");
	    	 var crowd_file = $('#fileUp')[0].files[0];
	    	 var formData = new FormData();
	    	 formData.append("crowd_file",$('#fileUp')[0].files[0]);
	    	 //alert(crowd_file);
	    	$.ajax({		
	    	  url:'${ctx}/uploadFile',
	    	  type:'post',
	    	  dataType: "json",
	    	  data: formData,
	          async: false,
	          cache: false,
	          contentType: false,
	          processData: false,
	  	  	success:function(data){
	    		  if(data.result>0){
	        		   alert("上传成功"); 
	        	   }
	        	   else{
						alert("上传失败");
	        	   }
	    	  }
	    	});
	    });	
	 
  //增加方法
    $('.addProduct').on('click', function () {
    	$.ajax({
    		url:"${ctx}/addProductList",
            type:"post", 
            data:$("#addProduct").serialize(),
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
  //修改方法
    $('.updateProduct').on('click', function () {
    	$.ajax({
    		url:"${ctx}/updateProduct",
            type:"post", 
            data:$("#updateProduct").serialize(),
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
	
 
})
//根据id查找的方法
     var btn_edit = function(pid) {
		
    	 $.get("${ctx}/getProductById",{pid:pid},function(data){
    		 	var img=data.img;
    		 	//alert(img);
    		 	//alert(data.pid);
        		$("#editpid").val(data.pid);
        		$("#editpname").val(data.pname);
        		$("#editImg").attr("src","/"+"imgUrl"+"/"+"product"+"/"+data.img);
        		$("#img").val(img);
        		$("#editoriginalPrice").val(data.originalPrice);
        		$("#editdiscountPrice").val(data.discountPrice);
        		$.get("${ctx}/getProductTypeList",function(data1){	 
        			$(data1).each(function(i){//代表的是下标，下标从0开始
						 if(data.tid==this.tid){
							 $("#tid2").find("option").eq(i+1).attr("selected","selected");
						 }
					 });
        		 }); 
        		$("#editdescribe").val(data.describe);
        		
        	});		
		}
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
               url:"${ctx}/deleteMany",
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
       
     //删除单条数据
		var deleteProduct = function(pid) {
			//alert("进入方法")
			if(confirm("确定要删除吗？"))
			{
				$.ajax({
		    		url:"${ctx}/deleteProduct",
		            type:"get", 
		            data:{pid:pid},
		            success:function (data) {
		         	   if(data.result>0){
		         		   alert("删除成功");
		                    location.reload();
		         	   }
		         	   /* else{
						alert("删除失败");
		         	   } */
		            }         
		   		 }); 
			}	
		}
     
   //上传图片方法(修改)
	  $(".editbtn_file").on("change",function() {
			//alert("进入方法");
	    	 var crowd_file = $('#editfileUp')[0].files[0];
	    	 var formData = new FormData();
	    	 formData.append("crowd_file",$('#editfileUp')[0].files[0]);
	    	 //alert(crowd_file);
	    	$.ajax({		
	    	  url:'${ctx}/uploadFile',
	    	  type:'post',
	    	  dataType: "json",
	    	  data: formData,
	          async: false,
	          cache: false,
	          contentType: false,
	          processData: false,
	  	  	success:function(data){
	    		  if(data.result>0){
	        		   alert("上传成功"); 
	        	   }
	        	   else{
						alert("上传失败");
	        	   }
	    	  }
	    	});
	    });	
</script>


</body>
</html>