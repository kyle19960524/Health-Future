package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BackService {

	private BackDAO uDao;
	
	@Autowired
	public BackService(BackDAO uDao) {
		this.uDao = uDao;
	}
	
	public boolean checkLogin(Backuser Backuser) {
		return uDao.checkLogin(Backuser);
	}
	
	
	public List<Users> find() {
		return uDao.find();
	}
	
	
	public void changestatus(int id) {
		uDao.changestatus(id);
	}
	
	public List<Users> getemail(int id) {
		
		return uDao.getemail(id);
	}

	
	public List<Question> getQuestion(){
		return uDao.getQuestion();
	}
	
	public void changeQuestionstatus(int id) {
		uDao.changeQuestionstatus(id);
	}
	
	public void insertAccount(String account,int id) {
		uDao.insertAccount(account, id);
	}
	
	public List<Question> status1Question() {
       return uDao.status1Question();
	}
	
}
