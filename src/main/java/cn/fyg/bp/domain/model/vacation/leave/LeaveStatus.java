package cn.fyg.bp.domain.model.vacation.leave;

import cn.fyg.bp.domain.model.shared.CommonEnum;

public enum LeaveStatus implements CommonEnum {
	execute("执行"),
	finish("完成"),
	voided("作废"); 
	
	private String name;

	private LeaveStatus(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
