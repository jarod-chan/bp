package cn.fyg.bp.interfaces.module.activiti;

import java.io.FileNotFoundException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.activiti.engine.HistoryService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.fyg.bp.infrastructure.message.imp.SessionMPR;
import cn.fyg.bp.interfaces.module.shared.tool.Constant;

@Controller
@RequestMapping("activiti")
public class ActivitiCtl {

	public static final Logger logger=LoggerFactory.getLogger(ActivitiCtl.class);
	
	@Resource
	ActivitiFacade activitiFacade;
	@Resource
	HistoryService historyService;
	
	
	@RequestMapping(value = "/file", method = RequestMethod.GET)
	public String toList(Map<String,Object> map,HttpSession session){
		logger.info("toList");
		List<FileBean> fileList = activitiFacade.getFileList();
		map.put("fileList", fileList);
		map.put(Constant.MESSAGE_NAME, new SessionMPR(session).getMessage());
		return "activiti/listfile";
	}
	
	@RequestMapping(value = "/file/{filename}/deploy", method = RequestMethod.POST)
	public String deploy(@PathVariable("filename") String filename,HttpSession session){
		logger.info("deploy");
		String message = "流程发布成功！";
		try {
			activitiFacade.deployFile(filename);
		} catch (FileNotFoundException e) {
			logger.error("文件不存在",e);
			message="流程发布失败！";
		}catch(Exception e){
			logger.error("",e);
			message="流程发布失败！";
		}
		new SessionMPR(session).setMessage(message);
		return "redirect:/activiti/file";
	}
	
	@RequestMapping(value = "/process", method = RequestMethod.GET)
	public String toProcess(Map<String,Object> map,HttpSession session){
		logger.info("toProcess");
		List<ProcessDefinition> processes =activitiFacade.getProcessList();
		map.put("processes", processes);
		map.put(Constant.MESSAGE_NAME, new SessionMPR(session).getMessage());
		return "activiti/listprocess";
	}
	
	@RequestMapping(value = "/process/{deploymentId}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable("deploymentId") String deploymentId,HttpSession session){
		logger.info("delete");
		activitiFacade.deleteProcessByDeploymentId(deploymentId);
		new SessionMPR(session).setMessage("流程删除成功！");
		return "redirect:/activiti/process";
	}
	
	@RequestMapping(value = "/process/{processDefinitionId}/start", method = RequestMethod.POST)
	public String start(@PathVariable("processDefinitionId") String processDefinitionId,HttpSession session){
		logger.info("start");
		ProcessInstance processInstance = activitiFacade.startProcess(processDefinitionId);
		String message=String.format("流程%s开始执行！", processInstance.getBusinessKey());
		new SessionMPR(session).setMessage(message);
		return "redirect:/activiti/process";
	}
	
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String toHistory(Map<String,Object> map,HttpSession session){
		List<HistoricProcessInstance> history = historyService.createHistoricProcessInstanceQuery().list();
		map.put("history", history);
		map.put(Constant.MESSAGE_NAME, new SessionMPR(session).getMessage());
		return "activiti/history";
	}
	



}
