package cn.fyg.bp.interfaces.web.module.function.taskcenter;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.fyg.bp.interfaces.web.module.process.execute.ExecuteFacade;
import cn.fyg.bp.interfaces.web.module.process.execute.ProcessTaskBean;
import cn.fyg.bp.interfaces.web.shared.session.SessionUtil;
import cn.fyg.module.user.User;

@Controller
@RequestMapping("/taskcenter")
public class TaskCenter {
	
	private static final String PATH = "taskcenter/";
	private interface Page {
		String LIST = PATH + "list";
	}
	
	@Autowired
	ExecuteFacade executeFacade;
	@Autowired
	SessionUtil sessionUtil;
	
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String toList(Map<String,Object> map){
		User user = sessionUtil.getValue("user");
		List<ProcessTaskBean> processTasks = executeFacade.getProcessTasks("chen");//user.getUsername());
		map.put("processTasks", processTasks);
		return Page.LIST;
	}

}
