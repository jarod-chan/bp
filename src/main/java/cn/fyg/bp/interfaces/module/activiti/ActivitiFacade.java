package cn.fyg.bp.interfaces.module.activiti;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Component;

import cn.fyg.bp.application.ActivitiService;

@Component
public class ActivitiFacade {

	public static final String RELATIVE_PATH = "processfile";

	@Resource
	ServletContext servletContext;
	@Resource
	ActivitiService activitiService;
	@Resource
	RepositoryService repositoryService;

	public List<FileBean> getFileList() {
		String path =this.getProcessFilePath();
		File fileDir = createFileDir(path);
		return getFolderFile(fileDir);
	}

	private List<FileBean> getFolderFile(File fileDir) {
		String[] files = fileDir.list();
		List<FileBean> fileList = new ArrayList<FileBean>();
		for (int i = 0; i < files.length; i++) {
			FileBean fileBean = new FileBean();
			fileBean.setFilename(files[i].toString());
			fileList.add(fileBean);
		}
		return fileList;
	}

	private File createFileDir(String path) {
		File file = new File(path);
		if (!file.exists()) {
			file.mkdir();
		}
		return file;
	}

	public void deployFile(String filename) throws FileNotFoundException {
		activitiService.deployFile(filename,this.getProcessFilePath());
	}
	
	private String getProcessFilePath(){
		return servletContext.getRealPath("") + File.separator+ RELATIVE_PATH;
	}
	
	public List<ProcessDefinition> getProcessList() {
		return repositoryService.createProcessDefinitionQuery().list();
	}


	public void deleteProcessByDeploymentId(String deploymentId) {
		activitiService.deleteProcessByDeploymentId(deploymentId);
	}

	public ProcessInstance startProcess(String processDefinitionId){
		return activitiService.startProcess(processDefinitionId);
	}

}
