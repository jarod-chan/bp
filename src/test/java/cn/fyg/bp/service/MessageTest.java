package cn.fyg.bp.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.fyg.bp.application.MessageService;
import cn.fyg.bp.domain.model.messagetest.Message;
import cn.fyg.bp.domain.model.messagetest.MessageRepository;

@ContextConfiguration("/applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class MessageTest {
	
	@Resource
	MessageService messageService;
	@Resource
	MessageRepository messageRepository;
	
	@Test
	public void testSave(){
		long id = 100L;
		Message message=new Message();
		message.id(id).context("it is test class");
		messageService.add(message);
		
		Message returnMessage=messageRepository.find(id);
		assertEquals("it is test class", returnMessage.context());
			
	}
	
	@Test
	public void testSaveError(){
		long id = 101L;
		Message message1=new Message().id(id).context("it is message1");
		messageService.add(message1);
		
		try{
			Message message2=new Message().id(id).context("it is message2");
			messageService.add(message2);
		}catch(Exception e){
			assertNotNull(e);
		}
		

	}

}
