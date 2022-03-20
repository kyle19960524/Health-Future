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

import model.Member;
import model.MemberService;

@Controller
@SessionAttributes(names = { "errors" ,"success" ,"account","pwd"})
public class PwdChangeController {

	private MemberService service;

	@Autowired
	public PwdChangeController(MemberService service) {
		this.service = service;
	}

	@RequestMapping(path = "/pwdchange.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam(name = "newpwd1") String newpwd1,
			@RequestParam(name = "newpwd2") String newpwd2, Model m) {

		Member users = new Member((String)m.getAttribute("account"),(String)m.getAttribute("pwd"));
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (newpwd1.trim().isEmpty() || newpwd2.trim().isEmpty()) {
			errors.put("noword", "資料都必須填寫");
			return "Member/PwdChange";
		}
		if (!newpwd1.equals(newpwd2)) {
			errors.put("noword", "兩次輸入的密碼不同");
			return "Member/PwdChange";
		}

		else {
			m.addAttribute("success","您的密碼已成功更新");
			users.setUserPwd(newpwd2);
			
			service.updatepassword(users);
			return "Member/PwdSkip2";
		}
	}
	
	@RequestMapping(path = "/jumptoForgot.controller")
	public String pwdForgot () {
		return "memberLogin";
	}
	
}
