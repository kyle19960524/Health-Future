package controller;
//會員登出功能

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {
	
	@RequestMapping(path="/logout.controller")
	public String logout(HttpSession session){
        
        session.invalidate();   //透過session.invalidate()方法來註銷當前的session
        return "Goodbye";
    }
	
}
