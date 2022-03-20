package model;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import model.ShoppingRecord;

@Repository
public class ShoppingRecordDAOImpl {
//	@Resource
    private SessionFactory sessionFactory;
	
	@Autowired
	public ShoppingRecordDAOImpl(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public ShoppingRecord getShoppingRecord(int pe_userid, int pe_productId, String pe_time) {
		String hql = "from ShoppingRecord where pe_userid= :pe_userid and pe_productId= :pe_productId and pe_time= :pe_time";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("pe_userid", pe_userid);
        query.setParameter("pe_productId", pe_productId);
        query.setParameter("pe_time", pe_time);
        return (ShoppingRecord) query.uniqueResult();
	}

	
	public void addShoppingRecord(ShoppingRecord shoppingRecord) {
		sessionFactory.getCurrentSession().save(shoppingRecord);
	}

	
	public boolean deleteShoppingRecord(int pe_userid, int pe_productId) {
		String hql = "delete ShoppingRecord where pe_userid= :pe_userid and pe_productId= :pe_productId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("pe_userid", pe_userid);
        query.setParameter("pe_productId", pe_productId);
        return query.executeUpdate() > 0;
	}

	
	public boolean updateShoppingRecord(ShoppingRecord shoppingRecord) {
		String hql = "update ShoppingReocrd set pe_orderStatus= :pe_orderStatus where pe_userid= :pe_userid and pe_productId= :pe_productId and pe_time= :pe_time";
        String sql = "update shoppingrecord set pe_orderstatus="+shoppingRecord.getPe_orderStatus()+" where pe_userid="+shoppingRecord.getPe_userid()+" and pe_productid="+shoppingRecord.getPe_productId()+" and pe_time='"+shoppingRecord.getPe_time()+"'";
        
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        return query.executeUpdate() > 0;
	}

	
	public List<ShoppingRecord> getShoppingRecords(int pe_userid) {
		String hql = "from ShoppingRecord where pe_userid= :pe_userid";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("pe_userid",pe_userid);
        return query.list();
	}

	
	public List<ShoppingRecord> getAllShoppingRecords() {
		 String hql = "from ShoppingRecord";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        return query.list();
	}

	
	public List<ShoppingRecord> getShoppingRecordsByOrderStatus(int pe_orderStatus) {
		String hql = "from ShoppingRecord where pe_orderStatus= :pe_orderStatus";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("pe_orderStatus",pe_orderStatus);
        return query.list();
	}

	
	public boolean getUserProductRecord(int pe_userid, int pe_productId) {
		String hql = "from ShoppingRecord where pe_userid= :pe_userid and pe_productId= :pe_productId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("pe_userid",pe_userid);
        query.setParameter("pe_productId",pe_productId);
        return query.list().size()>0;
	}

	
	public boolean deleteShoppingRecordByUser(int pe_userid) {
		String hql = "delete ShoppingRecord where pe_userid= :pe_userid";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("pe_userid", pe_userid);
        return query.executeUpdate() > 0;
	}

	
	public boolean deleteShoppingRecordByProductId(int pe_productId) {
		String hql = "delete ShoppingRecord where pe_productId= :pe_productId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("pe_productId", pe_productId);
        return query.executeUpdate() > 0;
	}

}
