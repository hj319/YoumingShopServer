<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>订单列表</title>
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" type="image/x-icon">
<meta name="author" content="yinqi">
<link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css" rel="stylesheet">
<!--对话框-->
<link rel="stylesheet" href="${ctx}js/jconfirm/jquery-confirm.min.css">
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
            <li class="nav-item nav-item-has-subnav active open" >
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
            <span class="navbar-page-title"> 订单管理 - 订单列表 </span>
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
                <form class="pull-right " method="get" action="${ctx}/order-list.html">       
	                     <input type="text" name="uphone" value="" placeholder="电话号码或订单号"/>
										
							<input type="submit"  value="查询"/>
				</form>
                <div class="toolbar-btn-action">
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
                        <th>
                          <label class="checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th>
                        <th>买家名称</th>
                        <th>买家电话</th>
                        <th>买家地址</th>
                        <th>下单商品</th>
                        <!-- <th>商品单价</th> -->
                        <th>下单数量</th>
                        <th>商品状态</th>
                        <th>支付状态</th>
                        <th>快递</th>
                        <th>订单号</th>
                        <!-- <th>总金额</th> -->
                        <!-- <th>下单时间</th>	   -->                  
	                    <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                      	<c:forEach items="${pageInfo.list }" var="o">
	                      	<tr>
	                        <td>
	                          <label class="checkbox checkbox-primary">
	                            <input type="checkbox" name="ids" id="ids" value="${o.odid}"><span></span>
	                          </label>
	                        </td>
	                        <td>${o.order.uname }</td>
	                        <td>${o.order.uphone }</td>
	                        <td>${o.order.uaddress }</td>
	                        <td>${o.product.pname }</td>
	                        <%-- <td>￥${o.product.discountPrice }</td> --%>
	                        <td>${o.comAmount }</td>
	                        <td>${o.order.orderStatus }</td>
	                        <td>${o.order.payStatus }</td>
	                        <td>${o.order.courier }</td>
	                        <td>${o.order.trackNum }</td>
	                        <%-- <td>${o.order.totalPrice }</td> --%>
	                       <%--  <td>${o.order.creatTime }</td>	 --%>              
	                        <td>
	                          <div class="btn-group">
	                            <a onclick="btn_edit(${o.odid})" class="btn btn-xs btn-default" href="#!" title="编辑" data-toggle="modal" data-target="#updateOrderModel"><i class="mdi mdi-pencil"></i></a>
	                            <a class="btn btn-xs btn-default" href="javascript:void(0);" onclick='btn_delete(${o.odid})' title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
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
						href="${ctx}/order-list.html?currpage=${pageInfo.pageNum-1}"
						aria-label="Previous"> <span>&laquo;</span>
					</a></li>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#" style="margin-top: 7px;">${ page_Num}</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a style="margin-top: 7px;"
								href="${ctx}/order-list.html?currpage=${ page_Num}">${ page_Num}</a>
							</li>
						</c:if>
					</c:forEach>
					<li><a
						href="${ctx}/order-list.html?currpage=${pageInfo.pageNum+1}"
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
  	<!--修改部分的模態框-->
                 <div class="modal fade" id="updateOrderModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myLargeModalLabel">修改订单</h4>
                      </div>
                      <div class="modal-body">
                       <form class="form-horizontal" id="updateForm" action="" method="post" onsubmit="return false;">
                          
                          <input id="oid" type="hidden" name="oid">
                          
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">买家名称</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="uname" name="uname" value="">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">买家电话</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="uphone" name="uphone" value="">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">送货地址</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="uaddress" name="uaddress" value="">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">商品状态</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="orderStatus" name="orderStatus" value="">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">支付状态</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="payStatus" name="payStatus" value="">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">快递公司</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="courier" name="courier" value="">
                            </div>
                          </div>
                          <!-- <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">快递编号</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="trackNum" name="trackNum" value="">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label" for="example-hf-email">总金额</label>
                            <div class="col-md-7">
                              <input class="form-control" type="text" id="totalPrice" name="totalPrice" value="">
                            </div>
                          </div> -->
                        
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary updateM">保存</button>
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
<script src="${ctx}js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript">
$(function(){
	//修改
    $(".updateM").click(function(){
    	//alert("进入"+odid);
    	$.ajax({
      	  url:"${ctx}/updateOrder",
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
               url:"${ctx}/deleteManyOrder",
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
	var btn_edit=function(odid){
		$.get("${ctx}/findByOid",{odid:odid},function(data){
			$("#odid").val(data.odid);
			$("#oid").val(data.oid);
			$("#uname").val(data.order.uname);
			$("#uphone").val(data.order.uphone);
			$("#uaddress").val(data.order.uaddress);
			$("#orderStatus").val(data.order.orderStatus);
			$("#payStatus").val(data.order.payStatus);
			$("#courier").val(data.order.courier);
		}); 
	}
	
	//删除
	 var btn_delete=function(odid){ 
		 if(confirm("您确定要删除吗？"))
		 {
			 $.ajax({
					type:"get",
					url:"${ctx}/deleteOrder",
					data:{odid:odid},
					dataType:"json",
					success:function(data){
						if(data.result>0){
							location.reload();
						}
					}
				}); 
		 }
		 
	}
</script>
</body>
</html>