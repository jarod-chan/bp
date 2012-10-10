<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>请假</title>
	<%@ include file="/common/setting.jsp" %>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include.jsp" %>	
	<%@ include file="/common/plu-datepicker.jsp" %>	

    <script type="text/javascript">
    $(function() {
    	$("[name='begDayitem.date'],[name='endDayitem.date']").simpleDatepicker({x:0,y:18});
    	$("[name='description']").attr({"maxlength":"500"}).iemaxlength();

		$("#btn_back").click(function(){
			window.open('${ctx}/process/task','_self');
			return false;
		});
		$("#btn_commit").click(function(){
			var actionFrom=$("form");
			var oldAction=actionFrom.attr("action");
			actionFrom.attr("action",oldAction+"/commit").submit();
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
		请假 
	</div>
	
	<div style="" class="toolbg toolbgline toolheight nowrap">
		<div class="nowrap left">NO：${leave.no}		
		</div>
		<div class="right">
			<!--页码 -->&nbsp;
		</div>
	</div>
		
		
	<div class="submit_div" >

			
			<table>
				<tbody>
					<tr>
						<td colspan="2">
						请假时间：${leave.begDayitem.date}&nbsp;${leave.begDayitem.ampm.name}
									&nbsp;-&gt;&nbsp;
					    		 ${leave.endDayitem.date}&nbsp;${leave.endDayitem.ampm.name}
						</td>
					</tr>
					<tr>
						<td style="width: 300px;">
							请假类别：${leave.leaveType.name}
						</td>
						<td style="width: 300px;">
							请假天数：共${leave.natureDay}天，实际${leave.acturlDay}天
						</td>
					</tr>
					<tr>
						<td colspan="2">
							请假原因：<br>
							<textarea name="description" style="height: 180px;margin-top: 5px;">${leave.description}</textarea>
						</td>
					</tr>
					<tr>
						<td style="width: 300px;">
							请假人：${leave.user.realname}
						</td>
						<td style="width: 300px;">
							 申请时间：${leave.date}
						</td>
					</tr>
				</tbody>
			</table>
			
			<form action="${ctx}/hr/leave" method="post" >
				<input type="hidden" name="id" value="${leave.id}"/>
				<input type="hidden" name="no" value="${leave.no}"/>
			
			</form>
		</div>
	
		<div style="" class="toolbg toolbgline toolheight nowrap">
			<div class="nowrap left">	
				<input type="button" value="«&nbsp;返回" class="qm_btn wd1 nowrap btn_goback" id="btn_back" >
				<input type="button" class="btn_sepline">
				<input type="button" value="提交" class="qm_btn wd1" id="btn_commit">				
			</div>
			<div class="right">
				<!--页码 -->&nbsp;
			</div>
		</div>	
			
		
	</div>
</body>
</html>
