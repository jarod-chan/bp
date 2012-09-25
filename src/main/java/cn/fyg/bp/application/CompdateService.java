package cn.fyg.bp.application;

import cn.fyg.bp.domain.model.vacation.compdate.Compdate;
import cn.fyg.bp.domain.model.vacation.compdate.DayResult;
import cn.fyg.bp.domain.model.vacation.dayitem.Dayitem;

public interface CompdateService {
	
	Compdate append(Dayitem dayitem);
	
	void remove(Dayitem dayitem);

	void syncCompdate();
	
	void syncCompdateYear(Long year);

	DayResult computerDay(Dayitem begDayitem,Dayitem endDayitem);
}
