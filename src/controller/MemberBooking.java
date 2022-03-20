package controller;

import java.util.HashMap;
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
import model.UsersService;

@Controller
public class MemberBooking {
	private BookingTableService bService;
	private UsersService uService;

	@Autowired
	public MemberBooking(BookingTableService bService, UsersService uService) {
		this.bService = bService;
		this.uService = uService;
	}

	@RequestMapping(path = { "/memberbooking.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "dateAndtime") String[] dateAndtime,
			@SessionAttribute("nutriname") String nutriname, @SessionAttribute("memberfullname") String membefullName,
			@SessionAttribute("memberid") int memberId, @RequestParam(name = "targetToNutri") String targetToNutri,
			Model m) throws Exception {
		Map<String, String> errors = new HashMap<String, String>();
		Map<String, String> dateAndTime = new TreeMap<String, String>();

		m.addAttribute("errors", errors);
		if (dateAndtime[0].equals("0")) {
			errors.put("nochoose", "請至少選擇一個時間");
			return "formemberbooking";
		} else {
			int dateCount = 1;
			int findMemThisDateCount = 1;
			String date="";
			for (Object key : bService.dateAndtime(dateAndtime).keySet()) {
				System.out
						.println("Key : " + key.toString() + " Value : " + bService.dateAndtime(dateAndtime).get(key));
				
				if (bService.checkIfBookingDoubleCancel(membefullName, key.toString().substring(4),
						bService.dateAndtime(dateAndtime).get(key))) {
					errors.put("nodoublebookingcancel", "您已經取消此時間,請確認課表");
					return "formemberbooking";
				}

				if (bService.checkIfBookingDouble(membefullName, key.toString().substring(4),
						bService.dateAndtime(dateAndtime).get(key))) {
					errors.put("nodoublebooking", "您已經有重複預約的時間,請確認課表");
					return "formemberbooking";
				}
				System.out.println("日期:"+date);
				if(date.equals(key.toString().substring(4))) {
					dateCount+=1;
				}
				System.out.println("次數:"+dateCount);
				if(dateCount>2) {
					errors.put("bookingtoomuchinoneday","請一天不要預約超過兩次");
					return "formemberbooking";
				}
				date=key.toString().substring(4);
				if(bService.findThisMemberThisDateBookingSize(memberId,key.toString().substring(4))==2) {
					errors.put("bookingtoomuch2","您今天已經有兩筆預約囉,再多效果可能不佳唷");
					return "formemberbooking";
				}
				
				if(bService.findThisMemberThisDateBookingSize(memberId,key.toString().substring(4))==1) {
					findMemThisDateCount+=1;
					
				}
				
				if(findMemThisDateCount>2) {
					errors.put("bookingtoomuch1","您今天已經有一筆預約囉,上限兩筆唷,再多效果可能不佳唷");
					return "formemberbooking";
				}
			}
//				if(bService.checkBookingToomuch(membefullName))
			for (Object key : bService.dateAndtime(dateAndtime).keySet()) {
				dateAndTime.put(key.toString(), bService.dateAndtime(dateAndtime).get(key));
				m.addAttribute("date_Time", dateAndTime);
				String currentTSstr = String.valueOf(System.currentTimeMillis());
				System.out.println(currentTSstr);
				BookingTable bt = new BookingTable();
				bt.setMemId(memberId);
				bt.setMemName(membefullName);
				bt.setNutriName(nutriname);
				bt.setNutriId(uService.findByFullName(nutriname).getId());
				bt.setDate(key.toString().substring(4));
				bt.setEachTime(bService.dateAndtime(dateAndtime).get(key));
				bt.setChatroomid(currentTSstr);
				bt.setNote(targetToNutri);
				bt.setNotification("1");
				bService.update(bt);
				bService.SendMailToNutriBookingSuccess(bt);
			}
		}

		return "success";
	}

}
