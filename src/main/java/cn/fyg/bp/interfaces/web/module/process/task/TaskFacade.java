package cn.fyg.bp.interfaces.web.module.process.task;

import java.util.ArrayList;
import java.util.List;

import org.activiti.engine.FormService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TaskFacade {
	
	@Autowired
	RuntimeService runtimeService;
	@Autowired
	TaskService taskService;
	@Autowired
	FormService formService;
	
	public List<ProcessTaskBean> getProcessTasks(String userKey){
		List<ProcessTaskBean> result=new ArrayList<ProcessTaskBean>();
		List<Task> tasks = taskService.createTaskQuery().taskAssignee(userKey).list();
		for (Task task : tasks) {
			ProcessTaskBean processTaskBean=new ProcessTaskBean();
			processTaskBean.setTask(task);
			String executionId = task.getExecutionId();
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(executionId).singleResult();
			processTaskBean.setProcessInstance(processInstance);
			String formKey= formService.getTaskFormData(task.getId()).getFormKey();
			processTaskBean.setFormKey(formKey);
			Object obj=runtimeService.getVariableLocal(executionId, "businessId");
			String businessId=obj==null?"":obj.toString();
			processTaskBean.setBusinessId(businessId);
			result.add(processTaskBean);
		}
		return result;
	}

}
