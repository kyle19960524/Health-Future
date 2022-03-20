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
import org.springframework.web.bind.annotation.SessionAttributes;

import model.BookingTable;
import model.BookingTableService;
import model.NutriTime;
import model.NutriTimeService;

@Controller
@SessionAttributes(names = { "dateAndtime" })
public class SearchDateSystem {
	private NutriTimeService nService;
	private BookingTableService bService;

	@Autowired
	public SearchDateSystem(NutriTimeService nService, BookingTableService bService) {
		this.nService = nService;
		this.bService = bService;
	}

	@RequestMapping(path = { "/searchdate.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "nutridate") String from,
			@RequestParam(name = "nutridate2") String to, @SessionAttribute(name = "d_name") String nutriName,
			Model m) {
		Map<String, String> errors = new HashMap<>();
		m.addAttribute("errors", errors);
		if (from.length() == 0 && to.length() == 0) {
			errors.put("fromAndto", "請選擇日期區間");
			return "searchavailabletime";
		}
		if (from.length() == 0) {
			errors.put("from", "請選擇開始日期");
			return "searchavailabletime";
		}
		if (to.length() == 0) {
			errors.put("to", "請選擇結束日期");
			return "searchavailabletime";
		}
		Map<String, String> date = new TreeMap<>();
		List<NutriTime> ntDs = nService.datePlus(from, to, nutriName);
		m.addAttribute("dateAndtime", date);

		for (int j = 0; j < ntDs.size(); j++) {
			List<String> eachdaytime = nService.timetemp(((NutriTime) ntDs.get(j)).getTime());
			int eachdaytimesize = eachdaytime.size();
			String oneday = "";
			for (int i = 0; i < eachdaytimesize; i++)
				oneday = String.valueOf(oneday) + nService.mapvalue(Integer.parseInt(eachdaytime.get(i))) + "\n";
			System.out.println(oneday);
			date.put(((NutriTime) ntDs.get(j)).getDate(), oneday);
		}
		return "searchavailabletimeresult";
	}

	@RequestMapping(path = { "/canceldate.controller" }, method = { RequestMethod.POST })
	public String CancelAvailableTime(@RequestParam(name = "date") String date,
			@SessionAttribute(name = "d_name") String nutriName, Model m) {
		Map<String, String> message = new HashMap<>();
		m.addAttribute("message", message);
		BookingTable temp = new BookingTable();
		temp.setNutriName(nutriName);
		temp.setDate(date);
		if (bService.findForCancel(nutriName, date)) {
			nService.delete(nutriName, date);
			bService.delete(temp);
			message.put("success", "取消成功,請重新查詢");
			return "searchavailabletime";
		} else {
			message.put("status_clash","有已預約顧客,或已取消預約,請查詢你的課表");
			return "searchavailabletimeresult";
		}
	}
}
