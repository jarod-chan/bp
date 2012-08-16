package cn.fyg.bp.interfaces.web.module.contract;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.fyg.bp.application.ContractService;
import cn.fyg.bp.domain.model.contract.Contract;
import cn.fyg.bp.domain.model.contract.ContractFactory;
import cn.fyg.bp.interfaces.web.shared.message.Message;
import cn.fyg.bp.interfaces.web.shared.tool.Constant;

@Controller
@RequestMapping("/contract")
public class ContractCtl {
	
	private static final String PATH = "contract/";
	private interface Page {
		String EDIT = PATH + "edit";
		String VIEW = PATH + "view";
	}
	
	@Autowired
	ContractService contractService;
	@Autowired
	RuntimeService runtimeService;
	@Autowired
	TaskService taskService;
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String toNew(Map<String,Object> map,@RequestParam(value="taskId",required=false)String taskId){
		Contract contract = ContractFactory.create();
		map.put("contract", contract);
		map.put("taskId", taskId);
		return Page.EDIT;
	}
	
	@RequestMapping(value="{businessId}",method=RequestMethod.GET)
	public String toEdit(@PathVariable(value="businessId")Long businessId,Map<String,Object> map,@RequestParam(value="taskId",required=false)String taskId){
		Contract contract = contractService.find(businessId);
		map.put("contract", contract);
		map.put("taskId", taskId);
		return Page.EDIT;
	}
	
	@RequestMapping(value="save",method=RequestMethod.POST)
	public String save(Contract contract,RedirectAttributes redirectAttributes,@RequestParam(value="taskId",required=false)String taskId){
		contract = contractService.save(contract);
		taskService.setVariable(taskId, "businessId", contract.getId());
		redirectAttributes
			.addAttribute("businessId", contract.getId())
			.addAttribute("taskId", taskId)
			.addFlashAttribute(Constant.MESSAGE_NAME, Message.create().info().message("合同保存成功！"));
		return "redirect:/contract/{businessId}?taskId={taskId}";
	}
	
	@RequestMapping(value="commit",method=RequestMethod.POST)
	public String commit(Contract contract,RedirectAttributes redirectAttributes,@RequestParam(value="taskId",required=false)String taskId){
		contract = contractService.save(contract);
		Map<String, Object> variableMap = new HashMap<String, Object>();
		variableMap.put("businessId", contract.getId());
		taskService.complete(taskId, variableMap);
		redirectAttributes.addFlashAttribute(Constant.MESSAGE_NAME, Message.create().info().message("合同提交成功！"));
		return "redirect:/process/execute";
	}
	
	
	@RequestMapping(value="view/{businessId}",method=RequestMethod.GET)
	public String toView(@PathVariable(value="businessId")Long businessId,Map<String,Object> map,@RequestParam(value="taskId",required=false)String taskId){
		Contract contract = contractService.find(businessId);
		map.put("contract", contract);
		map.put("taskId", taskId);
		return Page.VIEW;
	}
	
	@RequestMapping(value="check",method=RequestMethod.POST)
	public String check(@RequestParam("leaderPass")Boolean leaderPass,RedirectAttributes redirectAttributes,@RequestParam(value="taskId",required=false)String taskId){
		Map<String, Object> variableMap = new HashMap<String, Object>();
		variableMap.put("leaderPass", leaderPass);
		taskService.complete(taskId, variableMap);
		redirectAttributes.addFlashAttribute(Constant.MESSAGE_NAME, Message.create().info().message("合同已处理！"));
		return "redirect:/process/execute";
	}
	
}
