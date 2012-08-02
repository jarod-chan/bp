package cn.fyg.bp.domain.model.messagetest;


public interface MessageRepository  {
	
	Message find(Long id);

	Message update(Message message);

	Message persist(Message message);
}
