<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>任务中心</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />

<link href="quir/frame.css" type="text/css"  rel="stylesheet">
<link href="quir/extend.css" type="text/css"  rel="stylesheet">


</head>
<body id="list" class="tbody">

	<div id="taskcenter">
		<div class="txt_title">
			任务中心<span class="f_size normal black" id="_ut"> (共<span id="_ut_c"></span>个)</span>
		</div>
	
		<div style="" class="toolbg toolbgline toolheight nowrap">
			<div class="nowrap left">
				<!--
				<input type="button" onclick="getTop().delMailML( '1', false, null, document);" value="删除" class=" wd1 btn" id="quick_del" name="del">
				<input type="button" onclick="return getTop().checkPerDelML( '1', false, document)"	value="彻底删除" class="wd3 btn" id="quick_completelydel">
				<input type="button" onclick="return FwMailML();" value="转发" class="mail_forward wd1 btn">
				<input type="button" id="btn_reportSpam" onclick="getTop().reportSpamML(true,window)" value="举报" class="wd1 btn">
				<input type="button" onclick="getTop().setFolderReaded(&quot;1&quot;,&quot;&quot;,&quot;&quot;,&quot;1&quot;,&quot;&quot;);" value="全部标为已读" class="wd4 btn" id="setAllReaded">
				-->
			</div>
			<div class="right">
				<!--页码 -->&nbsp;
			</div>
		</div>

		<table class="O2" cellspacing="0" cellpadding="0" >
			<thead>
				<tr>
					<th class="noborder">流程id</th>
					<th class="title">任务Id</th>
					<th class="title">任务名称</th>
					<th class="title">表单</th>
					<th class="title">业务id</th>
					<th class="title">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="processTask" items="${processTasks}">
					<tr>
						<td>${processTask.processInstance.id }</td>
						<td>${processTask.task.id }</td>
						<td>${processTask.task.name }</td>
						<td>${processTask.formKey}</td>
						<td>${processTask.businessId}</td>
						<td>
							<button class="btn_execute"
								param='{"taskId":"${processTask.task.id }","formKey":"${processTask.formKey}","businessId":"${processTask.businessId}"}'>执行</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="" class="toolbg toolbgline toolheight nowrap">
			<div class="right">
				<!--页码 -->&nbsp;
			</div>
		</div>
	</div>



</body>
</html>