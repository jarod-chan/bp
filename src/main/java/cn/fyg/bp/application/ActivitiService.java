package cn.fyg.bp.application;

import java.io.FileNotFoundException;

import org.activiti.engine.runtime.ProcessInstance;

public interface ActivitiService {

	void deployFile(String filename, String folderPath)throws FileNotFoundException;

	void deleteProcessByDeploymentId(String deploymentId);

	ProcessInstance startProcess(String processDefinitionId);
	
}
