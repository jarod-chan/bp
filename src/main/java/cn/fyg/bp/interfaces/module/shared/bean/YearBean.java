package cn.fyg.bp.interfaces.module.shared.bean;

import cn.fyg.bp.interfaces.module.shared.tool.DateTool;

public class YearBean {
	
	private Long year;

	public YearBean() {
		DateTool dtl=new DateTool();
		this.year = dtl.getCurrentYear();
	}

	public Long getYear() {
		return year;
	}

	public void setYear(Long year) {
		this.year = year;
	}

}
