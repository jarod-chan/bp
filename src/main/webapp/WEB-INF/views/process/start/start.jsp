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
    <script type="text/javascript">
    $(function() {
    	$('.btn_start').button().click(function(){
    		var param=jQuery.parseJSON($(this).attr("param"));
    		if(param.isStartform){
        		$('<form/>',{action:'${ctx}/'+param.formKey,method:'get'})
	    			.append($('<input/>',{type:'hidden',name:'processDefinitionKey',value:param.key}))
					.appendTo($("body"))
				.submit();
    		}else{
    			$('<form/>',{action:'${ctx}/process/start/'+param.key,method:'post'})
     		 	.appendTo($("body"))
     		 	.submit();
    		}
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
				<th>流程名称</th>
				<th>版本号</th>
				<th>KEY</th>
				<th>流程图</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${processDefinitionBeans}" var="bean">
				<tr>
					<td>${bean.processDefinition.name }</td>
					<td>${bean.processDefinition.version }</td>
					<td>${bean.processDefinition.key }</td>
					<%-- <td>${bean.formKey}</td> --%>
					<%-- <td>${bean.isStartform}</td> --%>
					<td><a target="_blank" href='${ctx }/workflow/manage/${bean.processDefinition.deploymentId}/resource?resourceName=${bean.processDefinition.diagramResourceName }'>${bean.processDefinition.diagramResourceName }</a></td>
					<td>
						<button class="btn_start" param='{"key":"${bean.processDefinition.key}","formKey":"${bean.formKey}","isStartform":${bean.isStartform}}' >启动</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>