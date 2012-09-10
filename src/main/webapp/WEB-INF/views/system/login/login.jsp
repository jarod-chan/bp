<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>方远房产流程系统</title>
	<%@ include file="/common/setting.jsp" %>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/login.jsp" %>	 
    <style>





		.container {
			width: 310px;
			margin: 20px auto 0;
			min-height: 500px;
		}
		.login_container{
			margin-top: 200px;
		}
		
		.login_box {
			position: relative;
			z-index: 11;
			width: 305px;
			margin-right: 4px;
			padding: 20px;
			border: 1px solid #ACC3E4;
			background: #EDF5FF;
			-moz-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.15);
			-webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.15);
			border-radius: 5px;
			-webkit-border-radius: 5px;
		}
		
		.login_box h1 {
			color: #274571;
			font-size: 16px;
		}
		
		.login_box .login_box_msg {
			margin: 5px 0;
			color: red;
		}
		
		.login_box #msgContainer{
			height: 25px;
			line-height: 25px;
		}
		
		.login_box .context{
			color: #274571;
			font-size: 15px;
			margin-top: 10px;
		}
		
		.login_box div{
			text-align: center;
		}
		
		
		.login_box .txt {
			position: relative;
			width: 295px;
			height: 20px;
			line-height: 20px;
			padding: 0 4px;
			color: #494949;
			border: 1px solid #9DADC5;
			font-size: 15px;
			outline: none;
			border-radius: 3px;
			-webkit-border-radius: 3px;
			-webkit-transition: -webkit-box-shadow .1s linear;
			-moz-transition: box-shadow .1s linear;
		}
		
    </style>
    <script type="text/javascript">
		$(function() {
			

			$('#fetchpassword').click(function(){
				return false;
			});
			setTimeout(function(){$("#message").slideToggle(1000);},2000);
		});
	</script>
</head>

<body>

<%-- 	<div id="draggable" >
		<h3>方远房产流程系统</h3>
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
					<div id="message" style="width: 200px;">
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
	</div> --%>

	<div class="container">
		<div id="login" class="login_container">
			<div class="login_box">
				<form action="${ctx}/login" method="post">
					<div class="logo_title">
						<h1>方远房产业务流程系统</h1>
					</div>
					<div style="" class="login_box_msg" id="msgContainer"><c:if test="${not empty message}" ><div id="message">您还没有输入密码！</div></c:if></div>
					<div class="context">
						用户:<input type="text"     class="txt" name="username"  value="${loginBean.username}chen"  style="width:150px;"/> 
					</div>
					<div class="context">
						密码:<input type="password" class="txt" name="password" value="1"   style="width:150px;"/>
					</div>
					<div class="context" >
							<button type="submit" id="login"  >登录系统</button> <button type="button" id="fetchpassword" >取回密码</button>
						   
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
