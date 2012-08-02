package cn.fyg.bp.domain.model.messagetest;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Message {
	
	@Id
	private Long id;

	private String context;
	
	public Message id(Long id){
		this.id=id;
		return this;
	}
	
	public Long id(){
		return this.id;
	}
	
	public Message context(String context){
		this.context=context;
		return this;
	}

	public String context(){
		return this.context;
	}

}
