<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<title>流程运行</title>
	<%@ include file="/common/setting.jsp" %>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include.jsp" %>	
	
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
	<div>
		<div class="txt_title">
			流程管理
		</div>
	
		<div style="" class="toolbg toolbgline toolheight nowrap">
			<div class="nowrap left">
			</div>
			<div class="right">
				<!--页码 -->&nbsp;
			</div>
		</div>
	
		<table  class="O2" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th class="noborder">流程Id</th>
					<th class="title">流程Id[]</th>
					<th class="title">流程定义ID</th>
					<th class="title">是否挂起</th>
					<th class="title">运行状态</th>
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
							<button class="btn_trace" param='{"filename":""}'>跟踪流程</button>
							<%-- <a class="trace" href='#' pid="${processInstance.id }" title="点击查看流程图"></a> --%>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div style="" class="toolbg toolbgline toolheight nowrap">
			<div class="nowrap left">
			</div>
			<div class="right">
				<!--页码 -->&nbsp;
			</div>
		</div>
	</div>	
</body>
</html>