package model;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import model.ShoppingCar;

@Repository
public class ShoppingCarDAOImpl {
//	@Resource
	private SessionFactory sessionFactory;
	
	@Autowired
	public ShoppingCarDAOImpl(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	public ShoppingCar getShoppingCar(int sc_userid, int sc_productId) {
//	public ShoppingCar getShoppingCar(int sc_productId) {
		String hql = "from ShoppingCar where sc_userid= :sc_userid and sc_productId= :sc_productId";
//		String hql = "from ShoppingCar where sc_productId=:sc_prdocutId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sc_userid", sc_userid);
		query.setParameter("sc_productId", sc_productId);
		return (ShoppingCar) query.uniqueResult();
	}

	
	public void addShoppingCar(ShoppingCar shoppingCar) {
		sessionFactory.getCurrentSession().save(shoppingCar);

	}

	
	public boolean deleteShoppingCar(int sc_userid, int sc_productId) {
		String hql = "delete ShoppingCar where sc_userid= :sc_userid and sc_productId= :sc_productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sc_userid", sc_userid);
		query.setParameter("sc_productId", sc_productId);
		return query.executeUpdate() > 0;
	}

	
	public boolean updateShoppingCar(ShoppingCar shoppingCar) {
		String hql = "update ShoppingCar set sc_productPrice= :sc_productPrice,sc_counts= :sc_counts where sc_userid= :sc_userid and sc_productId= :sc_productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sc_productPrice", shoppingCar.getSc_productPrice());
		query.setParameter("sc_counts", shoppingCar.getSc_counts());
		query.setParameter("sc_userid", shoppingCar.getSc_userid());
		query.setParameter("sc_productId", shoppingCar.getSc_productId());
		return query.executeUpdate() > 0;
	}

	
	public List<ShoppingCar> getShoppingCars(int sc_userid) {
		String hql = "from ShoppingCar where sc_userid= :sc_userid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sc_userid", sc_userid);
		return query.list();
	}


	public boolean deleteShoppingCarByUser(int sc_userid) {
		String hql = "delete ShoppingCar where sc_userid= :sc_userid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sc_userid", sc_userid);
		return query.executeUpdate() > 0;
	}

	
	public boolean deleteShoppingCarByProduct(int sc_productId) {
		String hql = "delete ShoppingCar where sc_productId= :sc_productId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sc_productId", sc_productId);
		return query.executeUpdate() > 0;
	}

}
