package model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class GreenCallBackDAO {
	private SessionFactory sessionFactory;

	@Autowired
	public GreenCallBackDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void insertGreenCallBack(GreenCallBack gcb) {
		sessionFactory.getCurrentSession().save(gcb);
	}

	public List<GreenCallBack> findAllPayRecord() {
		String hql = "from GreenCallBack order by MerchantTradeNo";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<GreenCallBack> results = query.list();
		return results;
	}

	public void updateTradeNoIntoMemData(String tradeNo, String memDataName, String memDataPhone, String memDataAddress,
			String memDataEmail,String productName,int productAmount) {
		String hql = "Update GreenCallBack Set memFullName=:memFullName,memPhone=:memPhone,memAddress=:memAddress,memEmail=:memEmail,productName=:productName,productAmount=:productAmount Where MerchantTradeNo=:tradeNo";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("tradeNo", tradeNo);
		query.setParameter("memFullName", memDataName);
		query.setParameter("memPhone", memDataPhone);
		query.setParameter("memAddress", memDataAddress);
		query.setParameter("memEmail", memDataEmail);
		query.setParameter("productName", productName);
		query.setParameter("productAmount", productAmount);
		query.executeUpdate();
	}
	
	public GreenCallBack findBymerchantTradeNo(String merchantTradeNo) {
		String hql="from GreenCallBack where merchantTradeNo=:merchantTradeNo";  
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("merchantTradeNo", merchantTradeNo);
		List<GreenCallBack> results = query.list();
		return results.get(0);
	}

	
	public List<GreenCallBack> OrderByRtnMsg(){
		String hql = "from GreenCallBack order by RtnMsg desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<GreenCallBack> results = query.list();
		return results;
	}
	
	public List<GreenCallBack> OrderByTradeAmt(){
		String hql = "from GreenCallBack order by TradeAmt desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<GreenCallBack> results = query.list();
		return results;
	}
	
	public List<GreenCallBack> OrderByPaymentType(){
		String hql = "from GreenCallBack order by PaymentType";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<GreenCallBack> results = query.list();
		return results;
	}
	
	public List<GreenCallBack> OrderByPaymentDate(){
		String hql = "from GreenCallBack order by PaymentDate";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<GreenCallBack> results = query.list();
		return results;
	}

}
