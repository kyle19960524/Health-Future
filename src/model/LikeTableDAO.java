package model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class LikeTableDAO {
	private SessionFactory sessionFactory;

	@Autowired
	public LikeTableDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean findByPostIdAndMemberId(int postId, int memId) {
		String hql = "from LikeTable where post_id=:pid and m_id=:mid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("pid", postId);
		query.setParameter("mid", memId);
		if (query.list().size() == 0) {
			return false;
		} else {
			return true;
		}
	}

	public void insertLike(LikeTable lt) {
		sessionFactory.getCurrentSession().save(lt);
	}

	public void deleteLike(LikeTable lt) {
		String hql = "Delete LikeTable Where post_id=:pid and m_id=:mid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("pid", lt.getPostId());
		query.setParameter("mid", lt.getMemId());
		query.executeUpdate();
	}

	public void deleteByPostId(int postId) {
		String hql = "Delete LikeTable Where post_id=:pid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("pid", postId);
		query.executeUpdate();
	}

	public List<LikeTable> findByPostId(int postId) {
		String hql = "from LikeTable where post_id=:pid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("pid", postId);
		List<LikeTable> results = query.list();
		return results;
	}
}
