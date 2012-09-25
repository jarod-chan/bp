package cn.fyg.bp.domain.model.vacation.compdate;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import cn.fyg.bp.domain.model.vacation.dayitem.AMPM;
import cn.fyg.bp.domain.model.vacation.dayitem.Dayitem;

public interface CompdateRepository extends Repository<Compdate, Long> {
	
	Compdate findOne(Long id);

	Compdate save(Compdate compdate);
	
	Compdate findByVacation(Dayitem dayitem);
	
	List<Compdate> findByWaitActionNot(WaitAction waitAction);
	
	void delete(Compdate compdate);
	
	void delete(Iterable<Compdate> compdateList);
	
	@Query("select count(c) from Compdate c where " +
			"c.waitAction='normal' and "+
			"((c.vacation.date=:beg_date and c.vacation.ampm>=:beg_ampm) or (c.vacation.date>:beg_date)) " +
			"and " +
			"((c.vacation.date=:end_date and c.vacation.ampm<=:end_ampm) or (c.vacation.date<:end_date)) ") 
	Long countByBegDayitemAndEndDayitem(@Param("beg_date")Date beg_date,@Param("beg_ampm")AMPM beg_ampm,@Param("end_date")Date end_Date,@Param("end_ampm")AMPM end_ampm);
}
