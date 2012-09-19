package cn.fyg.bp.infrastructure;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.fyg.bp.infrastructure.mail.EmailException;
import cn.fyg.bp.infrastructure.mail.EmailService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MailTest {
	
	@Autowired
	EmailService emailService;
	
	@Test
	public void testService(){
		assertNotNull(emailService);
	}
	
	@Test
	public void sendMail(){
		try {
			emailService.sendMail("232879583@qq.com", "mymail", "2222");
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
