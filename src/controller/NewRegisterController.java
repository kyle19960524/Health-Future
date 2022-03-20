package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import model.MemberService;
import model.Member;

@Controller
@SessionAttributes(names = { "member", "errors", "chgaccount", "user" })
public class NewRegisterController {

	private MemberService service;

	@Autowired
	public NewRegisterController(MemberService service) {
		this.service = service;
	}

	@RequestMapping(path = "/setRegister.controller")
	public String newRegister() {

		return "RegisterForm";
	}

	@RequestMapping(path = "/newRegister.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam(name = "m_useraccount") String m_useraccount,
			@RequestParam(name = "m_password") String m_password, @RequestParam(name = "m_fullname") String m_fullname,
			@RequestParam(name = "m_nickname") String m_nickname, @RequestParam(name = "m_idcard") String m_idcard,
			@RequestParam(name = "m_sex") String m_sex, @RequestParam(name = "m_birthday") String m_birthday,
			@RequestParam(name = "m_height") String m_height, @RequestParam(name = "m_weight") String m_weight,
			@RequestParam(name = "m_location") String m_location,
			@RequestParam(name = "m_cellphone") String m_cellphone, @RequestParam(name = "m_email") String m_email,
			@RequestParam(name = "myFiles") MultipartFile[] multipartfile,

			Model m, Object name) throws Exception {

		Member userN = new Member(m_useraccount, m_password, m_fullname, m_nickname, m_idcard, m_sex, m_birthday,
				m_height, m_weight, m_location, m_cellphone, m_email);
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (m_useraccount.trim().isEmpty() || m_password.trim().isEmpty() || m_fullname.trim().isEmpty()
				|| m_nickname.trim().isEmpty() || m_idcard.trim().isEmpty() || m_sex.trim().isEmpty()
				|| m_birthday.trim().isEmpty()) {
			errors.put("inputmsg", "＊欄位不能有空白，請重新輸入。");
			return "RegisterForm";
		} else if (m_useraccount.trim().isEmpty() || m_useraccount.trim().length() <= 5) {
			errors.put("inputmsg", "帳號長度必須6～10碼");
			return "RegisterForm";
		} else if (m_password.trim().isEmpty() || m_password.trim().length() <= 5) {
			errors.put("inputmsg", "密碼長度必須6～10碼");
			return "RegisterForm";
		} else if (m_fullname.trim().isEmpty() || m_fullname.trim().length() <= 1) {
			errors.put("inputmsg", "姓名填寫不正確");
			return "RegisterForm";
		} else if (m_idcard.trim().isEmpty() || m_idcard.trim().length() <= 9) {
			errors.put("inputmsg", "身分證字號填寫不正確");
			return "RegisterForm";
		} else if (m_birthday.trim().isEmpty() || m_birthday.trim().length() <= 7) {
			errors.put("inputmsg", "出生年月日填寫不完整");
			return "RegisterForm";
		} else {
			if (service.checkmemberName(userN)) {

				for (MultipartFile mf : multipartfile) {
					String fileName = mf.getOriginalFilename();

					System.out.println("fileName=" + fileName);

					HttpHeaders headers = new HttpHeaders();
					headers.setContentType(MediaType.IMAGE_JPEG);
					
					String savePath = "D:\\DataSource\\workspace\\SpringWebWorkspace\\HealthFuture\\WebContent\\resources\\images\\" + fileName;
					///String savePath = "D://DataSource//workspace//SpringWebWorkspace//HealthFuture//WebContent//resources//images//" + fileName;
					List<String> listImagePath = new ArrayList<String>();

					mf.transferTo(new File(savePath));

					FileInputStream is1 = new FileInputStream(savePath);
					byte[] data = new byte[is1.available()];
					is1.read(data);
					is1.close();

					if (userN.getPhoto() == null) {
						userN.setPhoto(data);
						userN.setPath(savePath);
					}

					listImagePath.add(savePath);
					userN.setFileName(fileName);
				}
				
				service.insertinto(userN);

				m.addAttribute("member", name);
				return "RegisterSuccess";
			} else {
				errors.put("inputmsg", "帳號已被申請過");
				return "RegisterForm";
			}

		}

	}

	@RequestMapping(path = "checkNewAccount.controller", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public boolean checkNewAccount(@RequestParam(name = "m_useraccount") String m_useraccount) {

		Member userA = new Member(m_useraccount);

		boolean result = service.checkmemberName(userA);
		return result;

	}
}
