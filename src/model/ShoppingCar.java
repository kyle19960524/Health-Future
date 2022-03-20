package model;

import javax.persistence.*;

/**
 * Created by 14437 on 2017/3/3.
 */
@Entity
@Table(name = "shoppingcar")
@IdClass(value = ShoppingCarPriKey.class)
public class ShoppingCar {
//	private String sc_userac;
	private int sc_productId;
	private int sc_productPrice;
	private int sc_counts;
	private int sc_userid;
	
	
	@Id
	@Column(name="sc_userid")
	public int getSc_userid() {
		return sc_userid;
	}

	public void setSc_userid(int sc_userid) {
		this.sc_userid = sc_userid;
	}
	
	
//	@Id
//    @Column(name="sc_userac")
//	public String getSc_userac() {
//		return sc_userac;
//	}
//
//	public void setSc_userac(String sc_userac) {
//		this.sc_userac = sc_userac;
//	}
	@Id
	@Column(name="sc_productId")
	public int getSc_productId() {
		return sc_productId;
	}

	public void setSc_productId(int sc_productId) {
		this.sc_productId = sc_productId;
	}

	@Column(name="sc_productPrice")
	public int getSc_productPrice() {
		return sc_productPrice;
	}

	public void setSc_productPrice(int sc_productPrice) {
		this.sc_productPrice = sc_productPrice;
	}

	@Column(name="sc_counts")
	public int getSc_counts() {
		return sc_counts;
	}

	public void setSc_counts(int sc_counts) {
		this.sc_counts = sc_counts;
	}

}
