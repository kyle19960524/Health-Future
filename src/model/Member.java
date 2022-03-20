package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Member")
@Component
public class Member {

	private Integer m_id;
	private String m_fullname;
	private String m_useraccount;
	private String m_password;
	private String m_nickname;
	private String m_idcard;
	private String m_sex;
	private String m_birthday;
	private String m_height;
	private String m_weight;
	private String m_location;
	private String m_cellphone;
	private String m_email;
	
	private String path;
	private byte[] photo;
	private String fileName;
	
	private Integer status;
	
	public Member() { 
		
	}
	
	public Member(String m_useraccount) {
		this.m_useraccount = m_useraccount;
	}
	
	public Member(String m_useraccount, String m_password) {
		this.m_useraccount = m_useraccount;
		this.m_password = m_password;
	}
	
	public Member(String m_useraccount, String m_email, String m_idcard) {
		this.m_useraccount = m_useraccount;
		this.m_email = m_email;
		this.m_idcard=m_idcard;
	}

	
	public Member(String m_useraccount, String m_password, String m_fullname, String m_nickname, String m_idcard, String m_sex, String m_birthday, String m_height, String m_weight, String m_location, String m_cellphone, String m_email, String m_path, byte[] photo) {
		this.m_useraccount = m_useraccount;
		this.m_password = m_password;
		this.m_fullname = m_fullname;
		this.m_nickname = m_nickname;
		this.m_idcard = m_idcard;
		this.m_sex = m_sex;
		this.m_birthday = m_birthday;
		this.m_height = m_height;
		this.m_weight = m_weight;
		this.m_location = m_location;
		this.m_cellphone = m_cellphone;
		this.m_email = m_email;
		this.path=m_path;
		this.photo=photo;
	}
	
	public Member(String m_useraccount, String m_password, String m_fullname, String m_nickname, String m_idcard, String m_sex, String m_birthday, String m_height, String m_weight, String m_location, String m_cellphone, String m_email, String m_path) {
		this.m_useraccount = m_useraccount;
		this.m_password = m_password;
		this.m_fullname = m_fullname;
		this.m_nickname = m_nickname;
		this.m_idcard = m_idcard;
		this.m_sex = m_sex;
		this.m_birthday = m_birthday;
		this.m_height = m_height;
		this.m_weight = m_weight;
		this.m_location = m_location;
		this.m_cellphone = m_cellphone;
		this.m_email = m_email;
		this.path=m_path;
	}

	public Member(String m_useraccount, String m_password, String m_fullname, String m_nickname, String m_sex, String m_birthday, String m_height, String m_weight, String m_location, String m_cellphone, String m_email, byte[] photo) {
		this.m_useraccount = m_useraccount;
		this.m_password = m_password;
		this.m_fullname = m_fullname;
		this.m_nickname = m_nickname;
//		this.m_idcard = m_idcard;
		this.m_sex = m_sex;
		this.m_birthday = m_birthday;
		this.m_height = m_height;
		this.m_weight = m_weight;
		this.m_location = m_location;
		this.m_cellphone = m_cellphone;
		this.m_email = m_email;
		this.photo=photo;
	}
	
	public Member(String m_useraccount, String m_password, String m_fullname, String m_nickname, String m_idcard, String m_sex, String m_birthday, String m_height, String m_weight, String m_location, String m_cellphone, String m_email, byte[] photo) {
		this.m_useraccount = m_useraccount;
		this.m_password = m_password;
		this.m_fullname = m_fullname;
		this.m_nickname = m_nickname;
		this.m_idcard = m_idcard;
		this.m_sex = m_sex;
		this.m_birthday = m_birthday;
		this.m_height = m_height;
		this.m_weight = m_weight;
		this.m_location = m_location;
		this.m_cellphone = m_cellphone;
		this.m_email = m_email;
		this.photo=photo;
	}
	
	
	public Member(String m_useraccount, String m_password, String m_fullname, String m_nickname, String m_idcard, String m_sex, String m_birthday, String m_height, String m_weight, String m_location, String m_cellphone, String m_email) {
		this.m_useraccount = m_useraccount;
		this.m_password = m_password;
		this.m_fullname = m_fullname;
		this.m_nickname = m_nickname;
		this.m_idcard = m_idcard;
		this.m_sex = m_sex;
		this.m_birthday = m_birthday;
		this.m_height = m_height;
		this.m_weight = m_weight;
		this.m_location = m_location;
		this.m_cellphone = m_cellphone;
		this.m_email = m_email;
	}
	
	public Member(String m_useraccount, String m_password, String m_fullname, String m_nickname, String m_sex, String m_birthday, String m_height, String m_weight, String m_location, String m_cellphone, String m_email) {
		this.m_useraccount = m_useraccount;
		this.m_password = m_password;
		this.m_fullname = m_fullname;
		this.m_nickname = m_nickname;
//		this.m_idcard = m_idcard;
		this.m_sex = m_sex;
		this.m_birthday = m_birthday;
		this.m_height = m_height;
		this.m_weight = m_weight;
		this.m_location = m_location;
		this.m_cellphone = m_cellphone;
		this.m_email = m_email;
//		this.photo=photo;
	}

	@Id
	@Column(name = "m_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return m_id;
	}

	public void setId(Integer m_id) {
		this.m_id = m_id;
	}

	@Column(name="m_useraccount")
	public String getUserAccount() {
		return m_useraccount;
	}

	public void setUserAccount(String m_useraccount) {
		this.m_useraccount = m_useraccount;
	}

	@Column(name="m_password")
	public String getUserPwd() {
		return m_password;
	}

	public void setUserPwd(String m_password) {
		this.m_password = m_password;
	}

	@Column(name = "m_fullname")
	public String getFullName() {
		return m_fullname;
	}

	public void setFullName(String m_fullname) {
		this.m_fullname = m_fullname;
	}
	
	@Column(name = "m_nickname")
	public String getNickName() {
		return m_nickname;
	}

	public void setNickName(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	@Column(name = "m_idcard")
	public String getIdCard() {
		return m_idcard;
	}

	public void setIdCard(String m_idcard) {
		this.m_idcard = m_idcard;
	}
	
	@Column(name = "m_sex")
	public String getSex() {
		return m_sex;
	}

	public void setSex(String m_sex) {
		this.m_sex = m_sex;
	}

	@Column(name = "m_birthday")
	public String getBirthday() {
		return m_birthday;
	}

	public void setBirthday(String m_birthday) {
		this.m_birthday = m_birthday;
	}
	
	@Column(name = "m_height")
	public String getHeight() {
		return m_height;
	}

	public void setHeight(String m_height) {
		this.m_height = m_height;
	}
	
	@Column(name = "m_weight")
	public String getWeight() {
		return m_weight;
	}

	public void setWeight(String m_weight) {
		this.m_weight = m_weight;
	}
	
	@Column(name = "m_location")
	public String getLocation() {
		return m_location;
	}

	public void setLocation(String m_location) {
		this.m_location = m_location;
	}
	
	@Column(name = "m_cellphone")
	public String getCellphone() {
		return m_cellphone;
	}

	public void setCellphone(String m_cellphone) {
		this.m_cellphone = m_cellphone;
	}
	
	@Column(name = "m_email")
	public String getEmail() {
		return m_email;
	}

	public void setEmail(String m_email) {
		this.m_email = m_email;
	}
	
	@Column(name="m_picture")
	public byte[] getPhoto() {
		return photo;
	}


	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	@Column(name="m_path")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
	public void put(Integer m_id, Member member) {
		this.m_id = m_id;
		
	}
	
	@Column(name="d_status")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	@Column(name="m_fileName")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
