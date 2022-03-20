package model;

import java.io.Serializable;

import model.ShoppingRecordPriKey;

public class ShoppingRecordPriKey implements Serializable {
	private int pe_userid;
	private int pe_productId;
	private String pe_time;

	public int getPe_userid() {
		return pe_userid;
	}

	public void setPe_userid(int pe_userid) {
		this.pe_userid = pe_userid;
	}

	public int getPe_productId() {
		return pe_productId;
	}

	public void setPe_productId(int pe_productId) {
		this.pe_productId = pe_productId;
	}

	public String getPe_time() {
		return pe_time;
	}

	public void setPe_time(String pe_time) {
		this.pe_time = pe_time;
	}


}
