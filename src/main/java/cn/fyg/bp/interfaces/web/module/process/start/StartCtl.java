package cn.fyg.bp.interfaces.web.module.process.start;

import java.util.List;
import java.util.Map;

import org.activiti.engine.ActivitiException;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.ProcessDefinition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.fyg.bp.interfaces.web.shared.message.Message;
import cn.fyg.bp.interfaces.web.shared.session.SessionUtil;
import cn.fyg.bp.interfaces.web.shared.tool.Constant;
import cn.fyg.module.user.User;

@Controller
@RequestMapping("/process/start")
public class StartCtl {
	
	public static final Logger logger=LoggerFactory.getLogger(StartCtl.class);
	
	private static final String PATH = "process/start/";
	private interface Page {
		String LIST = PATH + "list";
	}
	
	@Autowired
	RepositoryService repositoryService;
	@Autowired
	RuntimeService runtimeService;
	@Autowired
	IdentityService identityService;
	@Autowired
	SessionUtil sessionUtil;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String toList(Map<String,Object> map){
		List<ProcessDefinition> processDefinitions = repositoryService.createProcessDefinitionQuery().latestVersion().list();
		map.put("processDefinitions", processDefinitions);
		return Page.LIST;
	}
	
	@RequestMapping(value = "{key}", method = RequestMethod.POST)
	public String start(@PathVariable("key")String key,RedirectAttributes redirectAttributes){
		try {			
			User user=sessionUtil.getValue("user");
			identityService.setAuthenticatedUserId(user.getUsername());
			runtimeService.startProcessInstanceByKey(key);
		} catch (ActivitiException e) {
			logger.error("process start fail by key:[]", key);
			redirectAttributes.addFlashAttribute(Constant.MESSAGE_NAME, Message.create().Error().message("流程[%s]启动失败！",key));
			return "redirect:/process/start";
		}
		redirectAttributes.addFlashAttribute(Constant.MESSAGE_NAME, Message.create().info().message("流程[%s]启动。",key));
		return "redirect:/process/start";
	}
	
}
