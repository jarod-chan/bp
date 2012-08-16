<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul id="css3menu">
	<li class="topfirst"><a rel="first">首页</a></li>
	<c:if test="${!isAdmin||nofilter}">
	<li>
		<a rel="#">工作台</a>
		<ul>
			<li><a rel='process/execute'>任务执行</a></li>
			<li><a rel='process/start'>启动流程</a></li>
		</ul>
	</li>
	</c:if>
	
	<c:if test="${isAdmin||nofilter}">
	<li>
		<a rel="#">工作流</a>
		<ul>
			<li><a rel='workflow/deploy'>流程部署</a></li>
			<li><a rel='workflow/manage'>流程管理</a></li>
			<li><a rel='workflow/history'>流程历史</a></li>
		</ul>
	</li>
	</c:if>
</ul>