<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/common/global.jsp"%>
	<script>
		var notLogon = ${empty user};
		if (notLogon) {
			location.href = '${ctx}/login?error=nologon';
		}
	</script>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-base-styles.jsp" %>
	<%@ include file="/common/include-jquery-ui-theme.jsp" %>
	<title>流程列表</title>
	
	<script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>
</head>
<body>
	<c:if test="${not empty message}">
		<div id="message" class="${message.level}">${message.message}</div>
	</c:if>
	<table width="100%" class="need-border">
		<thead>
			<tr>
				<th>id</th>
				<th>businessKey</th>
				<th>processDefinitionId</th>
				<th>startTime</th>
				<th>endTime</th>
				<th>durationInMillis</th>
				<th>endActivityId</th>
				<th>startUserId</th>
				<th>startActivityId</th>
				<th>deleteReason</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="itme" items="${history}">
				<tr>
					<td>${itme.id}</td>
					<td>${itme.businessKey}</td>
					<td>${itme.processDefinitionId}</td>
					<td>${itme.startTime}</td>
					<td>${itme.endTime}</td>
					<td>${itme.durationInMillis}</td>
					<td>${itme.endActivityId}</td>
					<td>${itme.startUserId}</td>
					<td>${itme.startActivityId}</td>
					<td>${itme.deleteReason}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>