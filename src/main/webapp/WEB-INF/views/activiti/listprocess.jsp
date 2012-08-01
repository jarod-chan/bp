<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<script type="text/javascript">
	function deleteProcess(deploymentId){
		 var form=$('<form/>',{action:'/${ctx}/activiti/process/'+deploymentId+'/delete',method:'post'})
		 	.appendTo($("body"))
		 	.submit();
	}
	
	function startProcess(processDefinitionId){
		 var form=$('<form/>',{action:'/${ctx}/activiti/process/'+processDefinitionId+'/start',method:'post'})
		 	.appendTo($("body"))
		 	.submit();
	}
</script>
</head>

<body>
<h2>流程文件列表</h2>
<%@ include file="../common/message.jsp"%>
<table border="1" class="tbldef">
<thead>
	<tr>
		<th>id</th>
		<th>key</th>
		<th>name</th>
		<th>resourceName</th>
		<th>version</th>
		<th>diagramResourceName</th>
		<th>category</th>
		<th>deploymentId</th>
		<th>操作</th>
	</tr>
</thead>
<tbody>
		<c:forEach var="process" items="${processes}">
			<tr>
				<td>${process.id}</td>
				<td>${process.key}</td>
				<td>${process.name}</td>
				<td>${process.resourceName}</td>
				<td>${process.version}</td>
				<td>${process.diagramResourceName}</td>
				<td>${process.category}</td>
				<td>${process.deploymentId}</td>
				<td>
					<input type="button" value="删除流程" onclick="deleteProcess('${process.deploymentId}')"/>
					<input type="button" value="运行流程" onclick="startProcess('${process.id}')"/>
				</td>
			</tr>
		</c:forEach>
</tbody>
</table>
</body>
</html>
