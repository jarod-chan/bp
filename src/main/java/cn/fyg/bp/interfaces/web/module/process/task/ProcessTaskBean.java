package cn.fyg.bp.interfaces.web.module.process.task;

import org.activiti.engine.runtime.Execution;
import org.activiti.engine.task.Task;

public class ProcessTaskBean {
	
	private Task task;
	
	private Execution execution;
	
	private String formKey;
	
	private String businessId;

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}


	public Execution getExecution() {
		return execution;
	}

	public void setExecution(Execution execution) {
		this.execution = execution;
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
