package model;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import model.ProductEvaluation;

@Repository
public class ProductEvaluationDAOImpl {
		
//	@Resource
    private SessionFactory sessionFactory;
	
	@Autowired
	public ProductEvaluationDAOImpl(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public ProductEvaluation getProductEvaluation(int pe_userid, int pe_productId, String pe_time) {
		String hql = "from productevaluation where pe_userid=? and pe_productId=? and pe_time=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, pe_userid);
        query.setParameter(1, pe_productId);
        query.setParameter(2, pe_time);
        return (ProductEvaluation) query.uniqueResult();
	}

	
	public void addProductEvaluation(ProductEvaluation productevaluation) {
		sessionFactory.getCurrentSession().save(productevaluation);
	}

	
	public boolean deleteProductEvaluation(int pe_userid, int pe_productId, String pe_time) {
		 String hql = "delete productevaluation where pe_userid=? and pe_productId=? and pe_time=?";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        query.setParameter(0, pe_userid);
	        query.setParameter(1, pe_productId);
	        query.setParameter(2, pe_time);
	        return query.executeUpdate() > 0;
	}

	
	public boolean updateProductEvaluation(ProductEvaluation productevaluation) {
		String hql = "update productevaluation set pe_content=? where pe_userid=? and pe_productId=? and pe_time=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, productevaluation.getPe_content());
        query.setParameter(1, productevaluation.getPe_userid());
        query.setParameter(2, productevaluation.getPe_productId());
        query.setParameter(3, productevaluation.getPe_time());
        return query.executeUpdate() > 0;
	}

	
	public List<ProductEvaluation> getListProductEvaluation(int pe_productId) {
		String hql = "from productevaluation where pe_productId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, pe_productId);
        return  query.list();
	}

	
	public boolean deleteProductEvaluationByUser(int pe_userid) {
		String hql = "delete productevaluation where pe_userid=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, pe_userid);
        return query.executeUpdate() > 0;
	}

	
	public boolean deleteProductEvaluationByProduct(int pe_productId) {
		String hql = "delete productevaluation where pe_productId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, pe_productId);
        return query.executeUpdate() > 0;
	}

}
