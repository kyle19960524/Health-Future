package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.Question;
import model.QuestionService;

@Controller
public class questionController {
	private QuestionService questionService;
	
	
	@Autowired
	public questionController(QuestionService questionService) {
		this.questionService=questionService;
	}
	
	
	@RequestMapping(path = { "/sendQuestion.controller" }, method = { RequestMethod.POST })
	public String prossesAction(@RequestParam(name = "name") String name,
			                    @RequestParam(name = "email") String email,
			                    @RequestParam(name = "selectEmail") int selectEmail,
	                            @RequestParam(name = "questionContent") String questionContent,
	                            HttpServletRequest request,HttpServletResponse response) {
		Question question = new Question();
		
		if(selectEmail==1) {
			email=email+"@gmail.com";
		}else if(selectEmail==2) {
			email=email+"@yahoo.com.tw";
		}else if(selectEmail==3) {
			email=email+"@hotmail.com";
		}else {
			
		}
		question.setCustomerName(name);
		question.setCustomerEmail(email);
	    question.setQuestionContent(questionContent);
	   
	    
	    questionService.insert(question);
		
		
		return "QuestionSuccess";
	}
}
