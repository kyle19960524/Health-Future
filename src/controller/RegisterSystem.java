package controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import model.Users;
import model.UsersService;

@Controller
@SessionAttributes(names = { "loginStatusCertified", "member", "errors","path", })
public class RegisterSystem {
	@Autowired
	private UsersService service;
	

	@Autowired
	
	public RegisterSystem(UsersService service) {
		this.service = service;
	}

	@RequestMapping(path = "/register.controller", method = RequestMethod.POST)
	@ResponseBody
	public void processAction(
			@RequestParam(name = "account") String account, 
			@RequestParam(name = "pwd") String pwd,
			@RequestParam(name = "name") String name,
			@RequestParam(name = "gender") String gender,  
			@RequestParam(name="education") String  education,
			@RequestParam(name="experience") String  experience,
			@RequestParam(name="phone") String phone,
	        @RequestParam(name="cellphone") String cellphone,
	        @RequestParam(name="email") String email,
	        @RequestParam(name="date1") String birthday,      
	        @RequestParam(name="identity") String identity,
	        @RequestParam(name = "myFiles") MultipartFile[] multipartfile,

			@RequestParam(name = "livingin") String livingin, Model m,HttpServletRequest request,HttpServletResponse response) throws Exception {
	
		Users userB = new Users(account, pwd, name, gender,education,experience, phone, cellphone,email,birthday ,identity,  livingin );
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
			
		
		
		
		if (account.trim().isEmpty() || pwd.trim().isEmpty() || name.trim().isEmpty() 
				|| gender == null||education.trim().isEmpty()||experience.trim().isEmpty()||phone.trim().isEmpty()
				||cellphone.trim().isEmpty()||email.trim().isEmpty()
				||birthday.trim().isEmpty()||identity.trim().isEmpty()
				
				|| livingin == null  ) {
			errors.put("inputdata", "資料都必須填寫");
			response.sendRedirect("/HealthFuture/pages/FormRegister.jsp");
		} else {
			
			for( MultipartFile mf:  multipartfile) {
				String fileName = mf.getOriginalFilename();	
				
				
				System.out.println("fileName=" + fileName);

				
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(MediaType.IMAGE_JPEG);
				String savePath = "D:\\DataSource\\workspace\\SpringWebWorkspace\\HealthFuture\\WebContent\\resources\\images\\" + fileName;
				//String savePath = "D://DataSource//workspace//SpringWebWorkspace//HealthFuture//WebContent//resources//images//" + fileName;
				List<String> listImagePath=new ArrayList<String>();
				
				
				System.out.println("savePath=" + savePath);

				m.addAttribute("path", savePath);
				
				mf.transferTo(new File(savePath));

				
				

					FileInputStream is1 = new FileInputStream(savePath);
					byte[] data = new byte[is1.available()];
					is1.read(data);
					is1.close();
					
					if(userB.getPhoto()==null) {userB.setPhoto(data) ;userB.setPath1(savePath);}
				
					else {userB.setCertific(data);userB.setPath2(savePath);}

					listImagePath.add(savePath);
					
					service.insertinto(userB);		
					
					
			}
				
			
			
				m.addAttribute("loginStatusCertified", false);
				m.addAttribute("member", name);
				
				
				response.sendRedirect("/HealthFuture/pages/mainPage.jsp");

		}
		
	}
	
	
	

	@RequestMapping(path = "/goRegister.controller")
	public String goRegister() {

		return "FormRegister";

	}
	
	
}
