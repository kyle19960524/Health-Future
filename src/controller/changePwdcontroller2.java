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
@SessionAttributes(names = { "errors" ,"success" ,"account","pwd"})
public class changePwdcontroller2 {

	private UsersService service;

	@Autowired
	public changePwdcontroller2(UsersService service) {
		this.service = service;
	}

	@RequestMapping(path = "/changepwd2.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam(name = "newpwd1") String newpwd1,
			@RequestParam(name = "newpwd2") String newpwd2, Model m) {

		Users ua = new Users((String)m.getAttribute("account"),(String)m.getAttribute("pwd"));
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (newpwd1.trim().isEmpty() || newpwd2.trim().isEmpty()) {
			errors.put("noword", "資料都必須填寫");
			return "changePwd2";
		}
		if (!newpwd1.equals(newpwd2)) {
			errors.put("noword", "兩次輸入的密碼不同");
			return "changePwd2";
		}

		else {
			m.addAttribute("success","您的密碼已成功更新");
			ua.setUserPassword(newpwd2);
			
			service.updatepassword(ua);
			return "skippage2";
		}

		
	}

}
