package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.BookingTable;
import model.BookingTableService;
import model.NutriTime;
import model.NutriTimeService;

@Controller
public class BookingSystem {
	private NutriTimeService nService;
	private BookingTableService bService;

	@Autowired
	public BookingSystem(NutriTimeService nService, BookingTableService bService) {
		this.nService = nService;
		this.bService = bService;
	}

	@RequestMapping(path = { "/bookingtime.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "nutridate") String nutridate,
			@RequestParam(name = "nutritime") String nutritime, @SessionAttribute(name = "d_name") String nutriName,
			@SessionAttribute(name = "d_id") int nutriId, Model m) throws Exception {
		Map<String, String> errors = new HashMap<>();
		Map<String, String> thisTimeBooking = new HashMap<>();
		System.out.println(nutritime);
		m.addAttribute("errors", errors);
		if (nutridate.length() == 0 && nutritime.equals("0")) {
			errors.put("both", "請選擇日期和時段");
			return "booking";
		}
		if (nutridate == null || nutridate.length() == 0) {
			errors.put("date", "請選擇日期");
			return "booking";
		}
		if (nutritime.equals("0")) {
			errors.put("time", "請選擇時段");
			return "booking";
		}
		String formatdate = nService.date(nutridate);
		NutriTime nt = new NutriTime();
		BookingTable bt = new BookingTable();
		bt.setNutriId(nutriId);
		bt.setNutriName(nutriName);
		bt.setDate(formatdate);
		nt.setNutriId(nutriId);
		nt.setName(nutriName);
		nt.setDate(formatdate);
		nt.setTime(nutritime);
		m.addAttribute("thisTime", thisTimeBooking);
		thisTimeBooking.put("thisDate", formatdate);
		Map<Integer, String> timeMap = new TreeMap<>();
		for (int i = 0; i < nService.timetemp(nutritime).size(); i++) {
			timeMap.put(Integer.valueOf(i), nService.mapvalue(Integer.parseInt(nService.timetemp(nutritime).get(i))));
			if (bService.checkBookingIfStatus(nutriName, formatdate,
					nService.mapvalue(Integer.parseInt(nService.timetemp(nutritime).get(i))))) {
				errors.put("status", "有已預約或者已取消狀態,請查詢課表");
				return "booking";
			}
		}
		m.addAttribute("timeAll", timeMap);

		if (nService.checkDate(nt)) {
			nService.update(nt);
			bService.delete(bt);
			for (int i = 0; i < nService.timetemp(nutritime).size(); i++) {
				bt.setEachTime(nService.mapvalue(Integer.parseInt(nService.timetemp(nutritime).get(i))));
				bService.insertinto(bt);
			}

			return "bookingtimeresult";
		}

		nt.setNutriId(nutriId);
		nt.setName(nutriName);
		nt.setDate(nutridate);
		nt.setTime(nutritime);
		nService.insertinto(nt);
		for (int i = 0; i < nService.timetemp(nutritime).size(); i++) {
			bt.setEachTime(nService.mapvalue(Integer.parseInt(nService.timetemp(nutritime).get(i))));
			bService.insertinto(bt);
		}
		return "bookingtimeresult";
	}

	@RequestMapping(path = { "/bookingAgain.controller" })
	public String reBooking() {
		return "booking";
	}
}
