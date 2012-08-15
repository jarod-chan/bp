package cn.fyg.bp.interfaces.web.module.process;

import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

public class ProcessTaskBean {
	
	private Task task;
	
	private ProcessInstance processInstance;
	
	private String formKey;
	
	private String businessId;

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public ProcessInstance getProcessInstance() {
		return processInstance;
	}

	public void setProcessInstance(ProcessInstance processInstance) {
		this.processInstance = processInstance;
	}

	public String getFormKey() {
		return formKey;
	}

	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	
	
}
