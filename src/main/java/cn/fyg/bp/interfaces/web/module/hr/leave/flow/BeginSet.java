package cn.fyg.bp.interfaces.web.module.hr.leave.flow;

import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

import cn.fyg.bp.application.LeaveService;
import cn.fyg.bp.application.OpinionService;
import cn.fyg.bp.domain.model.vacation.common.BusiState;
import cn.fyg.bp.domain.model.vacation.leave.Leave;
import cn.fyg.bp.interfaces.web.module.hr.leave.LeaveVarName;
import cn.fyg.bp.interfaces.web.shared.tool.FlowConstant;

public class BeginSet implements JavaDelegate {
	
	private Expression leaveServiceExp;
	
	private Expression opinionServiceExp;

	@Override
	public void execute(DelegateExecution execution) throws Exception {
		LeaveService leaveService =(LeaveService) leaveServiceExp.getValue(execution);
		OpinionService opinionService=(OpinionService) opinionServiceExp.getValue(execution);
		Long businessId = (Long) execution.getVariableLocal(FlowConstant.BUSINESS_ID);
		Leave leave = leaveService.find(businessId);
		leave.setBusiState(BusiState.execute);
		leaveService.save(leave);
		
		opinionService.clear(Leave.BUSINESS_CODE, businessId);
		execution.setVariableLocal(LeaveVarName.ACTURL_DAY, leave.getActurlDay());
	}

}
