package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BackUser")
public class Backuser {
	
	private int id;
	private String backaccount;
	private String backpwd;
	
	public Backuser() {
		
	}
	
	public Backuser(String backaccount, String  backpwd) {
		this.backaccount=backaccount;
		this.backpwd=backpwd;
	}
	@Id
	@Column(name="b_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="b_account")
	public String getBackaccount() {
		return backaccount;
	}
	public void setBackaccount(String backaccount) {
		this.backaccount = backaccount;
	}
	
	@Column(name="b_pwd")
	public String getBackpwd() {
		return backpwd;
	}
	public void setBackpwd(String backpwd) {
		this.backpwd = backpwd;
	}
	
	
	
	
	

}
