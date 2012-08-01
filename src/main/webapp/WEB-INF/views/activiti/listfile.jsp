<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<script type="text/javascript">
	function deploy(filename){
		 var form=$('<form/>',{action:'/${ctx}/activiti/file/'+filename+'/deploy',method:'post'});
		 form.appendTo($("body")).submit();
	}
</script>
</head>

<body>
<h2>流程文件列表</h2>
<%@ include file="../common/message.jsp"%>
<table border="1" class="tbldef">
<thead>
	<tr>
		<th>流程文件</th>
		<th>操作</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="item" items="${fileList}">
	<tr>
		<td>${item.filename}</td>
		<td>
			<input type="button" value="发布流程" onclick="deploy('${item.filename}')"/>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>
</body>
</html>
