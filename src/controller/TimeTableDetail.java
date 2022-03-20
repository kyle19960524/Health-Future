package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.BookingTableService;
import model.Member;
import model.MemberService;
import model.UsersService;

@Controller
public class TimeTableDetail {
	private BookingTableService bService;
	private MemberService mService;
	private UsersService dService;

	@Autowired
	public TimeTableDetail(BookingTableService bService, MemberService mService, UsersService dService) {
		this.bService = bService;
		this.mService = mService;
		this.dService = dService;
	}

	@RequestMapping(path = { "/bookingDetailForNutri.controller" }, method = { RequestMethod.POST })
	public String bookingDetailForNutri(@RequestParam(name = "bookingTableId") int id, Model m) throws Exception {
		Map<String, String> memData = new HashMap<String, String>();
		Member A = mService.findById(bService.findById(id).getMemId());
		m.addAttribute("clickNotiData", bService.findById(id));
		memData.put("nickname", A.getNickName());
		memData.put("birthday", A.getBirthday());
		memData.put("sex", A.getSex());
		memData.put("height", A.getHeight());
		memData.put("weight", A.getWeight());
		memData.put("memberFile", A.getFileName());
		m.addAttribute("memberData", memData);
		return "notificationresultForNutriShowMemberDetail";
	}

	@RequestMapping(path = { "/bookingDetailForMem.controller" }, method = { RequestMethod.POST })
	public String bookingDetailForMem(@RequestParam(name = "bookingTableId") int id, Model m) throws Exception {
		m.addAttribute("dietitian", dService.findByFullName(bService.findById(id).getNutriName()));
		m.addAttribute("clickNotiData", bService.findById(id));
		return "notificationresultForMemShowNutritionDetail";
	}
}
