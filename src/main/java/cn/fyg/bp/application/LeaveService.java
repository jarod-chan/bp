package cn.fyg.bp.application;

import cn.fyg.bp.domain.model.vacation.leave.Leave;
import cn.fyg.module.user.User;

public interface LeaveService {
	
	Leave create(User user);
	
	Leave save(Leave leave);
	
	Leave find(Long id);
	
}
