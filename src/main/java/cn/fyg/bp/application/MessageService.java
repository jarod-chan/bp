package cn.fyg.bp.application;

import cn.fyg.bp.domain.model.messagetest.Message;



public interface MessageService {
	
	Message add(Message message);

	Message update(Message message);

}
