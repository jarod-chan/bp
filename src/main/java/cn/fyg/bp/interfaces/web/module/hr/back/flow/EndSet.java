package cn.fyg.bp.interfaces.web.module.hr.back.flow;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.JavaDelegate;

import cn.fyg.bp.application.BackService;
import cn.fyg.bp.domain.model.vacation.back.Back;
import cn.fyg.bp.domain.model.vacation.common.BusiState;
import cn.fyg.bp.interfaces.web.shared.tool.FlowConstant;

public class EndSet implements JavaDelegate {
	
	private Expression backServiceExp;

	@Override
	public void execute(DelegateExecution execution) throws Exception {
		BackService backService =(BackService) backServiceExp.getValue(execution);
		Long businessId = (Long) execution.getVariable(FlowConstant.BUSINESS_ID);
		Back back = backService.find(businessId);
		back.setBusiState(BusiState.finish);
		backService.save(back);
	}

}
