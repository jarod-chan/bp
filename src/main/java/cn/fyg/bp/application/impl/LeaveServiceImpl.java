package cn.fyg.bp.application.impl;

import java.util.Calendar;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.fyg.bp.application.LeaveService;
import cn.fyg.bp.domain.model.vacation.leave.Leave;
import cn.fyg.bp.domain.model.vacation.leave.LeaveRepository;
import cn.fyg.bp.domain.model.vacation.leave.LeaveType;
import cn.fyg.module.user.User;

@Service
public class LeaveServiceImpl implements LeaveService {
	
	private static final String SEPARATE = "-";
	@Autowired
	LeaveRepository leaveRepository;

	@Override
	public Leave create(User user) {
		Leave leave=new Leave();
		String no=computerNo(user);
		leave.setNo(no);
		leave.setLeaveType(LeaveType.PERSONAL);
		leave.setUser(user);
		return leave;
	}

	private String computerNo(User user) {
		String prev=Leave.BUSINESS_CODE+(Calendar.getInstance().get(Calendar.YEAR)+"").substring(2);
		String midl=user.getKey().toUpperCase();
		String post=getFlwono(user);
		return prev+SEPARATE+midl+SEPARATE+post;
	}

	public String getFlwono(User user) {
		String maxNo=leaveRepository.findMaxNoByUser(user);
		if(StringUtils.isBlank(maxNo)){
			return "1";
		}
		maxNo=maxNo.substring(maxNo.lastIndexOf(SEPARATE)+1);
		return String.valueOf(Integer.valueOf(maxNo).intValue()+1);
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
