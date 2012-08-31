<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<title>QUI </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />
 	
 	<link href="quir/frame.css" type="text/css"  rel="stylesheet">
 	
</head>

<body class="frame_class">

  	<div id="topDataTd" class="getuserdata">
		<div class="topdata">
	 		<div id="logotips" class="lgoo">
				<a hidefocus="" target="mainFrame" href="/cgi-bin/today?sid=gV6WdgPHULGMAg9f&amp;error=index&amp;loc=frame_html,,,1" style="width:215px; height:60px;" class="imglogo pointer skinlogo">
					<img height="60" src="quir/logo_0_00aa5cc.gif" id="imglogo" stylenum="0" logotitle="" e="imglogo" t="3" title="邮箱首页">
				</a>
				<div class="switch">
					<div class="left" style="margin-top:1px;">
						<b id="useralias">用户姓名</b><span class="pointer" id="useraddrcontainer">&lt;<span title="关联其他QQ邮箱" id="useraddr">账号</span>&gt;</span>
						<br>
						<span class="addrtitle">
							<a target="mainFrame" href="/cgi-bin/today?sid=gV6WdgPHULGMAg9f&amp;loc=frame_html,,,2">邮箱首页</a>&nbsp;|&nbsp;<a id="frame_html_setting" target="mainFrame" href="/cgi-bin/setting1?sid=gV6WdgPHULGMAg9f&amp;fun=list&amp;loc=frame_html,,,3">设置</a>&nbsp;-&nbsp;<a target="mainFrame" href="/cgi-bin/setting5?sid=gV6WdgPHULGMAg9f&amp;fun=list&amp;loc=frame_html,,,4" id="changeSkin">换肤</a>
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
				<!-- <li class="checkpart fs">
					<a onclick="recordReadedMailId(null);goUrlMainFrm('/cgi-bin/mail_list?sid=R5gAYBV32TgFFBlJ&amp;folderid=1&amp;page=0&amp;s=getmail&amp;today_tips=400&amp;loc=frame_html,,,22',true);switchFolder('folder_1');" hidefocus="" target="actionFrame" id="readmailbtn_link" href="javascript:;" initlized="true" md="0">任务中心</a>
					<input type="button" disabled="" class="checkbtn">
				</li>
				<li id="composebtn_td" class="composepart fs">
					<a target="mainFrame" href="/cgi-bin/readtemplate?sid=R5gAYBV32TgFFBlJ&amp;t=compose&amp;s=cnew&amp;loc=frame_html,,,21" hidefocus="" id="composebtn" initlized="true" md="0">发起流程</a>
					<input type="button" disabled="" class="composebtn">
				</li>
				<li class="addrpart fs">
					<a target="mainFrame" href="/cgi-bin/addr_listall?sid=R5gAYBV32TgFFBlJ&amp;sorttype=null&amp;category=all&amp;loc=frame_html,,,23" hidefocus="" initlized="true" md="0">流程跟踪</a>
					<input type="button" disabled="" class="addrbtn">
				</li> -->
			</ul>
		</div>
	
		<div id="navMidBar"  class="listbg listflow" >
	
			<div class="folderDiv" id="folder" style="overflow: hidden;">
				<div>
					<div>
						<div id="OutFolder">
							<div id="SysFolderList">
								<ul class="fdul">
									<li style="" class="fs" dr="1" id="folder_1_td">
										<a hidefocus="" title="" class="f_size" target="mainFrame"
										href="/cgi-bin/mail_list?sid=ZbpDu87BKMn2UVwM&amp;folderid=1&amp;page=0&amp;s=inbox&amp;loc=folderlist,,,1"
										onclick="switchFolder(this.id);" id="folder_1">功能菜单</a>
									</li>
									<li dr="starred" class="fs" id="folder_starred_td">
										<a hidefocus="" title="" class="f_size staradjust"
										target="mainFrame"
										href="/cgi-bin/mail_list?sid=ZbpDu87BKMn2UVwM&amp;s=star&amp;folderid=all&amp;flag=star&amp;page=0&amp;need_folderlock=0&amp;fun=slock&amp;loc=folderlist,,,110&amp;topmails=0"
										onclick="switchFolder(this.id);" id="folder_starred">功能菜单
										</a>
									</li>
									<li style="" class="fn" dr="8" id="folder_8_td">
										<a
										hidefocus="" title="" class="f_size" target="mainFrame"
										href="/cgi-bin/mail_list?sid=ZbpDu87BKMn2UVwM&amp;folderid=8&amp;page=0&amp;t=mail_list_group&amp;loc=folderlist,,,8"
										onclick="switchFolder(this.id);" id="folder_8">功能菜单</a>
									</li>
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
		<iframe id="mainFrame" scrolling="auto" frameborder="no" hidefocus="" name="mainFrame" src="" onload="">
		</iframe>
	</div>


	
 </body>
</html>
