package controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import model.Member;
import model.MemberService;

@Controller
@SessionAttributes(names = { "user" })
public class MemberDataController {

	private MemberService memberService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/goshowMembers.controller", method = RequestMethod.POST)
	public String updateMembers(@SessionAttribute(name = "user") String mum,
			@RequestParam(name = "m_password") String mpwd, @RequestParam(name = "m_fullname") String mf,
			@RequestParam(name = "m_nickname") String mn,
//			@RequestParam(name = "m_idcard") String mcard,
			@RequestParam(name = "m_sex") String ms, @RequestParam(name = "m_birthday") String mbd,
			@RequestParam(name = "m_height") String mh, @RequestParam(name = "m_weight") String mw,
			@RequestParam(name = "m_location") String ml, @RequestParam(name = "m_cellphone") String mp,
			@RequestParam(name = "m_email") String me,
	//		@RequestParam(name = "m_path") String mpath, 
			@RequestParam(name = "file0") MultipartFile file, HttpServletRequest req, Model m) throws Exception {

		
		Member upDate = new Member(mum, mpwd, mf, mn, ms, mbd, mh, mw, ml, mp, me);

		if(!file.isEmpty()) {
		
		String fileName = file.getOriginalFilename();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

    	String savePath = "D:\\DataSource\\workspace\\SpringWebWorkspace\\HealthFuture\\WebContent\\resources\\images\\" + fileName;
//		String savePath = "D://DataSource//workspace//SpringWebWorkspace//HealthFuture//WebContent//resources//images//" + fileName;

		file.transferTo(new File(savePath));

		FileInputStream is2 = new FileInputStream(savePath);
		byte[] data = new byte[is2.available()];
		is2.read(data);
		is2.close();

		upDate.setPhoto(data);
		upDate.setPath(savePath);
		
		memberService.updateMember(upDate);
		
		Map<String, String> show = new HashMap<String, String>();
		show.put("a", upDate.getUserAccount());
		show.put("b", upDate.getUserPwd());
		show.put("c", upDate.getFullName());
		show.put("d", upDate.getNickName());
		show.put("e", memberService.findByName(mum).getIdCard());
		show.put("f", upDate.getSex());
		show.put("g", upDate.getBirthday());
		show.put("h", upDate.getHeight());
		show.put("i", upDate.getWeight());
		show.put("j", upDate.getLocation());
		show.put("k", upDate.getCellphone());
		show.put("l", upDate.getEmail());
		show.put("m", upDate.getPath());

		m.addAttribute("list", show);
		Thread.sleep(4000);
		return "/Member/showMembers";
		
		} else {
			
		if(memberService.findByName(mum).getPath()!=null) {upDate.setPhoto(memberService.findByName(mum).getPhoto()) ;upDate.setPath(memberService.findByName(mum).getPath());}
		memberService.updateMember(upDate);

		Map<String, String> show = new HashMap<String, String>();
		show.put("a", upDate.getUserAccount());
		show.put("b", upDate.getUserPwd());
		show.put("c", upDate.getFullName());
		show.put("d", upDate.getNickName());
		show.put("e", memberService.findByName(mum).getIdCard());
		show.put("f", upDate.getSex());
		show.put("g", upDate.getBirthday());
		show.put("h", upDate.getHeight());
		show.put("i", upDate.getWeight());
		show.put("j", upDate.getLocation());
		show.put("k", upDate.getCellphone());
		show.put("l", upDate.getEmail());
		show.put("m", upDate.getPath());

		m.addAttribute("list", show);

		return "/Member/showMembers";
	}
}
}
