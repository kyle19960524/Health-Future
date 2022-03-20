package model;

import javax.persistence.*;

@Entity
@Table(name = "shoppingrecord")
@IdClass(value = ShoppingRecordPriKey.class)
public class ShoppingRecord {
//	private String pe_userac;
	private int pe_productId;
	private String pe_time;
	private int pe_orderStatus;
	private int pe_productPrice;
	private int pe_counts;
	private int pe_userid;
	private String pe_restime;
	private String pe_resdate;
	
	@Id
	@Column(name="pe_userid")
	public int getPe_userid() {
		return pe_userid;
	}

	public void setPe_userid(int pe_userid) {
		this.pe_userid = pe_userid;
	}
	
	@Column(name = "pe_restime")
	public String getPe_restime() {
		return pe_restime;
	}

	public void setPe_restime(String pe_restime) {
		this.pe_restime = pe_restime;
	}
	
	
	@Column(name = "pe_resdate")
	public String getPe_resdate() {
		return pe_resdate;
	}

	public void setPe_resdate(String pe_resdate) {
		this.pe_resdate = pe_resdate;
	}

	//	@Id
//	@Column(name="pe_userac")
//	public String getPe_userac() {
//		return pe_userac;
//	}
//
//	public void setPe_userac(String pe_userac) {
//		this.pe_userac = pe_userac;
//	}
	@Column(name="pe_productId")
	public int getPe_productId() {
		return pe_productId;
	}

	public void setPe_productId(int pe_productId) {
		this.pe_productId = pe_productId;
	}
	@Column(name="pe_time")
	public String getPe_time() {
		return pe_time;
	}

	public void setPe_time(String pe_time) {
		this.pe_time = pe_time;
	}
	@Column(name="pe_orderStatus")
	public int getPe_orderStatus() {
		return pe_orderStatus;
	}

	public void setPe_orderStatus(int pe_orderStatus) {
		this.pe_orderStatus = pe_orderStatus;
	}
	@Column(name="pe_productPrice")
	public int getPe_productPrice() {
		return pe_productPrice;
	}

	public void setPe_productPrice(int pe_productPrice) {
		this.pe_productPrice = pe_productPrice;
	}
	@Column(name="pe_counts")
	public int getPe_counts() {
		return pe_counts;
	}

	public void setPe_counts(int pe_counts) {
		this.pe_counts = pe_counts;
	}

}
