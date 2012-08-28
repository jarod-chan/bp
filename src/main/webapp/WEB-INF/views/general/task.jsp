<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/common/global.jsp"%>
    
    <title>流程任务</title>
    <%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-base-styles.jsp" %>
	<%@ include file="/common/include-jquery-ui-theme.jsp" %>
	
	
	<script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>

    <script type="text/javascript">
    $(function() {
    	
		$("button").button();
		
		$("#btn_complete").click(function(){
			var actionFrom=$("form");
			var oldAction=actionFrom.attr("action");
			actionFrom.attr("action",oldAction+"/complete").submit();
		});
		$("#btn_back").click(function(){
			window.open('${ctx}/process/execute','_self');
			return false;
		});
    });
    </script>
</head>

<body>
	<div class="container">
	<c:if test="${not empty message}">
		<div id="message" class="${message.level}">${message.message}</div>
	</c:if>
		<form action="${ctx}/general" method="post">
		<input type="hidden" name="taskId" value="${task.id}"/>
		<fieldset>
			<legend>任务信息</legend>
			<table border="1">
			<tr>
				<td>任务名称：</td>
				<td>
					${task.name}
				</td>
			</tr>
			<tr>
				<td>任务内容：</td>
				<td>
					${task.description}
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<button id="btn_complete">完成</button>
					<button id="btn_back">返回</button>
				</td>
			</tr>
		</table>
		</fieldset>
		</form>
	</div>
</body>
</html>
