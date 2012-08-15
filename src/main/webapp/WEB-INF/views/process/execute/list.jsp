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
	<title>流程执行</title>
	
	<script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function() {
    	$('.btn_execute').button().click(function(){
    		var param=jQuery.parseJSON($(this).attr("param"));
    		$('<form/>',{action:'${ctx}/'+param.formKey+'/'+param.businessId,method:'get'})
    			.append($('<input/>',{type:'hidden',name:'processInstanceId',value:param.processInstanceId}))
    			.append($('<input/>',{type:'hidden',name:'taskId',value:param.taskId}))
				.appendTo($("body"))
			.submit();
    	});
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
			 	<th>流程id</th>
				<th>任务Id</th>
				<th>任务名称</th>
				 <th>表单</th> 
				 <th>业务id</th> 
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="processTask" items="${processTasks}" >
				<tr>
					 <td>${processTask.processInstance.id }</td>
					 <td>${processTask.task.id }</td>
					 <td>${processTask.task.name }</td>
					 <td>${processTask.formKey}</td> 
					 <td>${processTask.businessId}</td> 
					<td>
						<button class="btn_execute" param='{"processInstanceId":"${processTask.processInstance.id }","taskId":"${processTask.task.id }","formKey":"${processTask.formKey}","businessId":"${processTask.businessId}"}' >执行</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>