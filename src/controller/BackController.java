package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.BackService;
import model.Backuser;
import model.Question;
import model.Users;
@Controller
@SessionAttributes(names = { "useraccount","photohead","A","all"})
public class BackController {

	private BackService service;
	
	@Autowired
	public BackController(BackService service) {
		this.service = service;
	}
	
	@RequestMapping(path = "/backq.controller", method=RequestMethod.POST)
	public String Login(@RequestParam(name="baccount") String account,
			@RequestParam(name="bpwd") String pwd ,Model m) {
		
	 	 Backuser A = new Backuser(account,pwd);  
		
		if (service.checkLogin(A)) {
			m.addAttribute("useraccount", A.getBackaccount());
			return "back";
		}else {return "backLogin";}
		
		
		
	}
	
	@RequestMapping(path="/newNutri.controller")
	public String NewNutri(Model m) throws IOException {
		
		
		
		List<Users> A = service.find();
		//System.out.println(A.get(0).getAccount());
		
		m.addAttribute("A",A);
		
		
	

		return"backNutri";
	}
	
	
	@RequestMapping(path="/status1.controller")
	public String status(@RequestParam(name="newNutri")  int[] newNutri ,Model m) throws Exception {
		
		if(newNutri==null) {return "back";}
		for(int id : newNutri) {
			 String email = service.getemail(id).get(0).getEmail();
			 String name=service.getemail(id).get(0).getName();
			//service.changestatus(id);
		    sendemail(email,id,name);	
		}
		
		return"back";
	}
	
	@RequestMapping(value="turntosafv3552626tyhwb32611zdfhcontroller/{id}")
	
	public String email(@PathVariable int id) {
		
		service.changestatus(id);
		return"usable";
	}
	
	
	
	
	
	@RequestMapping(value="/turntoBackQuestion.controller")
	public String Question(Model m) {
		
		List<Question> B= service.getQuestion();
		m.addAttribute("B",B);
		
		
		return "backQuestion";
	}
	
	
	@RequestMapping(value="/questionstatus.controller")
	public String QuestionStatus(@RequestParam(name="questionstatus") int[] id,Model m) {
		
		 String account = (String)m.getAttribute("useraccount");
		
		for(int status:id) {
		service.changeQuestionstatus(status);
		service.insertAccount(account, status);
		}
		return "back";
	}
	
	@RequestMapping(value="/turntoback.controller")
public String back() {
	
	return "back";
}

	@RequestMapping(value="/turntoquestion1.controller")
public String solveProblem(Model m) {
	
	List<Question> status1 = service.status1Question();
	
	m.addAttribute("Qstatus1",status1);
	
	return "backAnswerQuestion";
}
	
	
	@RequestMapping(value="/turntoshopping.controller")
	public String shopping () {
		return "shopping_handle";
	}

	public void sendemail(String mail,int id,String name) throws Exception {
		//寄信程式碼
		
		
		
		  String user = "eeit111team5@gmail.com";//user
	        String pwd = "Do!ng123";//password
	        String to= mail;
	        String from = "eeit111team5@gmail.com";//寄件人的email
	       
	        String host ="smtp.gmail.com" ;

	        String subject = "認證完成通知信"; 
	        String body = name+",您好,您在HealthFuture註冊的營養師帳號已經通過認證,請點選以下網址開通帳號:"+"http://localhost:8080/HealthFuture/turntosafv3552626tyhwb32611zdfhcontroller/" +id;
//	        long time = new Date().getTime();
	        
	        Properties properties = System.getProperties();
	       
	        properties.setProperty("mail.transport.protocol", "smtp");						        
	        properties.setProperty("mail.smtp.host", host);
	        properties.setProperty("mail.smtp.port", "465");
	        
	        properties.put("mail.smtp.auth", "true");						      
	        properties.put("mail.smtp.ssl.enable", "true");
	        properties.put("mail.smtp.starttls.enable", "true");

	      
	        Session mailSession = Session.getInstance(properties, new Authenticator(){
	            protected PasswordAuthentication getPasswordAuthentication(){
	                 return new PasswordAuthentication(user,pwd);
	            }
	        });  
	       
	            MimeMessage message = new MimeMessage(mailSession);
	            
	            message.setFrom(new InternetAddress(from)); 
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
	            message.setSubject(subject); 

	    
	            Multipart multipart = new MimeMultipart();
	            
	            BodyPart messageBodyPart = new MimeBodyPart();      
	            messageBodyPart.setText(body);
	            multipart.addBodyPart(messageBodyPart);   
	           
	          
	            
	            message.setContent(multipart);            
	            Transport transport = mailSession.getTransport("smtp");
	            transport.connect(host ,user, pwd);
	                     
	            transport.sendMessage(message,message.getAllRecipients());
	            
	            System.out.println("發送成功");
	            
	            transport.close();
	            
	       

		//寄信程式碼結束
		
	}
	
	
}
