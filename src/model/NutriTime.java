package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NutriTime")
public class NutriTime {
	private int id;
	private int nutriId;
	private String name;
	private String date;
	private String time;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "d_id")
	public int getNutriId() {
		return nutriId;
	}

	public void setNutriId(int nutriId) {
		this.nutriId = nutriId;
	}
	
	@Column(name = "d_name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "available_date")
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	@Column(name = "available_time")
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
