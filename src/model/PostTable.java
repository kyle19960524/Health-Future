package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;

@Entity
@Table(name = "PostTable")
public class PostTable {
	private int postId;
	private String imagePath;
	private String description;
	private String postTime;
	private int memId;
	private int nutriId;
	private String fileName;
	private String memName;
	private String nutriName;
	private String memArea;
	private int likeAmount;
	private int messageAmount;
	private int likeStatus;

	public PostTable() {

	}

	public PostTable(String imagePath, String description, String postTime, int memId, String fileName,
			String memName,String memArea) {
		this.imagePath = imagePath;
		this.description = description;
		this.postTime = postTime;
		this.memId = memId;
		this.fileName = fileName;
		this.memName = memName;
		this.memArea = memArea;
	}

	@Id
	@Column(name = "post_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	@Column(name = "imagePath")
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String image) {
		this.imagePath = image;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "post_time")
	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

	@Column(name = "m_id")
	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	@Column(name = "d_id")
	public int getNutriId() {
		return nutriId;
	}

	public void setNutriId(int nutriId) {
		this.nutriId = nutriId;
	}

	@Column(name = "fileName")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "m_name")
	public String getMemName() {
		return memName;
	}

	
	public void setMemName(String memName) {
		this.memName = memName;
	}
	
	@Column(name = "n_name")
	public String getNutriName() {
		return nutriName;
	}

	public void setNutriName(String nutriName) {
		this.nutriName = nutriName;
	}

	@Column(name = "m_area")
	public String getMemArea() {
		return memArea;
	}

	public void setMemArea(String memArea) {
		this.memArea = memArea;
	}
	
	@Column(name = "like_amount")
	public int getLikeAmount() {
		return likeAmount;
	}

	public void setLikeAmount(int likeAmount) {
		this.likeAmount = likeAmount;
	}
	
	@Column(name = "message_amount")
	public int getMessageAmount() {
		return messageAmount;
	}

	public void setMessageAmount(int messageAmount) {
		this.messageAmount = messageAmount;
	}
	
	@Column(name = "like_status")
	public int getLikeStatus() {
		return likeStatus;
	}

	public void setLikeStatus(int likeStatus) {
		this.likeStatus = likeStatus;
	}

}
