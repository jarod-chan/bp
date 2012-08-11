package cn.fyg.bp.interfaces.web.shared.message;

public class Message {
	
	private Message(){}
	
	public static Message create(){
		return new Message();
	}
	
	private enum Level{
		INFO,ERROR;
	}
	
	private Level level;
	private String message;
	
	
	public Message info() {
		this.level = Level.INFO;
		return this;
	}
	
	public Message Error() {
		this.level = Level.ERROR;
		return this;
	}
	
	public Message message(String message,Object...args) {
		this.message = String.format(message, args);
		return this;
	}
	
	public String getLevel() {
		return level.toString().toLowerCase();
	}
	
	public String getMessage() {
		return message;
	}
	
}
