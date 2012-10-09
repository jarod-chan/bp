package cn.fyg.bp.interfaces.web.module.hr.leave.flow;

import java.math.BigDecimal;

import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

import cn.fyg.bp.application.LeaveService;

public class BeginSet implements JavaDelegate {
	
	private Expression service;

	@Override
	public void execute(DelegateExecution execution) throws Exception {
		//LeaveService leaveService =(LeaveService) service.getValue(execution);
		execution.setVariableLocal("isAggree", Boolean.TRUE);
		execution.setVariableLocal("acturlDay", new BigDecimal("3.0"));
	}

}
