
package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.Users;
import model.UsersService;

@Controller
@SessionAttributes(names = { "x1","x2","x3","x4","mem.memberId","mem.nutriId","nutr.memberId","nutr.nutriId","all","mem_chatroomid","nutri_chatroomid","btid" })
public class turnPage {
	private UsersService service;
	
	 @Autowired
		public turnPage(UsersService service) {
			this.service = service;
		}
		

	@RequestMapping(path = "/turntoLogin.controller")
	public String login () {
		return "Login";
	}
	
	@RequestMapping(path = "/turntoRegister.controller")
	public String register () {
		return "FormRegister";
	}
	
	@RequestMapping(path = "/turntoForget.controller")
	public String forget () {
		return "Forgetpwd";
	}
	
	@RequestMapping(path = "/turntoChange.controller")
	public String change () {
		return "changePwd1";
	}
	

	@RequestMapping(path = "/turntoIntroduce.controller")
	public String introduce (Model m) {
		List<Users> all = service.findAll();
		m.addAttribute("all",all);
		return "introduse_N";
	}
	
	@RequestMapping(path = "/turntoMainPage.controller")
	public String mainPage () {
		return "mainPage";
	}
	
	@RequestMapping(path = "/turntomyReservationM.controller")
	public String myReservation ( @RequestParam(name="memId") int memId,@RequestParam(name="nutriId") int nutriId,@RequestParam(name="memchatroomid") String chatroomid,Model m ) {
		m.addAttribute("mem.memberId", memId);
		m.addAttribute("mem.nutriId", nutriId);
		m.addAttribute("mem_chatroomid", chatroomid);
		//,@RequestParam(name="mem.chatroomid") int chatroomid 
		return "myReservationM";
	}
	
	@RequestMapping(path = "/turntomyReservationN.controller")
	public String myReservation2 (@RequestParam(name="memId") int memId,@RequestParam(name="nutriId") int nutriId,@RequestParam(name="nutrichatroomid") String chatroomid, Model m) {
		m.addAttribute("nutr.memberId", memId);
		m.addAttribute("nutr.nutriId", nutriId);
		m.addAttribute("nutri_chatroomid", chatroomid);
		return "myReservationN";
	}
	
	@RequestMapping(path = "/turntoBmi.controller")
	public String Bmi() {
		return "Bmi";
	}
	
	
	@RequestMapping(path = "/turntoChatroomM.controller")
	public String Chatroom() {
		
		return "chatroomM";
	}
	
	@RequestMapping(path = "/turntoChatroomN.controller")
	public String Chatroom2() {
		return "chatroomN";
	}
	
	@RequestMapping(path = "/turntoChooseLogin.controller")
	public String turntoChooseLogin() {
		return "ChooseLogin";
	}
	@RequestMapping(path = "/turntoContactUs.controller")
	public String ContactUs(Model next) {
		next.addAttribute("x1", Math.floor(Math.random()*10));
		next.addAttribute("x2", Math.floor(Math.random()*10));
		next.addAttribute("x3", Math.floor(Math.random()*10));
		next.addAttribute("x4", Math.floor(Math.random()*10));
		
		return "contactUs";
	}
	@RequestMapping(path = "/turntoNutriAvailableTime.controller")
	public String NutriAvailableTime() {
		return "booking";
	}
	
	@RequestMapping(path = "/turntoSearchNutriAvailableTime.controller")
	public String SearchNutriAvailableTime() {
		return "searchavailabletime";
	}
	
	@RequestMapping(path = "/turntoSearchNutri.controller")
	public String SearchNutri() {
		return "searchnutri";
	}
	@RequestMapping(path = "/turntoForgot.controller")
	public String forgot () {
		return "memberLogin";
	}
	@RequestMapping(path = "/turntoMember.controller")
	public String Member () {
		return "memberLogin";
	}
	
	@RequestMapping(path = "/turntoshopMain.controller")
	public String shopMain() {
		return "shopmain";
	}
	
	@RequestMapping(path = "/turntoshopToReserv.controller")
	public String shopToReserv(@RequestParam(name = "btid") int bookingtableid,
			Model m) {
		m.addAttribute("btid",bookingtableid);
		return "shopToReserv";
	}
	
	@RequestMapping(value = "/turntoshopRecord.controller")
    public String shopping_record(){
        return "shopping_record";
    }
	
	@RequestMapping(value = "/turntoshopCar.controller")
    public String shopping_car(){
        return "shopping_car";
    }
	
	@RequestMapping(value = "/turntoproductDetail.controller")
    public String productDetail(){
        return "productdetail";
    }
	
	@RequestMapping(path = "/turntoAbout.controller")
	public String aboutUs() {
		return "AboutUs";
	}
}
