package cn.fyg.bp.interfaces.web.module.function.taskcenter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/taskcenter")
public class TaskCenter {
	
	private static final String PATH = "taskcenter/";
	private interface Page {
		String LIST = PATH + "list";
		String SUB=PATH + "sub";
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String toList(){
		return Page.LIST;
	}

}
