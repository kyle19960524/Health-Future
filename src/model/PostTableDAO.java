package model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class PostTableDAO {
	private SessionFactory sessionFactory;

	@Autowired
	public PostTableDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void insertinto(PostTable postTable) {
		sessionFactory.getCurrentSession().save(postTable);
	}

	public List<PostTable> findAllPost() {
		String hql = "from PostTable order by post_time desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<PostTable> results = query.list();
		return results;
	}

	public PostTable findById(int postId) {
		String hql = "from PostTable where post_id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", postId);
		List<PostTable> results = query.list();
		return results.get(0);
	}
	
	public void updateMessageAmount(int postId,int changeMessageAmount) {
		String hql = "Update PostTable Set message_amount=:amount Where post_id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("amount", changeMessageAmount);
		query.setParameter("id", postId);
		query.executeUpdate();
	}
	
	public List<PostTable> findByMemIdPost(int memId){
		String hql = "from PostTable where m_id=:mid order by post_time desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("mid", memId);
		List<PostTable> results = query.list();
		return results;
	}
	
	public void deleteByPostId(int postId) {
		String hql = "Delete PostTable Where post_id=:pid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("pid", postId);
		query.executeUpdate();
	}
	
	public void updatePost(int postId,String descrip,String savaPath,String fileName) {
		String hql = "Update PostTable Set description=:description,imagePath=:imagePath,fileName=:fileName Where post_id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("description", descrip);
		query.setParameter("imagePath", savaPath);
		query.setParameter("fileName", fileName);
		query.setParameter("id", postId);
		query.executeUpdate();
	}
	
}
