package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.BookingTable;
import model.BookingTableService;
import model.Users;
import model.UsersService;

@Controller
@SessionAttributes(names = { "d_id", "d_name", "email", "address", "status", "notification","noNotification","loginStatusCertified" })
public class loginController {
	private BookingTableService bService;
	private UsersService service;

	@Autowired
	public loginController(UsersService service, BookingTableService bService) {
		this.service = service;
		this.bService = bService;
	}

	@RequestMapping(path = "/login.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam(name = "account") String user, @RequestParam(name = "pwd") String pwd,
			Model m) {
		Users A = new Users(user, pwd);
		Map<String, String> errors = new HashMap<String, String>();
		Map<String, String> notifi = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		if (user.trim().isEmpty() || pwd.trim().isEmpty()) {
			errors.put("inputdata", "帳號密碼不可空白");
			return "Login";
		} else {
			if (service.checkLogin(A)) {
					if(service.find(A).get(0).getStatus()==0){
						m.addAttribute("notvalid", "您的帳號還未經過認證");
						return "Login";
					}
				m.addAttribute("d_name", service.find(A).get(0).getName());
				m.addAttribute("d_id", service.find(A).get(0).getId());
				m.addAttribute("loginStatusCertified", true);
				m.addAttribute("status", "n");
				List<BookingTable> B = bService.findNotificationForNutri(service.find(A).get(0).getId(),
						service.find(A).get(0).getName(), "1");
				if (B == null) {
					m.addAttribute("noNotification", notifi);
					notifi.put("noNoti", "你暫且沒有新通知喔");
					return "mainPage";
				}
				m.addAttribute("notification", B);
				return "mainPage";

			} else {
				errors.put("inputdata", "帳密或密碼錯誤");
				return "Login";
			}
		}

	}

}

//	@RequestMapping(path = "/logout.controller")
//	public String logOut(@SessionAttribute("loginStatusCertified") boolean status) {
//	
//		status=false;
//		return"Login/Login";
//		
//	}
