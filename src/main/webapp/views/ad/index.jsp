<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="min-width:1024px;overflow-x:auto;">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>管理后台</title>
<!-- jquery　ＪＳ -->
<script type="text/javascript"
	src="<%=path%>/script/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/script/jquery.serializejson.min.js"></script>
<!-- easyUi -->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/plugin/easyui/default.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/plugin/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/plugin/easyui/themes/default/easyui.css" />
<script type='text/javascript' src='<%=path%>/plugin/easyui/brow.js'></script>
<script type="text/javascript"
	src="<%=path%>/plugin/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/plugin/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- 自动主题样式 -->
<style type="text/css" id="LAY_layadmin_theme"></style>
<!-- layui CSS -->
<link rel="stylesheet" href="<%=path%>/plugin/layui/css/layui.css?t=2"
	media="all">
<script type="text/javascript"
	src="<%=path%>/plugin/layui/layui.js?t=2"></script>
<!-- 自定义主框架ＪＳ及css -->
<link rel="stylesheet" href="<%=path%>/style/index.css?t=2" media="all">
<!-- 自定义系统样式css -->
<script src="<%=path%>/script/frame_index.js"></script>
<script type="text/javascript" src="<%=path%>/script/common.js?t=2"></script>
<!-- js工具类 -->
<script type="text/javascript" src="<%=path%>/script/utils.js"></script>
<!--jq滚动条插件nicescroll  -->
<script type="text/javascript"
	src="<%=path%>/script/jquery.nicescroll.min.js"></script>

<%--  自定义图标	--%>
	<script type="text/javascript"
			src="<%=path%>/style/user_icon/iconfont.js"></script>
	<link rel="stylesheet" href="<%=path%>/style/user_icon/iconfont.css?t=2" media="all">
	<link rel="stylesheet" href="<%=path%>/style/user_icon/user_icon.css?t=2" media="all">
<style>
html, body {
	height: 100%;
	padding: 0px;
	margin: 0px;
	-ms-overflow-style: none;
}

.layui-layout-middle {
	height: 100%;
	width: 50%;
	overflow-y: hidden;
	overflow-x: auto;
	white-space: nowrap;
	preservenativescrolling: true;
	horizrailenabled: true;
}

.layui-layout-right {
	height: 100%;
	overflow-y: hidden;
	overflow-x: auto;
	white-space: nowrap;
	cursorwidth: 12px;
	preservenativescrolling: true;
	horizrailenabled: true,;
}
/* 右上图标的间隙调整  */
#scroll>a {
	margin: 0 5px;
}
#tbProjectMarginRemindDialog table{
	border-collapse: collapse;
	margin: 10px 30px;
	white-space: nowrap;
}
#tbProjectMarginRemindDialog th,td{
	border: 1px  solid #ccc;
	padding:  5px;
	text-align: center;
}
#tbProjectMarginRemindDialog a{
	color: blue;
}
</style>
</head>
<body class="easyui-layout"
	style="background: #fff; min-width: 100%; overflow-x: auto;min-width:1336px;" fit="true"
	id="index-body">
	<!-- 头部区域 -->
	<div region="north" split="true" style="height: 60px; border: 0;">

		<div class="layui-header">
			<div id="app-logo">
				<h2>
					<i class="layui-icon icon-logo"></i> <font
						style="font-size: 16px; font-weight: bold; color: #FFF;">大管理后台</font>
				</h2>
				<div class="layuiu-lago"></div>
			</div>
			<i class="layui-icon setting"></i>
			<div class="layui-nav" style="min-width: 60%;">
				<ul class="layui-layout-middle" lay-filter="layadmin-layout-middle" lay-separator="|" id="topmenu">

				</ul>
			</div>
			<div id="nice" class="layui-layout-right">
				<div id="scroll" class="right-nav" style="min-width: 35%;min-width:670px;">

					|<a href="javascript:void(0);" class="easyui-menubutton"
						data-options="menu:'#userMenu',plain:true,iconCls:'icon-user'">${userInfo.u_name }</a>

					|<a href="<%=path%>/loginout.action" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-exit'">退出</a>|
				</div>
			</div>
		</div>
	</div>
	<!-- 左侧导航 -->
	<div region="west" split="true" style="width: 220px;" id="west">
		<div id="nav">
			<!--  导航内容 -->
			<div id="nav" class="accordion accordion-noborder easyui-fluid" style="width: 213px; height: 345px;">
				<div class="panel panel-htop" style="width: 214px;">
					<div class="panel-header panel-header-noborder accordion-header accordion-header-border" style="width: 191px; height: 16px;">
						<div class="panel-title panel-with-icon">申请及审批</div>
						<div class="panel-icon icon"></div>
						<div class="panel-tool">
							<a href="javascript:;" class="panel-tool-collapse panel-tool-expand" style="display: none;"></a>
							<a href="javascript:;" class="accordion-collapse accordion-expand"></a>
						</div>
					</div>
					<div title="" class="panel-body panel-body-noborder accordion-body" style="display: none; width: 214px; height: 160px;">
						<ul class="navlist">
							<li><div><a rel="workflow/create_index.action?navId=783112132a4c4fa7946b906d0c87d76a">
							<span class="icon ">&nbsp;</span><span class="nav">新建申请</span></a></div>
							</li>
							<li>
								<div class="selected"><a rel="workflow/myApplyIndex.action?navId=b5d2c933e22c45458736ef3efad504cc">
									<span class="icon ">&nbsp;</span><span class="nav">我的申请</span></a>
								</div>
							</li>
							<li>
								<div class=""><a rel="workflow/waitingApplyIndex.action?navId=83b31b09a0944248ae82f30cdc8fc036">
									<span class="icon ">&nbsp;</span><span class="nav">待我审批</span></a>
								</div>
							</li>
							<li>
								<div class=""><a rel="workflow/applyHisIndex.action?navId=8085fe41cea6463bbb7a1726791d25b2">
									<span class="icon ">&nbsp;</span><span class="nav">经我审批</span></a></div>
							</li>
						</ul>
					</div>
				</div>
		</div>
	</div>
	<!-- 右侧内容 -->
	<div id="mainPanle" region="center">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<!-- <div id="welcome" title="欢迎使用" style="padding:5px;overflow:auto;" data-options="iconCls:'icon-home'">
			</div>  -->
		</div>
	</div>
	<!-- 底部导航 -->
	<div region="south" split="true" style="height: 36px;">
		<div class="footer">
			版权所有©2020&nbsp;&nbsp;<a href="#">成都行行行科技有限公司</a>
		</div>
	</div>



	<!-- ================用于投标的保证金归还时间的提醒===================end -->

	<script type="text/javascript">
    $(document).ready( function() {
    	//console.log(253,'${tbProjectMarginReminds} ',$("#tbProjectMarginRemindDialog") );
        $("#nice").niceScroll({cursoropacitymin:0,cursorwidth:"-17px",autohidemode:true});
        $("#nice").getNiceScroll().hide();
        $("#topmenu").niceScroll({cursoropacitymin:0,cursorwidth:"-17px"});
        $("#topmenu").getNiceScroll().hide();


    });

    var host = window.document.location.host;
    var pathName = window.document.location.pathname;





    
	/**加载主界面*/
	function loadIndexMain(){
		var url = "<%=path%>/loadMain.action";
		 $('#tabs').tabs('add',{
			title:'欢迎使用',
			//content:createFrame(url),
			href:url,
			closable:false,
			icon:'icon-home',
	      	onLoadError:function(){ 
			    layer.msg('加载数据出错,请联系管理员！');
			}
		}); 
	}




	

		 
	/** 数据初始化  */
	$(function(){
	 	loadIndexMain();
	});
	
    </script>
</body>
</html>
