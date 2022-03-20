package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import model.BookingTableService;
import model.Member;
import model.MemberService;
import model.UsersService;

@Controller
@SessionAttributes(names = { "notification", "noNotification" })
public class Notification {
	private UsersService dService;
	private BookingTableService bService;
	private MemberService mService;

	@Autowired
	public Notification(BookingTableService bService, MemberService mService, UsersService dService) {
		this.bService = bService;
		this.mService = mService;
		this.dService = dService;
	}

	@RequestMapping(path = { "/notificationForNutri.controller" }, method = { RequestMethod.POST })
	public String notificationNutri(@RequestParam(name = "notifi") int id, @SessionAttribute(name = "d_id") int nutriId,
			@SessionAttribute(name = "d_name") String nutriName, SessionStatus sessionStatus, HttpSession session,
			Model m) throws Exception {
		Map<String, String> notifi = new HashMap<String, String>();
		Map<String, String> memData = new HashMap<String, String>();
		bService.updateNotification(id);
		Member A = mService.findById(bService.findById(id).getMemId());
		m.addAttribute("clickNotiData", bService.findById(id));
		memData.put("nickname", A.getNickName());
		memData.put("birthday", A.getBirthday());
		memData.put("sex", A.getSex());
		memData.put("height", A.getHeight());
		memData.put("weight", A.getWeight());
		memData.put("memberFile", A.getFileName());
		m.addAttribute("memberData", memData);
		System.out.println(bService.findNotificationForNutri(nutriId, nutriName, "1"));
		if (bService.findNotificationForNutri(nutriId, nutriName, "1") == null) {
			m.addAttribute("notification", null);
			session.removeAttribute("notification");
			sessionStatus.setComplete();
			session.setAttribute("noNotification1", notifi);

			notifi.put("noNoti", "你暫且沒有新通知喔");
			return "notificationresultForNutriShowMemberDetail";
		}
		m.addAttribute("notification", bService.findNotificationForNutri(nutriId, nutriName, "1"));
		return "notificationresultForNutriShowMemberDetail";
	}

	@RequestMapping(path = { "/notificationForMem.controller" }, method = { RequestMethod.POST })
	public String notificationMem(@RequestParam(name = "notifi") int id, @SessionAttribute(name = "memberid") int memId,
			@SessionAttribute(name = "memberfullname") String memName, SessionStatus sessionStatus, HttpSession session,
			Model m) throws Exception {
		Map<String, String> notifi = new HashMap<String, String>();
		bService.updateNotification(id);
		m.addAttribute("dietitian",dService.findByFullName(bService.findById(id).getNutriName()));
		m.addAttribute("clickNotiData", bService.findById(id));
		System.out.println(bService.findNotificationForMem(memId, memName, "1"));
		if (bService.findNotificationForMem(memId, memName, "1") == null) {
			m.addAttribute("notification", null);
			session.removeAttribute("notification");
			sessionStatus.setComplete();
			session.setAttribute("noNotification1", notifi);

			notifi.put("noNoti", "你暫且沒有新通知喔");
			return "notificationresultForMemShowNutritionDetail";
		}
		m.addAttribute("notification", bService.findNotificationForMem(memId, memName, "1"));
		return "notificationresultForMemShowNutritionDetail";
	}
}
