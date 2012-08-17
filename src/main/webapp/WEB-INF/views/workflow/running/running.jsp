<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/common/global.jsp"%>
	<title>流程实例</title>
	<%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/include-base-styles.jsp" %>
    <%@ include file="/common/include-jquery-ui-theme.jsp" %>
    <link href="${ctx }/js/common/plugins/jui/extends/timepicker/jquery-ui-timepicker-addon.css" type="text/css" rel="stylesheet" />
    <link href="${ctx }/js/common/plugins/qtip/jquery.qtip.min.css" type="text/css" rel="stylesheet" />
    <%@ include file="/common/include-custom-styles.jsp" %>
    
    <script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/extends/timepicker/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/plugins/jui/extends/i18n/jquery-ui-date_time-picker-zh-CN.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/plugins/qtip/jquery.qtip.pack.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/plugins/html/jquery.outerhtml.js" type="text/javascript"></script>
	<script src="${ctx }/js/module/activiti/workflow.js" type="text/javascript"></script>
	
    <script type="text/javascript">
	    $(function() {
	    	$('.trace').button().click(graphTrace);
	    });
    </script>
</head>
<body>
	<c:if test="${not empty message}">
		<div id="message" class="${message.level}">${message.message}</div>
	</c:if>
	<table width="100%" class="need-border">
		<thead>
			<tr>
				<th>流程Id</th>
				<th>流程Id[]</th>
				<th>流程定义ID</th>
				<th>是否挂起</th>
				<th>运行状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${processInstances}" var="processInstance">
				<tr>
					<td>${processInstance.id }</td>
					<td>${processInstance.processInstanceId }</td>
					<td>${processInstance.processDefinitionId }</td>
					<td>${processInstance.suspended }</td>
					<td>
						<a class="trace" href='#' pid="${processInstance.id }" title="点击查看流程图">跟踪流程</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>