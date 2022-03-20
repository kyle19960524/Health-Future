package controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.BookingTable;
import model.BookingTableService;
import model.NutriTimeService;

@Controller
@SessionAttributes(names = { "breakfast1","breakfast2","breakfast3","lunch1","lunch2","lunch3" ,"dinner1","dinner2","dinner3" ,"special1","special2","special3"  })
public class BookingTimeTableSystem {
	private BookingTableService bService;
	private NutriTimeService nService;

	@Autowired
	public BookingTimeTableSystem(BookingTableService bService, NutriTimeService nService) {
		this.bService = bService;
		this.nService = nService;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(path = { "/timeTableForNutri.controller" })
	public String timeTableForNutrition(@SessionAttribute(name = "d_id") int nutriId, Model m) throws Exception {
		Date now = new Date();
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(today.format(now));
		List<BookingTable> notsort = bService.findByNutriIdAndAfterToday(nutriId, today.format(now));
		Collections.sort(notsort, bService);//排序日期
		m.addAttribute("nutriTable", notsort);
		return "timetablefornutri";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(path = { "/timeTableForMem.controller" })
	public String timeTableForMember(@SessionAttribute(name = "memberid") int memId, Model m) throws Exception {
		Date now = new Date();
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(today.format(now));
		List<BookingTable> notsort = bService.findByMemIdAndAfterToday(memId, today.format(now));
		Collections.sort(notsort, bService);//排序日期
		m.addAttribute("memTable",notsort);
		return "timetableformem";
	}

	@RequestMapping(path = { "/cancelBookingForNutri.controller" }, method = { RequestMethod.POST })
	public String cancelTimeTableForNutrition(@SessionAttribute(name = "d_id") int nutriId,
			@RequestParam(name = "note",required = false) String notetomem, @RequestParam(name = "bookingtbleid") int bookingtableid,
			@RequestParam(name = "status") int bookingstatus, @RequestParam(name = "date") String date,
			@RequestParam(name = "time") String time, Model m) throws Exception {
		System.out.println(notetomem);
		String oldTime = nService.searchbyIdAndDate(nutriId, date);
		String deleteTime = "," + time.substring(0, 2);
		String newTime = oldTime.replace(deleteTime, "");
		if (bookingstatus != 0) {
			bService.cancelbookingAndnoteToMem(bookingtableid, notetomem);
			nService.updateNewTime(nutriId, date, newTime);
			bService.SendMailToMemBookingCancel(bService.findById(bookingtableid));
			return "mainPage";
		} else {
			bService.deletebyId(bookingtableid);
			nService.updateNewTime(nutriId, date, newTime);
			return "mainPage";
		}

	}

	@RequestMapping(path = { "/cancelBookingForMem.controller" }, method = { RequestMethod.POST })
	public String cancelTimeTableForMem(@SessionAttribute(name = "memberid") int memId,
			@RequestParam(name = "bookingtbleid") int bookingtableid, @RequestParam(name = "note", required = false) String notetonutri,
			Model m) {
		System.out.println(notetonutri);
		bService.changeStatusToThree(bookingtableid, notetonutri);
		bService.SendMailToNutriBookingCancel(bService.findById(bookingtableid));
		return "mainPage";
	}
	
	//andy新增方法
	@RequestMapping( "insertRecipe" )
	@ResponseBody
	public void insertRecipe(
			 @RequestParam(name = "extra1") String extra1,
			 @RequestParam(name = "extra2") String extra2,
			 @RequestParam(name = "extra3") String extra3,
			 @RequestParam(name = "breakfast1") String breakfast1,
			 @RequestParam(name = "breakfast2") String breakfast2,
			 @RequestParam(name = "breakfast3") String breakfast3,
			 @RequestParam(name = "lunch1") String lunch1,
			 @RequestParam(name = "lunch2") String lunch2,
			 @RequestParam(name = "lunch3") String lunch3,
			 @RequestParam(name = "dinner1") String dinner1,
			 @RequestParam(name = "dinner2") String dinner2,
			 @RequestParam(name = "dinner3") String dinner3,
			 @RequestParam(name = "chatroomid") String chatroomid) {
		BookingTable bt = new BookingTable();
		bt.setBreakfast1(breakfast1);
		bt.setBreakfast2(breakfast2);
		bt.setBreakfast3(breakfast3);
		
		bt.setLunch1(lunch1);
		bt.setLunch2(lunch2);
		bt.setLunch3(lunch3);
		
		bt.setDinner1(dinner1);
		bt.setDinner2(dinner2);
		bt.setDinner3(dinner3);
		
		bt.setSpecial1(extra1);
		bt.setSpecial2(extra2);
		bt.setSpecial3(extra3);
		
		bt.setChatroomid(chatroomid);
	
		
		bService.insertRecipe(bt);
	}
	
	
	
	@RequestMapping("selectRecipe")
	@ResponseBody
	public BookingTable selectRecipe(@RequestParam(name = "chatroomid")String chatroomid) {

	 BookingTable bt = new BookingTable();
	 bt.setChatroomid(chatroomid);
	 System.out.println(bt.getBreakfast1());
	
	 
	 return bService.selectRecipe(bt);
	}
	
	
}

//System.out.println(list.getBreakfast1());
//m.addAttribute("breakfast1", list.getBreakfast1());
//m.addAttribute("breakfast2", list.getBreakfast2());
//m.addAttribute("breakfast3", list.getBreakfast3());
//
//m.addAttribute("lunch1", list.getLunch1());
//m.addAttribute("lunch2", list.getLunch2());
//m.addAttribute("lunch3", list.getLunch3());
//
//m.addAttribute("dinner1", list.getDinner1());
//m.addAttribute("dinner2", list.getDinner2());
//m.addAttribute("dinner3", list.getDinner3());
//
//m.addAttribute("special1", list.getSpecial1());
//m.addAttribute("special2", list.getSpecial2());
//m.addAttribute("special3", list.getSpecial3());
