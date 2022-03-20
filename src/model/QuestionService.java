package model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {
	
	private QuestionDAO questionDAO;
	
	@Autowired
	public QuestionService(QuestionDAO questionDAO) {
		this.questionDAO=questionDAO;
	}
	
	public void insert(Question question) {
		questionDAO.insert(question);
		
	}


}
