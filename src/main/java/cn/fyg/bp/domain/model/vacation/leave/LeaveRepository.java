package cn.fyg.bp.domain.model.vacation.leave;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import cn.fyg.bp.domain.model.vacation.dayitem.AMPM;
import cn.fyg.module.user.User;

public interface LeaveRepository extends Repository<Leave, Long> {
	
	Leave save(Leave leave);
	
	Leave findOne(Long id);

	@Query("select a.no from Leave a where a.id=" +
			"(select max(b.id) from Leave b where b.user=:user )") 
	String findMaxNoByUser(@Param("user")User user);
	
	@Query("from Leave a where " +
			"((a.begDayitem.date=:date and a.begDayitem.ampm<=:ampm) or (a.begDayitem.date<:date)) " +
			"and " +
			"((a.endDayitem.date=:date and a.endDayitem.ampm>=:ampm) or (a.endDayitem.date>:date)) ")
	List<Leave> findByDayitemContain(@Param("date")Date date,@Param("ampm")AMPM ampm);

}