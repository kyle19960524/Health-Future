package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.BookingTable;
import model.BookingTableService;
import model.MessageTable;
import model.UsersService;
import util.TimeCount;

@Controller
@SessionAttributes(names = { "all", "nutriname" })
public class MemberSearchNutri {
	private BookingTableService bService;
	private UsersService nService;

	@Autowired
	public MemberSearchNutri(BookingTableService bService, UsersService nService) {
		this.bService = bService;
		this.nService = nService;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(path = { "/searchnutri.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "name") String name, @RequestParam(name = "nutridate") String from,
			@RequestParam(name = "nutridate2") String to, Model m) {
		Map<String, String> errors = new HashMap<>();
		m.addAttribute("errors", errors);
		if (from.length() == 0 && to.length() == 0 && name.length() == 0) {
			errors.put("fromAndtoAndName", "請輸入姓名並選擇日期區間");
			return "searchnutri";
		}

		if (from.length() == 0 && to.length() == 0) {
			errors.put("fromAndto", "請選擇日期區間");
			return "searchnutri";
		}

		if (from.length() == 0 && name.length() == 0) {
			errors.put("fromAndName", "請輸入姓名並選擇開始日期");
			return "searchnutri";
		}

		if (to.length() == 0 && name.length() == 0) {
			errors.put("toAndName", "請輸入姓名並選擇結束日期");
			return "searchnutri";
		}

		if (from.length() == 0) {
			errors.put("from", "請選擇開始日期");
			return "searchnutri";
		}
		if (to.length() == 0) {
			errors.put("to", "請選擇結束日期");
			return "searchnutri";
		}

		if (name.length() == 0) {
			errors.put("name", "請輸入姓名");
			return "searchnutri";
		}
		if (nService.checkuserFullName(name)) {
			if (bService.searchName(name)) {
				List<BookingTable> notsort = bService.find(name, from, to);
				Collections.sort(notsort, bService);// 排序日期
				for (int i = 0; i < notsort.size(); i++) {
					BookingTable temp = notsort.get(i);
					System.out.print(temp.getDate() + "," + temp.getEachTime() + "\n");
				}

				Map<String, String> all = new TreeMap<String, String>();
				for (int i = 0; i < notsort.size(); i++) {
					if (i < 9) {
						all.put("0" + (i + 1) + ". " + notsort.get(i).getDate(), notsort.get(i).getEachTime());
					} else {
						all.put(i + 1 + ". " + notsort.get(i).getDate(), notsort.get(i).getEachTime());
					}
				}

				m.addAttribute("all", all);
				m.addAttribute("nutriname", name);
				return "formemberbooking";
			} else {
				errors.put("foundNutriNoTime", "此營養師尚無提供預約時間");
				return "searchnutri";
			}
		} else {
			errors.put("foundNutri", "找無此營養師");
			return "searchnutri";
		}
	}

	@RequestMapping(path = { "/memberSearchNutriAgain.controller" })
	public String reBooking() {
		return "searchnutri";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(path = { "/clicknutri.controller" }, method = { RequestMethod.POST })
	public String clickButtonForEveryOneSeeBookingTable(@RequestParam(name = "nutriName") String nutriName, Model m) {
		System.out.println(nutriName);
		Date date = new Date();
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today = bartDateFormat.format(date);
		List<BookingTable> notsort = bService.findNutriBookingTime(nutriName, today);
		Map<String, Integer> emptyStatus = new HashMap<String, Integer>();
		if (notsort.size() == 0) {
			Map<String, String> nullBookingTime = new HashMap<String, String>();
			nullBookingTime.put("nullBookingTime", "營養師接下來七天都沒有給預約時間唷!");
			emptyStatus.put("有沒有", 0);
			m.addAttribute("nothing", emptyStatus);
			m.addAttribute("emptyTable", nullBookingTime);
			return "foreveryoneseebooking";
		} else {
			Collections.sort(notsort, bService);// 排序日期
			for (int i = 0; i < notsort.size(); i++) {
				BookingTable temp = notsort.get(i);
				System.out.print(temp.getDate() + "," + temp.getEachTime() + "\n");
			}
			Map<String, String> all = new TreeMap<String, String>();
			for (int i = 0; i < notsort.size(); i++) {
				if (i < 9) {
					all.put("0" + (i + 1) + ". " + notsort.get(i).getDate(), notsort.get(i).getEachTime());
				} else {
					all.put(i + 1 + ". " + notsort.get(i).getDate(), notsort.get(i).getEachTime());
				}
			}
			emptyStatus.put("有沒有", 1);
			m.addAttribute("nothing", emptyStatus);
			m.addAttribute("all", all);
			m.addAttribute("nutriname", nutriName);
			return "foreveryoneseebooking";
		}
	}

	@ResponseBody
	@RequestMapping("/searchNutriAjax.controller")
	public List<String> returnNutriName(@RequestParam(name = "nutriName") String nutriName) throws Exception {
		List<String> nameList = new ArrayList<String>();
		for (int i = 0; i < nService.findByNameFuzzyQuery(nutriName).size(); i++) {
			System.out.println(nService.findByNameFuzzyQuery(nutriName).get(i).getName());
			nameList.add(nService.findByNameFuzzyQuery(nutriName).get(i).getName());
		}
		
		return nameList;
	}
}
