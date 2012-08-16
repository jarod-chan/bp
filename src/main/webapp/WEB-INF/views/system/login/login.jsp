<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/common/global.jsp"%>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-jquery-ui-theme.jsp" %>
    <%@ include file="/common/include-base-styles.jsp" %>   
    <script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
    <script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>
    <style>
    	#draggable { top:150px; width: 400px;  padding: 0.4em; position: relative; }
    	#draggable h3 { margin: 0; padding: 0.5em; text-align: center; }
    	button {width: 100px;}
    </style>
    <script type="text/javascript">
		$(function() {
			$('button').button();
			$('#draggable').draggable();
			$('#fetchpassword').click(function(){
				return false;
			});
			setTimeout(function(){$("#message").hide('highlight',1000);},2000);
		});
	</script>
</head>

<body>
	<center>
	<div id="draggable" class="ui-widget-content ui-corner-all" >
		<h3 class="ui-state-default ui-corner-all">方远房产流程系统</h3>
		<form action="${ctx}/login" method="post">
			<div>
				<div class="context">
					<span style="vertical-align: middle">用户：</span><input type="text" name="username"  value="${loginBean.username}chen"  style="width:150px;"/> 
				</div>
				<div class="context">
					<span style="vertical-align: middle">密码：</span><input type="password" name="password" value="1"   style="width:150px;"/>
				</div>
				<div class="context"  style="height: 20px;padding: 5px 0px; ">
				<c:if test="${not empty message}" >
					<div id="message" class="ui-state-error ui-corner-all" style="width: 200px;">
						<p><span class="ui-icon ui-icon-alert" style=" float: left;margin-right:.3em;"></span><span style="float: left;">${message}</span></p>
					</div>
				</c:if>
				</div>
				<div class="context" style="height: 35px;">
						<button type="submit" id="login" class="ui-state-default ui-corner-all" >登录系统</button>
					    <button type="button" id="fetchpassword" class="ui-state-default ui-corner-all" >取回密码</button>
				</div>
			</div>
		</form>
	</div>
	</center>
</body>
</html>
