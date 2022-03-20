package model;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class NutriTimeDAO {
	private SessionFactory sessionFactory;

	@Autowired
	public NutriTimeDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean checkDate(NutriTime nutriTime) {
		Query query = sessionFactory.getCurrentSession()
				.createQuery("From NutriTime Where available_date=:date and d_name=:name");
		query.setParameter("name", nutriTime.getName());
		query.setParameter("date", nutriTime.getDate());
		List results = query.list();
		if (results.size() != 0)
			return true;
		else {
			return false;
		}
	}

	public List<NutriTime> search() {
		String hql = "FROM NutriTime";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<NutriTime> results = query.list();
		return results;
	}

	public void insertinto(NutriTime nutriTime) {
		nutriTime.setNutriId(nutriTime.getNutriId());
		nutriTime.setName(nutriTime.getName());
		nutriTime.setDate(nutriTime.getDate());
		nutriTime.setTime(nutriTime.getTime());
		sessionFactory.getCurrentSession().save(nutriTime);
	}

	public void update(NutriTime nutriTime) {
		String hql = "Update NutriTime Set available_time=:time Where d_name=:name and available_date=:date";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("time", nutriTime.getTime());
		query.setParameter("name", nutriTime.getName());
		query.setParameter("date", nutriTime.getDate());
		query.executeUpdate();
	}

	public List<NutriTime> datePlus(String start, String end, String name) {
		String hql = "FROM NutriTime Where available_date>=:start And available_date<=:end And d_name=:name";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("start", start);
		query.setParameter("end", end);
		query.setParameter("name", name);
		List<NutriTime> results = query.list();
		return results;
	}

	public void delete(String name, String date) {
		String hql = "DELETE NutriTime Where available_date=:date And d_name=:name";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("date", date);
		query.setParameter("name", name);
		query.executeUpdate();
	}

	public String searchbyIdAndDate(int d_id, String date) {
		String hql = "FROM NutriTime Where available_date=:date And d_id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("date", date);
		query.setParameter("id", d_id);
		List<NutriTime> results = query.list();
		return results.get(0).getTime();
	}

	public void updateNewTime(int d_id, String date, String newTime) {
		String hql = "Update NutriTime Set available_time=:time Where d_id=:id and available_date=:date";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("time", newTime);
		query.setParameter("id", d_id);
		query.setParameter("date", date);
		query.executeUpdate();
	}
}
