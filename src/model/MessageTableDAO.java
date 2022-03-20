package model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class MessageTableDAO {
	private SessionFactory sessionFactory;

	@Autowired
	public MessageTableDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public List<MessageTable> findByPostId(int postTableId){
		String hql="from MessageTable where post_id=:id order by message_time desc";  
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", postTableId);
		List<MessageTable> results = query.list();
		return results;
	}
	
	public void insertMessage(MessageTable mt) {
		sessionFactory.getCurrentSession().save(mt);
	}
	
	public void deleteByPostId(int postId) {
		String hql = "Delete MessageTable Where post_id=:pid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("pid", postId);
		query.executeUpdate();
	}
}
