package cn.fyg.bp.interfaces.module.shared.bean;

import cn.fyg.bp.interfaces.module.shared.tool.DateTool;

public class YearAndMonthBean {
	private Long year;
	private Long month;
	
	

	public YearAndMonthBean() {
		DateTool dtl=new DateTool();
		this.year=dtl.getCurrentYear();
		this.month=dtl.getCurrentMonth();
	}

	public Long getYear() {
		return year;
	}

	public void setYear(Long year) {
		this.year = year;
	}

	public Long getMonth() {
		return month;
	}

	public void setMonth(Long month) {
		this.month = month;
	}

}
