package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import model.ShoppingRecordPriKey;

@Entity
@Table(name = "productevaluation")
@IdClass(value = ShoppingRecordPriKey.class)
public class ProductEvaluation {

	private int pe_userid;
	private int pe_productId;
	private String pe_time;
	private String pe_content;
	
	@Id
    @Column(name="pe_userid")
	public int getPe_userid() {
		return pe_userid;
	}

	public void setPe_userid(int pe_userid) {
		this.pe_userid = pe_userid;
	}
	
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

	@Column(name="pe_content")
	public String getPe_content() {
		return pe_content;
	}

	public void setPe_content(String pe_content) {
		this.pe_content = pe_content;
	}

}
