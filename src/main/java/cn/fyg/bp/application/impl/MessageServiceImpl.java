package cn.fyg.bp.application.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.fyg.bp.application.MessageService;
import cn.fyg.bp.domain.model.messagetest.Message;
import cn.fyg.bp.domain.model.messagetest.MessageRepository;



@Service
public class MessageServiceImpl implements MessageService {
	
	@Resource
	MessageRepository messageRepository;

	@Override
	@Transactional
	public Message add(Message message) {
		return this.messageRepository.persist(message);
	}

	@Override
	@Transactional
	public Message update(Message message) {
		return this.messageRepository.update(message);
	}

}
