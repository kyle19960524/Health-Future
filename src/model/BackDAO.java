package model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class BackDAO {
	private SessionFactory sessionFactory;

	@Autowired
	public BackDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean checkLogin(Backuser Backuser) {

		try {

			String hqlStr = "from Backuser where b_account=:user and b_pwd=:pwd";
			Query query = sessionFactory.getCurrentSession().createQuery(hqlStr);
			query.setParameter("user", Backuser.getBackaccount());
			query.setParameter("pwd", Backuser.getBackpwd());
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

	public List<Users> find() {
		String hql = "From Users Where d_status=0";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		return query.list();
	}

	public void changestatus(int id) {
		Query query = sessionFactory.getCurrentSession().createQuery("Update Users Set d_status=1 where d_id=:x ");

		query.setParameter("x", id);

		query.executeUpdate();

	}
	
	public List<Users> getemail(int id) {
		String hql = "From Users Where d_id=:x";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		query.setParameter("x", id);
		
		return query.list();
	}

	
	
	public List<Question> getQuestion(){
		
		String hql = "From Question Where status=0";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		
		return query.list();
	}
	
	
	public void changeQuestionstatus(int id) {
		Query query = sessionFactory.getCurrentSession().createQuery("Update Question Set status=1 where questionId=:x ");

		query.setParameter("x", id);

		query.executeUpdate();

	}
	
	public void insertAccount(String account,int id) {
		Query query = sessionFactory.getCurrentSession().createQuery
				("Update Question Set employeeName=:x where questionId=:y ");
		
		query.setParameter("x", account);
		query.setParameter("y", id);
		
		query.executeUpdate();
	}
	
	
	public List<Question> status1Question() {
		
		 Query query = sessionFactory.getCurrentSession().createQuery("From Question where status=1");
		
		 return query.list();
		 
	}
	
}