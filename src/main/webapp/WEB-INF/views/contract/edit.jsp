<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<title>QUI </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />
 	
 	<link href="${ctx}/quir/frame.css" type="text/css"  rel="stylesheet">
 	<link href="${ctx}/quir/extend.css" type="text/css"  rel="stylesheet">
 	<!-- 暂时引入jquery -->
 	<script src="/bp/js/common/jquery.js" type="text/javascript"></script>

    <script type="text/javascript">
    $(function() {
		$("#btn_save").click(function(){
			var actionFrom=$("form");
			var oldAction=actionFrom.attr("action");
			actionFrom.attr("action",oldAction+"/save").submit();
		});
		$("#btn_commit").click(function(){
			var actionFrom=$("form");
			var oldAction=actionFrom.attr("action");
			actionFrom.attr("action",oldAction+"/commit").submit();
		});
		$("#btn_back").click(function(){
			window.open('${ctx}/process/task','_self');
			return false;
		});
    });
    </script>
</head>

<body class="frame_class">
	<div class="container">
	<c:if test="${not empty message}">
		<div id="message" class="${message.level}">${message.message}</div>
	</c:if>
	
	<div class="txt_title">
		合同编辑
	</div>
	
	<div style="" class="toolbg toolbgline toolheight nowrap">
		<div class="nowrap left">			
		</div>
		<div class="right">
			<!--页码 -->&nbsp;
		</div>
	</div>
		<form action="${ctx}/contract" method="post">
		<input type="hidden" name="id" value="${contract.id}"/>
		<input type="hidden" name="taskId" value="${taskId}"/>
		
		<div style="margin:10px 10px; ">
			项目名称：
			<br>
			<input type="text" name="projectName" value="${contract.projectName}"/>
			<br>
			合同内容：
			<br>
			<textarea name="context" style="height: 200px;">${contract.context}</textarea>
		</div>
	
		<div style="" class="toolbg toolbgline toolheight nowrap">
			<div class="nowrap left">	
				<input type="button" value="«&nbsp;返回" class="qm_btn wd1 nowrap btn_goback" id="btn_back" >
				<input type="button" class="btn_sepline">
				<input type="button" value="保存" class="qm_btn wd1" id="btn_save">
				<input type="button" value="提交" class="qm_btn wd1" id="btn_commit">				
			</div>
			<div class="right">
				<!--页码 -->&nbsp;
			</div>
		</div>	
			
		</form>
	</div>
</body>
</html>
