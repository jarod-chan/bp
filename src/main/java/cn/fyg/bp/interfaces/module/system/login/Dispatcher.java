package cn.fyg.bp.interfaces.module.system.login;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 *根据登录员工的角色来分发url
 */
public class Dispatcher {
	
	public static final Logger logger=LoggerFactory.getLogger(Dispatcher.class);
	
	public static String dispatcher(LoginRetBean loginRet) {
		
		if(loginRet.getMange().equals("A")){
			return "redirect:admin/all";
		}
		if(loginRet.getMange().equals("G")){
			return "redirect:gmange/"+loginRet.getPersonid()+"/idrmonthplan";
		}
		if(loginRet.getMange().equals("Y")){
			return "redirect:mange/"+loginRet.getPersonid()+"/idrmonthplan";
		}
		if (loginRet.getMange().equals("N")) {
			return "redirect:person/"+loginRet.getPersonid()+"/monthchk";
		}
		if (loginRet.getMange().equals("F")) {
			return "redirect:finance/"+loginRet.getPersonid()+"/summarysnapshot";
		}
		
		return "redirect:/login";
	}

}
