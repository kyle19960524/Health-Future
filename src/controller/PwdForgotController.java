package controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.Member;
import model.MemberService;

@Controller
@SessionAttributes(names = { "errors" })
public class PwdForgotController {
	
	private MemberService service;

	@Autowired
	public PwdForgotController(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping(path = "/setForgot.controller")
	public String newRegister() {

		return "Member/PwdForgot";
	}
	
	@RequestMapping(path = "/pwdforgot.controller", method = RequestMethod.POST)
	public String processForgot(@RequestParam(name="m_useraccount") String m_useraccount,
							  @RequestParam(name="m_email") String m_email,
							  @RequestParam(name="m_idcard") String m_idcard, Model m) throws Exception {
		
		
					Member  users	= new Member(m_useraccount,m_email,m_idcard);
					Map<String, String> errors = new HashMap<String, String>();
					m.addAttribute("errors", errors);
					
					if(m_useraccount.trim().isEmpty()||m_email.trim().isEmpty()||m_idcard.trim().isEmpty()) {
						
						errors.put("inputdata", "資料都必須填寫");
						return "Member/PwdForgot";
						
					}else {
						if(service.checkmemberName(users)==false) {
							
							String n = Randompassword();
							String k=users.getEmail();
							String a=users.getUserAccount();
							String i=users.getIdCard();
							//System.out.println(n);
							System.out.println(a);
							System.out.println(k);
							System.out.println(i);
							
							users.setUserPwd(n);
							service.updatepassword(users);
							
						    sendemail(n,k);
						
							
							return"Member/PwdSkip1";
							
						}else {return "Member/PwdForgot";}
						
						}
		
		
	}

	
	
	
	
	public String Randompassword () {
		
		Random rd = new Random();
		String n = "";
		int getNum;
		int getNum1;
		do {
		getNum = Math.abs(rd.nextInt()) % 10 + 48;// 產生數字0-9的隨機數
		getNum1 = Math.abs(rd.nextInt())%26 + 97;//產生字母a-z的隨機數
		char num1 = (char) getNum;
		char num2 = (char) getNum1;
		String dn = Character.toString(num1);
		String dn1 = Character.toString(num2);
		if(Math.random()>0.5){
		n += dn;
		}else{
		n += dn1;
		}
		} while (n.length() < 8 );

		System.out.println(n);
		return n;
		
	}
	
	public void sendemail(String s,String mail) throws Exception {
		//寄信程式碼
		  String user = "eeit111team5@gmail.com";//user
	        String pwd = "Do!ng123";//password
	        String to= mail;
	        String from = "eeit111team5@gmail.com";//寄件人的email
	       
	        String host ="smtp.gmail.com" ;

	        String subject = "密碼變更通知信"; 
	        String body = "您的新密碼為:"+s+",請盡快更新您的密碼"+",此郵件由系統自動發送,請勿回信" ;

	        
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
