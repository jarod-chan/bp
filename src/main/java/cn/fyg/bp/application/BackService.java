package cn.fyg.bp.application;

import cn.fyg.bp.domain.model.vacation.back.Back;
import cn.fyg.module.user.User;

public interface BackService {
	
	Back create(User user);
	
	Back save(Back back);
	
	Back find(Long id);
		
}
