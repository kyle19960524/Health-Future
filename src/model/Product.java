package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "product")
public class Product {

	private int p_id;
	private String p_name;
	private String p_description;
	private String p_keyWord;
	private int p_price;
	private int p_counts;
	private int p_type;

	@Id
	@GenericGenerator(name = "generator", strategy = "increment") // 主鍵自動增加
	@GeneratedValue(generator = "generator")

	@Column(name = "p_id")
	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	@Column(name = "p_name")
	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	@Column(name = "p_description")
	public String getP_description() {
		return p_description;
	}

	public void setP_description(String p_description) {
		this.p_description = p_description;
	}

	@Column(name = "p_keyWord")
	public String getP_keyWord() {
		return p_keyWord;
	}

	public void setP_keyWord(String p_keyWord) {
		this.p_keyWord = p_keyWord;
	}

	@Column(name = "p_price")
	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	@Column(name = "p_counts")
	public int getP_counts() {
		return p_counts;
	}

	public void setP_counts(int p_counts) {
		this.p_counts = p_counts;
	}

	@Column(name = "p_type")
	public int getP_type() {
		return p_type;
	}

	public void setP_type(int p_type) {
		this.p_type = p_type;
	}
}
