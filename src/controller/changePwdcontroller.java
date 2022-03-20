package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.Users;
import model.UsersService;

@Controller
@SessionAttributes(names = { "errors","account","pwd" })
public class changePwdcontroller {

	private UsersService service;

	@Autowired
	public changePwdcontroller(UsersService service) {
		this.service = service;
	}

	@RequestMapping(path = "/changepwd1.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam(name = "account") String account, 
								@RequestParam(name = "pwd") String password, Model m) {
		
		Users ua = new Users(account,password);
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if(account.trim().isEmpty()||password.trim().isEmpty()) {
			
			errors.put("inputdata", "資料都必須填寫");
			//System.out.println("456");
			return "changePwd1"; }else {
				
				if(service.checkLogin(ua)) {
					m.addAttribute("account", ua.getAccount());
					m.addAttribute("pwd", ua.getUserPassword())
;					return "changePwd2";
				}else {
					errors.put("inputdata", "帳號或密碼有誤");
					//System.out.println("123");
					return "changePwd1";  }
				
			}
			
	}
}
