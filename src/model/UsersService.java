package model;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersService {
	private UsersDAO uDao;

	@Autowired
	public UsersService(UsersDAO uDao) {
		this.uDao = uDao;
	}

	public boolean checkLogin(Users users) {
		return uDao.checkLogin(users);
	}

	public boolean checkuserName(Users users) {
		return uDao.checkuserName(users);
	}

	public boolean checkuserFullName(String nutriName) {
		return uDao.checkuserFullName(nutriName);
	}

	public void insertinto(Users users) {
		uDao.insertinto(users);
	}

	public void updatepassword(Users users) {
		uDao.updatepassword(users);
	}

	public List<Users> find(Users UsersBean) {
		return uDao.find(UsersBean);
	}

	public Users findByFullName(String nutriFullname) {
		return uDao.findByFullName(nutriFullname);
	}

	public List<Users> findAll() {

		return uDao.findAll();
	}

	public List<Users> newNutri(int id) {

		return uDao.newNutri(id);
	}

	public List<Users> findByNameFuzzyQuery(String word) {
		return uDao.findByNameFuzzyQuery(word);
	}
}
