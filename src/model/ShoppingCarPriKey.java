package model;

import java.io.Serializable;

import model.ShoppingCarPriKey;

/**
 * Created by 14437 on 2017/3/3.
 */
public class ShoppingCarPriKey implements Serializable {
	private int sc_userid;
	private int sc_productId;

	public int getSc_userid() {
		return sc_userid;
	}

	public void setSc_userid(int sc_userid) {
		this.sc_userid = sc_userid;
	}

	public int getSc_productId() {
		return sc_productId;
	}

	public void setSc_productId(int scp_productId) {
		this.sc_productId = scp_productId;
	}



}
