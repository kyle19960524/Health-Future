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
@SessionAttributes(names= {})
public class Detail_N {

	private UsersService service;

	@Autowired
	public Detail_N(UsersService service) {
		this.service = service;
	}
	
	@RequestMapping(path="/Adele.controller")
	public String Adele(Model m) {
		
		m.addAttribute("name","Adele");
		m.addAttribute("education","	台北醫學大學保健營養系 碩士");
		m.addAttribute("experience","(1)羅東博愛醫院營養室組長"+"\r"+ " (2)羅東博愛醫院臨床營養師" );
		m.addAttribute("email","zapdos83115@gmail.com");
		m.addAttribute("address","台北市");
		m.addAttribute("path","resources/images/dietitian/AAAAA.jpeg");
		return "Detail" ;
	}
	
	@RequestMapping(path="/Drake.controller")
	public String Drake(Model m) {
		
		m.addAttribute("name","Drake");
		m.addAttribute("education","	中山醫學大學營養學系");
		m.addAttribute("experience","(1)臺北榮民總醫院臨床營養師"+"\r"+ " (2)臺北市立聯合醫院仁愛院區營養師" );
		m.addAttribute("email","xxxxx@gmail.com");
		m.addAttribute("address","桃園市");
		m.addAttribute("path","resources/images/dietitian/BBBBB.jpeg");
		return "Detail" ;
	}
	
	@RequestMapping(path="/Rihanna.controller")
	public String Rihanna(Model m) {
		
		m.addAttribute("name","Rihanna");
		m.addAttribute("education","	實踐家政經濟專科學校食品營養科");
		m.addAttribute("experience","(1)醫療財團法人門諾醫院營養師"+"\r"+ " (2)花蓮慈濟醫院營養組組長" );
		m.addAttribute("email","xxxxx@gmail.com");
		m.addAttribute("address","台東縣");
		m.addAttribute("path","resources/images/dietitian/CCCCC.jpeg");
		return "Detail" ;
	}
	
	
	@RequestMapping(path="/NewNutri.controller")
	public String NewNutri(@RequestParam int id, Model m) {
		
		List<Users> thisone = service.newNutri(id);
		
		m.addAttribute("name",thisone.get(0).getName()); 
		m.addAttribute("edu",thisone.get(0).getEducation()); 
		m.addAttribute("exp",thisone.get(0).getExperience()); 
		m.addAttribute("email",thisone.get(0).getEmail()); 
		m.addAttribute("address",thisone.get(0).getArea()); 
		m.addAttribute("img",thisone.get(0).getPath1()); 
		
		return "NewNutri";
	}
	

}
