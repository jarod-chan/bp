package cn.fyg.bp.interfaces.web.module.qui;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/qui")
public class QuiCtl {
	
	private static final String PATH = "qui/";
	private interface Page {
		String FRAME = PATH + "frame";
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String toQui(){
		return Page.FRAME;
	}

}
