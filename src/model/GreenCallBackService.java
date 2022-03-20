package model;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GreenCallBackService {
	private GreenCallBackDAO gDao;

	@Autowired
	public GreenCallBackService(GreenCallBackDAO gDao) {
		this.gDao = gDao;
	}

	public void insertGreenCallBack(GreenCallBack gcb) {
		gDao.insertGreenCallBack(gcb);
	}

	public List<GreenCallBack> findAllPayRecord() {
		return gDao.findAllPayRecord();
	}

	public void updateTradeNoIntoMemData(String tradeNo, String memDataName, String memDataPhone, String memDataAddress,
			String memDataEmail, String productName, int productAmount) {
		gDao.updateTradeNoIntoMemData(tradeNo, memDataName, memDataPhone, memDataAddress, memDataEmail, productName,
				productAmount);
	}

	public GreenCallBack findBymerchantTradeNo(String merchantTradeNo) {
		return gDao.findBymerchantTradeNo(merchantTradeNo);
	}
	
	public List<GreenCallBack> OrderByRtnMsg(){
		return gDao.OrderByRtnMsg();
	}
	
	public List<GreenCallBack> OrderByTradeAmt(){
		return gDao.OrderByTradeAmt();
	}
	
	public List<GreenCallBack> OrderByPaymentType(){
		return gDao.OrderByPaymentType();
	}
	
	public List<GreenCallBack> OrderByPaymentDate(){
		return gDao.OrderByPaymentDate();
	}
}
