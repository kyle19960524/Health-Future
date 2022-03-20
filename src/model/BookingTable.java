package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BookingTable")
public class BookingTable {
	private int id;
	private int nutriId;
	private String nutriName;
	private int memId;
	private String memName;
	private String date;
	private String eachTime;
	private int status;
	private String chatroomid;
	private String notification;
	private String note;
	
	private String breakfast1;
	private String breakfast2;
	private String breakfast3;
	
	private String lunch1;
	private String lunch2;
	private String lunch3;

	private String dinner1;
	private String dinner2;
	private String dinner3;
	
	private String special1;
	private String special2;
	private String special3;
	

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
	public String getNutriName() {
		return nutriName;
	}

	public void setNutriName(String nutriName) {
		this.nutriName = nutriName;
	}

	@Column(name = "m_id")
	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	@Column(name = "m_name")
	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	@Column(name = "available_date")
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Column(name = "available_eachTime")
	public String getEachTime() {
		return eachTime;
	}

	public void setEachTime(String eachTime) {
		this.eachTime = eachTime;
	}

	@Column(name = "booking_status")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(name = "chatroomid")
	public String getChatroomid() {
		return chatroomid;
	}

	public void setChatroomid(String chatroomid) {
		this.chatroomid = chatroomid;
	}
	
	@Column(name = "notification")
	public String getNotification() {
		return notification;
	}

	public void setNotification(String notification) {
		this.notification = notification;
	}
	
	@Column(name = "d_to_m_note")
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	
	@Column(name = "breakfast1")
	public String getBreakfast1() {
		return breakfast1;
	}

	public void setBreakfast1(String breakfast1) {
		this.breakfast1 = breakfast1;
	}

	
	@Column(name = "breakfast2")
	public String getBreakfast2() {
		return breakfast2;
	}

	public void setBreakfast2(String breakfast2) {
		this.breakfast2 = breakfast2;
	}

	
	@Column(name = "breakfast3")
	public String getBreakfast3() {
		return breakfast3;
	}

	public void setBreakfast3(String breakfast3) {
		this.breakfast3 = breakfast3;
	}

	
	@Column(name = "lunch1")
	public String getLunch1() {
		return lunch1;
	}

	public void setLunch1(String lunch1) {
		this.lunch1 = lunch1;
	}

	
	@Column(name = "lunch2")
	public String getLunch2() {
		return lunch2;
	}

	public void setLunch2(String lunch2) {
		this.lunch2 = lunch2;
	}

	
	@Column(name = "lunch3")
	public String getLunch3() {
		return lunch3;
	}

	public void setLunch3(String lunch3) {
		this.lunch3 = lunch3;
	}
	
	
	@Column(name = "dinner1")
	public String getDinner1() {
		return dinner1;
	}

	public void setDinner1(String dinner1) {
		this.dinner1 = dinner1;
	}

	
	@Column(name = "dinner2")
	public String getDinner2() {
		return dinner2;
	}

	public void setDinner2(String dinner2) {
		this.dinner2 = dinner2;
	}

	
	@Column(name = "dinner3")
	public String getDinner3() {
		return dinner3;
	}

	public void setDinner3(String dinner3) {
		this.dinner3 = dinner3;
	}
	

	@Column(name = "special1")
	public String getSpecial1() {
		return special1;
	}

	public void setSpecial1(String special1) {
		this.special1 = special1;
	}

	
	@Column(name = "special2")
	public String getSpecial2() {
		return special2;
	}

	public void setSpecial2(String special2) {
		this.special2 = special2;
	}

	
	@Column(name = "special3")
	public String getSpecial3() {
		return special3;
	}

	public void setSpecial3(String special3) {
		this.special3 = special3;
	}
	
	
}
