package cn.fyg.bp.domain.model.messagetest;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;





@Repository("messageRepository")
public class MessageRepositoryImpl implements MessageRepositoryPlus {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Message testPlus(Long id) {
		return entityManager.find(Message.class, id);
	}

}
