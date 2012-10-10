package cn.fyg.bp.interfaces.web.module.hr.leave.flow;

import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

import cn.fyg.bp.application.LeaveService;
import cn.fyg.bp.domain.model.vacation.common.BusiState;
import cn.fyg.bp.domain.model.vacation.leave.Leave;
import cn.fyg.bp.interfaces.web.module.hr.leave.FlowVarName;
import cn.fyg.bp.interfaces.web.shared.tool.FlowConstant;

public class BeginSet implements JavaDelegate {
	
	private Expression service;

	@Override
	public void execute(DelegateExecution execution) throws Exception {
		LeaveService leaveService =(LeaveService) service.getValue(execution);
		Long businessId = (Long) execution.getVariableLocal(FlowConstant.BUSINESS_ID);
		Leave leave = leaveService.find(businessId);
		leave.setBusiState(BusiState.execute);
		leaveService.save(leave);
		execution.setVariableLocal(FlowVarName.ACTURL_DAY, leave.getActurlDay());
	}

}
