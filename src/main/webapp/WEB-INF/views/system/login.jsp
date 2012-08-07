<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
<%@ include file="/common/head.jsp"%>
<style>
	/* .draggable { width: 500px; height: 200px; } #effect { width: 240px; height: 135px; padding: 0.4em; position: relative; }*/
	
	#effect { width: 240px;  padding: 0.4em; position: relative; }
	#effect h3 { margin: 0; padding: 2em; text-align: center; }
	button .ui-button-text{font-size: 70%; }
	.btn_div {text-align: center;margin-bottom: 5px;}
	
</style>
<script>
	$(function() {
		$('button').button();
		$( ".draggable" ).draggable();
		
		$( "#dialog-form" ).draggable();
	});
</script>
</head>
<body>
<center>
	<div class="draggable">
		<div id="effect" class="ui-widget-content ui-corner-all">
			<h3 class="ui-state-default ui-corner-all">方远房产流程系统</h3>
			<div >
				<label>用户：</label><input type="text" name="username"  value="${loginPage.username}"  style="width:150px;"/> 
			</div>
			<div>
				<label >密码：</label><input type="password" name="password" value=""   style="width:150px;"/>
			</div>
			<div>
			    错误信息
			</div>
			<div class="btn_div"> 
				<button class="ui-state-default ui-corner-all">登录系统</button>
				<button class="ui-state-default ui-corner-all">取回密码</button>
	 		 </div>
		</div>
	</div>
	
</center>
</body>
</html>