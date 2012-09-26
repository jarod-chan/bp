package cn.fyg.bp.application.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.fyg.bp.application.LeaveService;
import cn.fyg.bp.domain.model.vacation.leave.Leave;
import cn.fyg.bp.domain.model.vacation.leave.LeaveFactory;
import cn.fyg.bp.domain.model.vacation.leave.LeaveRepository;
import cn.fyg.module.user.User;

@Service
public class LeaveServiceImpl implements LeaveService {
	
	
	@Autowired
	LeaveRepository leaveRepository;

	@Override
	public Leave create(User user) {
		String maxNo=leaveRepository.findMaxNoByUser(user);
		return LeaveFactory.create(user, maxNo);
	}



	@Override
	@Transactional
	public Leave save(Leave leave) {
		return leaveRepository.save(leave);
	}

	@Override
	public Leave find(Long id) {
		return leaveRepository.findOne(id);
	}


}
