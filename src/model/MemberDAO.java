package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	public MemberDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Boolean checkLogin(Member users) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "from Member where m_useraccount=:m_useraccount and m_password=:m_password";
			Query query = session.createQuery(hqlStr);
			query.setParameter("m_useraccount", users.getUserAccount());
			query.setParameter("m_password", users.getUserPwd());
			Member account = (Member) query.uniqueResult();
		    
			if (account != null) {
				return true;
			}
			return false;
		} catch (Exception e) {
			System.out.println("e:" + e);
			return false;
		}
		
	}
	
	public String membernickName(Member users) {

		Query query = sessionFactory.getCurrentSession().createQuery("Select nickName From Member Where m_useraccount=:m_useraccount AND userPassword=:m_password ");
		query.setParameter("m_useraccount", users.getUserAccount());
		query.setParameter("m_password", users.getUserPwd());
		List list = query.list();

		return (String) list.get(0);
	}
	
	public boolean checkmemberName(Member users) {

		Query query = sessionFactory.getCurrentSession().createQuery("From Member Where m_useraccount=:m_useraccount");
		query.setParameter("m_useraccount", users.getUserAccount());
		List list = query.list();
		if (list.size() != 0) {

			return false;
		} else {

			return true;
		}
	}
	
	public Boolean checknickName(Member users) {

		Query query = sessionFactory.getCurrentSession().createQuery("From Member Where nickName=:membernickName");
		query.setParameter("membernickName", users.getNickName());
		List list = query.list();
		if (list.size() != 0) {

			return false;
		} else {

			return true;
		}

	}	
	
	public void insertinto(Member users) {

		users.setUserAccount(users.getUserAccount());
		users.setUserPwd(users.getUserPwd());
		users.setFullName(users.getFullName());
		users.setNickName(users.getNickName());
		users.setIdCard(users.getIdCard());
		users.setSex(users.getSex());
		users.setBirthday(users.getBirthday());
		users.setHeight(users.getHeight());
		users.setWeight(users.getWeight());
		users.setLocation(users.getLocation());
		users.setCellphone(users.getCellphone());
		users.setEmail(users.getEmail());
		users.setStatus(5);

		sessionFactory.getCurrentSession().save(users);
	}

	public Member findByName(String users) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Member WHERE m_useraccount=:m_useraccount";
		Member member = null;
		@SuppressWarnings("unchecked")
		List<Member> list = session.createQuery(hql)
								.setParameter("m_useraccount", users)
								.getResultList();
		if (!list.isEmpty()) 
			member = list.get(0);
		return member;
	}
	
	public void updatepassword(Member users) {
				
		Query query = sessionFactory.getCurrentSession().createQuery("Update Member Set m_password=:x where m_useraccount=:y ");
	    query.setParameter("x", users.getUserPwd());
	    query.setParameter("y", users.getUserAccount());
	    
	    query.executeUpdate();
	}
	
@SuppressWarnings("rawtypes")
public void updateMember(Member users) {

		Query query = sessionFactory.getCurrentSession().createQuery(
				"Update Member Set m_fullname=:a,m_password=:c,m_nickname=:d,m_sex=:f,m_birthday=:g,m_height=:h,m_weight=:i,m_location=:j,m_cellphone=:k,m_email=:l,m_path=:m, m_picture=:o where m_useraccount=:b");
				
	    query.setParameter("a", users.getFullName());
	    query.setParameter("b", users.getUserAccount());
	    query.setParameter("c", users.getUserPwd());
	    query.setParameter("d", users.getNickName());
//	    query.setParameter("e", users.getIdCard());
	    query.setParameter("f", users.getSex());
	    query.setParameter("g", users.getBirthday());
	    query.setParameter("h", users.getHeight());
	    query.setParameter("i", users.getWeight());
	    query.setParameter("j", users.getLocation());
	    query.setParameter("k", users.getCellphone());
	    query.setParameter("l", users.getEmail());
	    query.setParameter("m", users.getPath());
	    query.setParameter("o", users.getPhoto());
	    
	    query.executeUpdate();
	}
	
public Member findById(int memId) {
	Session session = sessionFactory.getCurrentSession();
	String hql = "FROM Member WHERE m_id=:memId";
	Member member = null;
	@SuppressWarnings("unchecked")
	List<Member> list = session.createQuery(hql).setParameter("memId", memId).getResultList();
	if (!list.isEmpty())
		member = list.get(0);
	return member;
}

/* 新增 */

public Member getMemberById(int m_id) {
	String hql = "from Member where m_id= :m_id";
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	query.setParameter("m_id", m_id);
	return (Member) query.uniqueResult();
}

}
