<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/common/global.jsp"%>
	<title>方远房产流程系统</title>
	<script>
		var notLogon = ${empty user};
		if (notLogon) {
			location.href = '${ctx}/login?error=nologon';
		}
	</script>
	<%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/include-base-styles.jsp" %>
	<%@ include file="/common/include-jquery-ui-theme.jsp" %>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/menu.css" />
    <%@ include file="/common/include-custom-styles.jsp" %>
	<link href="${ctx }/css/main.css" type="text/css" rel="stylesheet"/>
	<style type="text/css">
	.ui-tabs-panel {height: 100%; width: 100%;}
	.ui-tabs .ui-tabs-nav li a {padding-right: .5em;}
	#tabs li .ui-icon-close { float: left; margin: 0.5em 0.2em 0 0; cursor: pointer; }
	#add_tab { cursor: pointer; }
	</style>
    
    <script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/extends/themeswitcher/jquery.ui.switcher.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/tools/jquery.cookie.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/plugins/jui/extends/layout/jquery.layout.min.js" type="text/javascript"></script>
	<script src='${ctx }/js/common/common.js' type="text/javascript"></script>
    <script src='${ctx }/js/module/main/main-frame.js' type="text/javascript"></script>
</head>
<body>
<!-- #TopPane -->
<div id="topPane" class="ui-layout-north ui-widget ui-widget-header ui-widget-content">
	<div style="padding-left:5px; font-size: 16px; margin-top: 1px;">
       	<table id="topTable" style="padding: 0px;margin: 0px;margin-top: -5px;padding-top: 8px;" width="100%">
       		<tr>
       			<td>
       				<span style="font-size: 30px;color:#FFFF33;padding-top: 10px;">方远房产流程系统</span>
       			</td>
       			<td>
       				<div style="float:right; color: #fff;font-size: 12px;margin-top: 2px">
		        		<div>
		        			<label for="username">欢迎：</label>
		        			<span title="角色：${groupNames }">${user.realname }/${user.username }</span>
		        		</div>
		        		<div style="text-align: right;">
		        			<a id="chang-theme" href="#">切换风格</a>
		       				<a href="#" id="loginOut">安全退出</a>
		        		</div>
		        	</div>
       			</td>
       		</tr>
       	</table>
       </div>
</div>

<!-- RightPane -->
<div id="centerPane" class="ui-layout-center ui-helper-reset ui-widget-content">
	<div id="tabs">
		<ul><li><a class="tabs-title" href="#tab-index">首页</a><span class='ui-icon ui-icon-close' title='关闭标签页'></span></li></ul>
		<div id="tab-index">
			<iframe id="mainIframe" name="mainIframe" src="first" class="module-iframe" scrolling="auto" frameborder="0" style="width:100%;height:100%;"></iframe>
		</div>
	</div>
</div>

<!-- #BottomPane -->
<div id="bottomPane" class="ui-layout-south ui-widget ui-widget-content">
	<div class="footer ui-state-default">
				&nbsp;
	</div>
</div>
<%@ include file="menu.jsp" %>
<div id="themeswitcherDialog"><div id="themeSwitcher"></div></div>
</body>
</html>