package model;

import java.util.List;
import java.util.Properties;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAO {
	private SessionFactory sessionFactory;

	@Autowired
	public UsersDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean checkLogin(Users usersBean) {
		try {

			String hqlStr = "from Account where d_useraccount=:user and d_password=:pwd";
			Query query = sessionFactory.getCurrentSession()
					.createQuery("From Users Where d_useraccount=:user AND d_password=:pwd ");
			query.setParameter("user", usersBean.getAccount());
			query.setParameter("pwd", usersBean.getUserPassword());
			List list = query.list();
			if (list.size() != 0) {

				return true;
			} else {

				return false;
			}
		} catch (Exception e) {
			System.out.println("e:" + e);
			return false;
		}
	}

	public boolean checkuserName(Users usersBean) {

		Query query = sessionFactory.getCurrentSession().createQuery("From Users Where d_useraccount=:account");
		query.setParameter("account", usersBean.getAccount());
		List list = query.list();
		if (list.size() != 0) {

			return false;
		} else {

			return true;
		}
	}

	public boolean checkuserFullName(String nutriName) {

		Query query = sessionFactory.getCurrentSession().createQuery("From Users Where d_fullname=:nutriName");
		query.setParameter("nutriName", nutriName);
		List list = query.list();
		if (list.size() != 0) {

			return true;
		} else {

			return false;
		}
	}

	public void updatepassword(Users UserBean) {

		Query query = sessionFactory.getCurrentSession()
				.createQuery("Update Users Set d_password=:x where d_useraccount=:y ");
		query.setParameter("x", UserBean.getUserPassword());
		query.setParameter("y", UserBean.getAccount());

		query.executeUpdate();
	}

	public void insertinto(Users usersBean) {

		usersBean.setAccount(usersBean.getAccount());
		usersBean.setUserPassword(usersBean.getUserPassword());
		usersBean.setName(usersBean.getName());
		usersBean.setGender(usersBean.getGender());
		usersBean.setEducation(usersBean.getEducation());
		usersBean.setExperience(usersBean.getExperience());
		usersBean.setPhone(usersBean.getPhone());
		usersBean.setCellphone(usersBean.getCellphone());
		usersBean.setEmail(usersBean.getEmail());
		usersBean.setBirthday(usersBean.getBirthday());
//		usersBean.setLicense(usersBean.getLicense());
		usersBean.setIden(usersBean.getIden());
//		usersBean.setPhoto(usersBean.getPhoto());
		usersBean.setArea(usersBean.getArea());

		sessionFactory.getCurrentSession().save(usersBean);
	}

	public List<Users> find(Users UsersBean) {
		String hql = "From Users Where d_useraccount=:name and d_password=:pwd";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("name", UsersBean.getAccount());
		query.setParameter("pwd", UsersBean.getUserPassword());
		return query.list();
	}

	public Users findByFullName(String nutriFullname) {
		String hql = "FROM Users WHERE d_fullname=:nutrifullname";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("nutrifullname", nutriFullname);
		List<Users> nutri = query.list();
		return nutri.get(0);
	}

	public List<Users> findAll() {
		String hql = "From Users where d_status=1 ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		return query.list();
	}

	public List<Users> newNutri(int id) {

		String hql = "From Users where d_id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		query.setParameter("id", id);

		return query.list();

	}
	
	public List<Users> findByNameFuzzyQuery(String word){
		String hql = "From Users where d_fullname Like :word";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("word","%"+word+"%");
		return query.list();
	}

}
