package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LikeTable")
public class LikeTable {
	private int likeId;
	private int postId;
	private int memId;
	private String memName;
	private String memFileName;

	public LikeTable() {

	}

	public LikeTable(int postId, int memId, String memName,String memFileName) {
		this.postId = postId;
		this.memId = memId;
		this.memName = memName;
		this.memFileName = memFileName;
	}

	@Id
	@Column(name = "like_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getLikeId() {
		return likeId;
	}

	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}

	@Column(name = "post_id")
	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
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
	
	@Column(name = "m_fileName")
	public String getMemFileName() {
		return memFileName;
	}

	public void setMemFileName(String memFileName) {
		this.memFileName = memFileName;
	}

}
