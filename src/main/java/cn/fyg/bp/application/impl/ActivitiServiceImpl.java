package cn.fyg.bp.application.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.zip.ZipInputStream;

import javax.annotation.Resource;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.fyg.bp.application.ActivitiService;
import cn.fyg.bp.application.MessageService;
import cn.fyg.bp.domain.model.messagetest.Message;

@Service
public class ActivitiServiceImpl implements ActivitiService {
	
	@Resource
	RepositoryService repositoryService;
	@Resource
	RuntimeService runtimeService;
	@Resource
	MessageService messageService;
	
	@Override
	@Transactional
	public void deployFile(String filename,String folderPath) throws FileNotFoundException {
		String fullFilePath = folderPath+ File.separator + filename;
		
		ZipInputStream inputStream = new ZipInputStream(new FileInputStream(fullFilePath));
	    
		repositoryService.createDeployment()
		    .name(filename)
		    .addZipInputStream(inputStream)
		    .deploy();
		
	}
	
	@Override
	@Transactional
	public void deleteProcessByDeploymentId(String deploymentId) {
		repositoryService.deleteDeployment(deploymentId, true);
	}
	
	@Override
	@Transactional
	public ProcessInstance startProcess(String processDefinitionId){
		Message message = new Message().id(2l).context(String.format("processDefinitionId:%s startProcess", processDefinitionId));
		messageService.save(message);
		return runtimeService.startProcessInstanceById(processDefinitionId);
	}

}
