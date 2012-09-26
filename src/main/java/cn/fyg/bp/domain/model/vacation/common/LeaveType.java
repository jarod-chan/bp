package cn.fyg.bp.domain.model.vacation.common;

import cn.fyg.bp.domain.model.shared.CommonEnum;

public enum LeaveType implements CommonEnum {
	
	PERSONAL("事假"),
	SICK("病假"),
	MARRIAGE("婚假"),
	MATERNITY("产假"),
	ANNUAL("年休假");
	
	private String name;
	
	private LeaveType(String name){
		this.name=name;
	}
	

	@Override
	public String getName() {
		return this.name;
	}

	@Override
	public void setName(String name) {
		this.name=name;
	}
}
