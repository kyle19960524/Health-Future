package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Dietitian")
public class Users {
	private int id;
	private String account;
	private String userPassword;
	private String name;
	private String gender;
	private String area;
	private String education;
	private String experience;
	private String phone;
	private String cellphone;
	private String email;
	private String birthday;
	private String license;
	private String iden;
	private String path1;
	private String path2;
	

	private byte[] photo;
	private byte[] certific;


	//	private String filename;
//	private String filename2;
	private int status;

	

	
	
	

	public Users() {

	}

	public Users(String account, String email,String iden) {
		this.account = account;
		this.email = email;
		this.iden=iden;
	}
	
	public Users(String account, String userPassword) {
		this.account = account;
		this.userPassword = userPassword;
	}

	public Users(String account, String userPassword, String name, String gender, String education,String experience, String phone,
			String cellphone, String email, String birthday,  String iden, 
			String area) {
		
		this.account = account;
		this.userPassword = userPassword;
		this.name = name;
		this.gender = gender;
		this.education=education;
		this.experience=experience;
		this.phone=phone;
		this.cellphone=cellphone;
		this.email=email;
		this.birthday=birthday;
		this.license=license;
		this.iden=iden;
		this.photo=photo;
		this.area = area;
	}

	@Id
	@Column(name = "d_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	
	
	@Column(name = "d_useraccount")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "d_password")
	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Column(name = "d_fullname")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "d_sex")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "d_address")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	
	@Column(name="d_education")
	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	@Column(name="d_experience")
	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	
	@Column(name="d_phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name="d_cellphone")
	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	
	@Column(name="d_email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name="d_birthday")
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	
	

	
	@Column(name="d_idcard")
	public String getIden() {
		return iden;
	}

	public void setIden(String iden) {
		this.iden = iden;
	}

	
	@Column(name="d_picture")
	public byte[] getPhoto() {
		return photo;
	}


	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	@Column(name="d_certification")
	public byte[] getCertific() {
		return certific;
	}

	public void setCertific(byte[] certific) {
		this.certific = certific;
	}
	
	@Column(name="d_status")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	@Column(name="d_path1")
	public String getPath1() {
		return path1;
	}

	public void setPath1(String path1) {
		this.path1 = path1;
	}

	@Column(name="d_path2")
	public String getPath2() {
		return path2;
	}

	public void setPath2(String path2) {
		this.path2 = path2;
	}

}
