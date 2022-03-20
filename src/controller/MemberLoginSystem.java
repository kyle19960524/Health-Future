package controller;
//會員登入功能

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSON;

import model.BookingTable;
import model.BookingTableService;
import model.Member;
import model.MemberService;

@Controller
@SessionAttributes(names = { "user", "pwd", "errors", "loginStatus", "M", "membernickname", "memberfullname",
		"memberid", "notification", "noNotification","memFileName"})
public class MemberLoginSystem {

	private MemberService service;
	private BookingTableService bService;

	@Autowired
	public MemberLoginSystem(MemberService service, BookingTableService bService) {
		this.service = service;
		this.bService = bService;
	}

	@RequestMapping(path = "/checkLogin.controller", method = RequestMethod.POST)
	public String goAction(@RequestParam(name = "m_useraccount") String m_useraccount,
			@RequestParam(name = "m_password") String m_password, Model m) {

		Map<String, String> errors = new HashMap<String, String>();
		Map<String, String> notifi = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (m_useraccount == null || m_useraccount.length() == 0) {
			errors.put("name", "請輸入會員帳號");
		}

		if (m_password == null || m_password.length() == 0) {
			errors.put("pwd", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			// errors.clear();
			return "memberLogin";
		}

		m.addAttribute("user", m_useraccount);
		m.addAttribute("pwd", m_password);

		boolean accountStatus = service.checkLogin(new Member(m_useraccount, m_password));

		if (accountStatus) {
			m.addAttribute("loginStatus", true);
			m.addAttribute("M", true);
			// m.addAttribute("name", m_useraccount);
			m.addAttribute("membernickname", service.findByName(m_useraccount).getNickName());
			m.addAttribute("memberfullname", service.findByName(m_useraccount).getFullName());
			m.addAttribute("memberid", service.findByName(m_useraccount).getId());
			m.addAttribute("memFileName", service.findByName(m_useraccount).getFileName());
			List<BookingTable> B = bService.findNotificationForMem(service.findByName(m_useraccount).getId(),
					service.findByName(m_useraccount).getFullName(), "1");
			if (B == null) {
				m.addAttribute("noNotification", notifi);
				notifi.put("noNoti", "你暫且沒有新通知喔");
				return "loginSuccess";
			}
			m.addAttribute("notification", B);
			return "loginSuccess";
		}

		errors.put("msg", "會員帳號或密碼不正確");
		return "memberLogin";
	}

	@RequestMapping(path = "/memberdata.controller")
	public String turntoMember(HttpServletRequest request, @SessionAttribute(name = "user") String data, Model m) {
		// service.update(data);
		Map<String, String> show = new HashMap<String, String>();
		show.put("A", service.findByName(data).getUserAccount());
		show.put("B", service.findByName(data).getUserPwd());
		show.put("C", service.findByName(data).getFullName());
		show.put("D", service.findByName(data).getNickName());
		show.put("E", service.findByName(data).getIdCard());
		show.put("F", service.findByName(data).getSex());
		show.put("G", service.findByName(data).getBirthday());
		show.put("H", service.findByName(data).getHeight());
		show.put("I", service.findByName(data).getWeight());
		show.put("J", service.findByName(data).getLocation());
		show.put("K", service.findByName(data).getCellphone());
		show.put("L", service.findByName(data).getEmail());
		show.put("M", service.findByName(data).getPath());

		m.addAttribute("list", show);
				
		return "Member/DataManage";
	}

	@RequestMapping(path = "/checkLogin.controller")
	public String goAction() {
		return "memberLogin";
	}
	
/* 新增 */
	
	@RequestMapping(value = "/getMemberById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getMemberById(int  m_id) {
        Member mac = service.getMemberById(m_id);
        String result = JSON.toJSONString(mac);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

}