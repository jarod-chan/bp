<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<script type="text/javascript">

</script>
</head>

<body>
<h2>流程执行历史</h2>
<%@ include file="../common/message.jsp"%>
<table border="1" class="tbldef">
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
