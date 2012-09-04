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
 	
 	<link href="quir/frame.css" type="text/css"  rel="stylesheet">
 	<!-- 暂时引入jquery -->
 	<script src="/bp/js/common/jquery.js" type="text/javascript"></script>
 	
</head>

<body class="frame_class">

  	<div id="topDataTd" class="getuserdata">
		<div class="topdata">
	 		<div id="logotips" class="lgoo">
				<a hidefocus="" target="mainFrame" href="#" style="width:215px; height:60px;" class="imglogo pointer skinlogo">
					<img height="60" src="quir/logo_0_00aa5cc.gif" id="imglogo" stylenum="0" logotitle="" e="imglogo" t="3" title="">
				</a>
				
				 <div class="switch" style="display: inline;">
					<div class="left" style="margin-top:1px;display:inline;">
						<b id="useralias">${user.realname }</b><span class="pointer" id="useraddrcontainer">&lt;<span title="系统账号" id="useraddr">${user.username}</span>&gt;</span>
						<br>
						<span class="addrtitle">
							<a target="mainFrame" href="frame/sub">个人首页</a>&nbsp;|&nbsp;<a href="/${ctx}">安全退出</a>
						</span>
					</div>
				</div>
			</div>  
		</div>
	</div>

	<div id="sepLineTd" class="topline_height"><div class="topline"><div id="imgLine" class="toplineimg left"></div></div></div>

	<div class="fdbody bodybgbt"></div>



	<div id="leftPanel" class="newskinbody">
	
		<div id="navBarDiv">
			<ul id="navBarTd" class="navbar fdul">
				<li id="composebtn_td" class="composepart fs">
					<a target="mainFrame" href="process/task" >任务中心</a>
					<input type="button" disabled="" class="checkbtn">
				</li>
				<li class="checkpart fs">
					<a target="mainFrame" href="process/start" >发起流程</a>
					<input type="button" disabled="" class="composebtn">
				</li>
				<li class="addrpart fs">
					<a target="mainFrame" href="frame/sub" >流程跟踪</a>
					<input type="button" disabled="" class="addrbtn">
				</li> 
			</ul>
		</div>
	
		<div id="navMidBar"  class="listbg listflow" >
	
			<div class="folderDiv" id="folder" style="overflow: hidden;">
				<div>
					<div>
						<div id="OutFolder">
							<div id="SysFolderList">
								<ul class="fdul">
									<li style="" class="fs" >
										<a class="f_size" target="mainFrame" href="frame/sub" >请假历史</a>
									</li>
								<!-- 	<li dr="starred" class="fs" id="folder_starred_td">
										<a hidefocus="" title="" class="f_size staradjust"
										target="mainFrame"
										href="/cgi-bin/mail_list?sid=ZbpDu87BKMn2UVwM&amp;s=star&amp;folderid=all&amp;flag=star&amp;page=0&amp;need_folderlock=0&amp;fun=slock&amp;loc=folderlist,,,110&amp;topmails=0"
										onclick="switchFolder(this.id);" id="folder_starred">功能菜单</a>
									</li>
									<li style="" class="fn" dr="8" id="folder_8_td">
										<a
										hidefocus="" title="" class="f_size" target="mainFrame"
										href="/cgi-bin/mail_list?sid=ZbpDu87BKMn2UVwM&amp;folderid=8&amp;page=0&amp;t=mail_list_group&amp;loc=folderlist,,,8"
										onclick="switchFolder(this.id);" id="folder_8">功能菜单</a>
									</li> -->
								</ul>
								<div class="sepline"></div>
							</div>
						
						</div>
					</div>
				</div>
			</div>
	
	
		</div>
		<div id="navBottomTd" class="navbottom"></div>
	
	</div>

	<div id="mainFrameContainer">
		<iframe id="mainFrame" scrolling="auto" frameborder="no" hidefocus="" name="mainFrame" src="taskcenter" onload="">
		</iframe>
	</div>


	
 </body>
</html>
