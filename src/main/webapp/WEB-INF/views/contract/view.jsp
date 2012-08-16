<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/common/global.jsp"%>
    
    <title>流程列表</title>
    <%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-base-styles.jsp" %>
	<%@ include file="/common/include-jquery-ui-theme.jsp" %>
	
	
	<script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>

    <script type="text/javascript">
    $(function() {
    	
		$("button").button();
		$("#btn_pass").click(function(){
			var actionFrom=$("form");
			$("input[name=leaderPass]").val("true");
			var oldAction=actionFrom.attr("action");
			actionFrom.attr("action",oldAction+"/check").submit();
		});
		$("#btn_nopass").click(function(){
			var actionFrom=$("form");
			$("input[name=leaderPass]").val("false");
			var oldAction=actionFrom.attr("action");
			actionFrom.attr("action",oldAction+"/check").submit();
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
		<form action="${ctx}/contract" method="post">
		<input type="hidden" name="id" value="${contract.id}"/>
		<input type="hidden" name="processInstanceId" value="${processInstanceId}"/>
		<input type="hidden" name="taskId" value="${taskId}"/>
		<input type="hidden" name="leaderPass"  value=""/>
		<fieldset>
			<legend>合同办理</legend>
			<table border="1">
			<tr>
				<td>项目名称：</td>
				<td>
				${contract.projectName}
				</td>
			</tr>
			<tr>
				<td>合同内容：</td>
				<td>
					<textarea name="context">${contract.context}</textarea>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<button id="btn_pass">通过</button>
					<button id="btn_nopass">打回</button>
					<button id="btn_back">返回</button>
				</td>
			</tr>
		</table>
		</fieldset>
		</form>
	</div>
</body>
</html>
