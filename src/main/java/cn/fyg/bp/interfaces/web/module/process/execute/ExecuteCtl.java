package cn.fyg.bp.interfaces.web.module.process.execute;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.fyg.bp.interfaces.web.shared.session.SessionUtil;
import cn.fyg.module.user.User;

@Controller
@RequestMapping("/process/execute")
public class ExecuteCtl {
	
	public static final Logger logger=LoggerFactory.getLogger(ExecuteCtl.class);
	
	private static final String PATH = "process/execute/";
	private interface Page {
		String LIST = PATH + "list";
	}
	
	@Autowired
	ExecuteFacade executeFacade;
	@Autowired
	SessionUtil sessionUtil;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String toList(Map<String,Object> map){
		User user = sessionUtil.getValue("user");
		List<ProcessTaskBean> processTasks = executeFacade.getProcessTasks(user.getUsername());
		map.put("processTasks", processTasks);
		return Page.LIST;
	}
}
