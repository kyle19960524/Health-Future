package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import model.ShoppingRecordDAOImpl;
import model.ShoppingRecord;
@Service
public class ShoppingRecordServiceImpl {
//	@Autowired
	private ShoppingRecordDAOImpl srDao;
	public static AllInOne all;
	
	@Autowired
	public ShoppingRecordServiceImpl(ShoppingRecordDAOImpl srDao) {
		this.srDao = srDao;
	}
	
	
	public ShoppingRecord getShoppingRecord(int sr_userid, int sr_productId, String sr_time) {
		return srDao.getShoppingRecord(sr_userid, sr_productId, sr_time);
	}

	
	public void addShoppingRecord(ShoppingRecord shoppingRecord) {
		srDao.addShoppingRecord(shoppingRecord);

	}

	
	public boolean deleteShoppingRecord(int sr_userid, int sr_productId) {
		return srDao.deleteShoppingRecord(sr_userid, sr_productId);
	}

	
	public boolean updateShoppingRecord(ShoppingRecord shoppingRecord) {
		return srDao.updateShoppingRecord(shoppingRecord);
	}

	
	public List<ShoppingRecord> getShoppingRecords(int sr_userid) {
		return srDao.getShoppingRecords(sr_userid);
	}

	
	public List<ShoppingRecord> getAllShoppingRecords() {
		return srDao.getAllShoppingRecords();
	}

	
	public List<ShoppingRecord> getShoppingRecordsByOrderStatus(int sr_orderStatus) {
		return srDao.getShoppingRecordsByOrderStatus(sr_orderStatus);
	}

	
	public boolean getUserProductRecord(int sr_userid, int sr_productId) {
		return srDao.getUserProductRecord(sr_userid, sr_productId);
	}

	
	public boolean deleteShoppingRecordByUser(int sr_userid) {
		return srDao.deleteShoppingRecordByUser(sr_userid);
	}

	
	public boolean deleteShoppingRecordByProductId(int sr_productId) {
		return srDao.deleteShoppingRecordByProductId(sr_productId);
	}
	
	public static String allCanChoose(AioCheckOutALL obj) {
		initial();
		String form = all.aioCheckOut(obj, null);
		return form;
	}
	
	public String getDateTime() {
		Date date = new Date();
		SimpleDateFormat simpleDateFormatArrivals = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.UK);
		System.out.println(simpleDateFormatArrivals.format(date));
		return simpleDateFormatArrivals.format(date);
	}
	
	private static void initial(){
		all = new AllInOne("");
	}
}
