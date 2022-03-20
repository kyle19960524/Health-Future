package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MessageTable")
public class MessageTable {
	private int messageId;
	private int postId;
	private int memId;
	private String messageContent;
	private String messageTime;
	private String memName;
	private String tempTime;
	
	public MessageTable() {
		
	}
	
	public MessageTable(int postId, int memId, String messageContent, String messageTime, String memName) {
		this.postId = postId;
		this.memId = memId;
		this.messageContent = messageContent;
		this.messageTime = messageTime;
		this.memName = memName;
	}

	@Id
	@Column(name = "message_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
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

	@Column(name = "message_content")
	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	@Column(name = "message_time")
	public String getMessageTime() {
		return messageTime;
	}

	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}

	@Column(name = "m_name")
	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}
	
	@Column(name = "temp_time")
	public String getTempTime() {
		return tempTime;
	}

	public void setTempTime(String tempTime) {
		this.tempTime = tempTime;
	}
}
