package cn.fyg.bp.interfaces.web.module.system.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/index")
public class IndexCtl {
	
	private static final String PATH = "system/index/";
	private interface Page {
		String INDEX = PATH + "index";
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String toIndex() {
		return Page.INDEX;
	}

}
