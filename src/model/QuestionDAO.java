package model;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAO {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public QuestionDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory ) {
		this.sessionFactory=sessionFactory;
	};
	
	
	
	public void insert(Question question) {
		Timestamp  datetime = new Timestamp(new Date().getTime());
		Question qn = new Question();
		qn.setCustomerName(question.getCustomerName());
		qn.setCustomerEmail(question.getCustomerEmail());
		qn.setQuestionContent(question.getQuestionContent());
		qn.setStatus(0);
		qn.setquestionTime(datetime);
		
	
		
		sessionFactory.getCurrentSession().save(qn);
	}
	
	
	

}
