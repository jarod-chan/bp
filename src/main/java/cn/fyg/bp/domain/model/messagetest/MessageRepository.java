package cn.fyg.bp.domain.model.messagetest;

import org.springframework.data.repository.Repository;


public interface MessageRepository extends Repository<Message, Long>,MessageRepositoryPlus {
	
	Message save(Message message);

	Message findById(Long id);
	
}
