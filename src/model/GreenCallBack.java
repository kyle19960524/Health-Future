package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GreenCallBack")
public class GreenCallBack {

	private String merchantTradeNo;
	private String merchantID;
	private int rtnCode;
	private String rtnMsg;
	private String tradeNo;
	private int tradeAmt;
	private String paymentDate;
	private String paymentType;
	private String tradeDate;
	private String memFullName;
	private String memPhone;
	private String memAddress;
	private String memEmail;
	private String productName;
	private int productAmount;

	@Id
	@Column(name = "MerchantTradeNo")
	public String getMerchantTradeNo() {
		return merchantTradeNo;
	}

	public void setMerchantTradeNo(String merchantTradeNo) {
		this.merchantTradeNo = merchantTradeNo;
	}

	@Column(name = "MerchantID")
	public String getMerchantID() {
		return merchantID;
	}

	public void setMerchantID(String merchantID) {
		this.merchantID = merchantID;
	}

	@Column(name = "RtnCode")
	public int getRtnCode() {
		return rtnCode;
	}

	public void setRtnCode(int rtnCode) {
		this.rtnCode = rtnCode;
	}

	@Column(name = "RtnMsg")
	public String getRtnMsg() {
		return rtnMsg;
	}

	public void setRtnMsg(String rtnMsg) {
		this.rtnMsg = rtnMsg;
	}

	@Column(name = "TradeNo")
	public String getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}

	@Column(name = "TradeAmt")
	public int getTradeAmt() {
		return tradeAmt;
	}

	public void setTradeAmt(int tradeAmt) {
		this.tradeAmt = tradeAmt;
	}

	@Column(name = "PaymentDate")
	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	@Column(name = "PaymentType")
	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Column(name = "TradeDate")
	public String getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}

	@Column(name = "memFullName")
	public String getMemFullName() {
		return memFullName;
	}

	public void setMemFullName(String memFullName) {
		this.memFullName = memFullName;
	}

	@Column(name = "memPhone")
	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	@Column(name = "memAddress")
	public String getMemAddress() {
		return memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}

	@Column(name = "memEmail")
	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
	@Column(name = "productName")
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "productAmount")
	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

}
