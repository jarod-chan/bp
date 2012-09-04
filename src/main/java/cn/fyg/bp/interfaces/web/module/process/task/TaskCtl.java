package cn.fyg.bp.interfaces.web.module.process.task;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.fyg.bp.interfaces.web.shared.session.SessionUtil;
import cn.fyg.module.user.User;

@Controller
@RequestMapping("process/task")
public class TaskCtl {
	
	private static final String PATH = "process/task/";
	private interface Page {
		String LIST = PATH + "list";
	}
	
	@Autowired
	TaskFacade taskFacade;
	@Autowired
	SessionUtil sessionUtil;
	
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String toList(Map<String,Object> map){
		User user = sessionUtil.getValue("user");
		List<ProcessTaskBean> processTasks = taskFacade.getProcessTasks("mou");//user.getUsername());
		map.put("processTasks", processTasks);
		return Page.LIST;
	}

}