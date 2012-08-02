package cn.fyg.bp.infrastructure.persistence.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import cn.fyg.bp.domain.model.messagetest.Message;
import cn.fyg.bp.domain.model.messagetest.MessageRepository;


@Repository
public class MessageRepositoryJpa implements MessageRepository {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Message find(Long id) {
		return entityManager.find(Message.class, id);
	}

	@Override
	public Message persist(Message message) {
		entityManager.persist(message);
		return message;
	}

	@Override
	public Message update(Message message) {
		return entityManager.merge(message);
	}

}
