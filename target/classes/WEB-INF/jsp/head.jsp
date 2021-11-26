<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>后台登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="favicon.ico" type="${APP_PATH}/static/image/x-icon" />
    <link rel="stylesheet" href="${APP_PATH}/static/css/font.css">
	<link rel="stylesheet" href="${APP_PATH}/static/css/xadmin.css">
    <script src="${APP_PATH}/static/js/jquery.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/xadmin.js"></script>

</head>
<body>

<%--    <div class="container" >
        <div class="logo"><a href="http://localhost:8080/">后台管理</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">${currentUser.name }</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a href=http://localhost:8080/">退出</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item to-index"><a href="/graduate/goods/index">前台首页</a></li>
        </ul>
        
    </div>--%>
<style>
</style>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">后台管理</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->

        <%--    <form class="navbar-form navbar-left ">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>--%>
        <%--    <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>--%>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav navbar-default">
      <div id="side-nav">
        <ul id="nav">
        	<li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/rest/user/users">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>顾客列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b4;</i>
                    <cite>标签管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/rest/smallType/AllSmallType">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>二级标签列表</cite>
                        </a>
                    </li>
                </ul>

                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/rest//bigtype/AllBigType">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>一级标签列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
        	<li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6e4;</i>
                    <cite>商品管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/rest/goods/allGoods">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>商品列表</cite>
                        </a>
                    </li>
                </ul>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/rest/evaluate/AllGoodsEvaluate">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>商品评价列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            
        	<li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe69e;</i>
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/rest/ord/AllOrd">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b4;</i>
                    <cite>地址管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/rest/address/Alladdress">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>地址列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b4;</i>
                    <cite>购物车</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/rest/shopcar/AllShopCar">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>购物车列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6eb;</i>
                    <cite>消息通知</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="/graduate/word/list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>消息列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
      </div>
    </div>
    <!-- 左侧菜单结束 -->
    <!-- 中部结束 -->
</body>
</html>