package cn.fyg.bp.interfaces.web.module.hr.leave;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.fyg.bp.application.CompdateService;
import cn.fyg.bp.application.LeaveService;
import cn.fyg.bp.domain.model.vacation.common.AMPM;
import cn.fyg.bp.domain.model.vacation.common.LeaveType;
import cn.fyg.bp.domain.model.vacation.compdate.DayResult;
import cn.fyg.bp.domain.model.vacation.leave.Leave;
import cn.fyg.bp.interfaces.web.shared.message.Message;
import cn.fyg.bp.interfaces.web.shared.mvc.CustomEditorFactory;
import cn.fyg.bp.interfaces.web.shared.session.SessionUtil;
import cn.fyg.bp.interfaces.web.shared.tool.Constant;
import cn.fyg.module.user.User;

@Controller
@RequestMapping("hr/leave")
public class LeaveCtl {
	
	private static final String PATH = "hr/leave/";
	private interface Page {
		String EDIT = PATH + "edit";
		String CHECK =PATH + "check";
	}
	
	@Autowired
	LeaveService leaveService;
	@Autowired
	CompdateService compdateService;
	@Autowired
	SessionUtil sessionUtil;
	

	@RequestMapping(value="start",method=RequestMethod.GET)
	public String toStart(Map<String,Object> map){
		User user=sessionUtil.getValue("user");
		Leave leave = leaveService.create(user);
		map.put("leave", leave);
		map.put("leaveTypes", LeaveType.values());
		map.put("ampms", AMPM.values());
		return Page.EDIT;
	}
	
	@RequestMapping(value="start/commit",method=RequestMethod.POST)
	public String startCommit(HttpServletRequest request,RedirectAttributes redirectAttributes){
		User user=sessionUtil.getValue("user");
		Leave leave = leaveService.create(user);
		ServletRequestDataBinder binder = new ServletRequestDataBinder(leave);
        binder.registerCustomEditor(Date.class,CustomEditorFactory.getCustomDateEditor());
		binder.bind(request);
		DayResult dayResult = compdateService.computerDay(leave.getBegDayitem(), leave.getEndDayitem());
		leave.setNatureDay(dayResult.natureDay());
		leave.setActurlDay(dayResult.acturlDay());
		leaveService.save(leave);
		redirectAttributes
			.addFlashAttribute(Constant.MESSAGE_NAME, Message.create().info().message("请假成功！"));
		return "redirect:/process/start";
	}
	
	@RequestMapping(value="check/{businessId}",method=RequestMethod.GET)
	public String toCheck(@PathVariable(value="businessId")Long businessId,Map<String,Object> map){
		Leave leave = leaveService.find(businessId);
		map.put("leave", leave);
		map.put("leaveTypes", LeaveType.values());
		map.put("ampms", AMPM.values());
		return Page.CHECK;
	}

}
