package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageTableService {
	private MessageTableDAO msDao;

	@Autowired
	public MessageTableService(MessageTableDAO msDao) {
		this.msDao = msDao;
	}

	public List<MessageTable> findByPostId(int postTableId) {
		return msDao.findByPostId(postTableId);
	}

	public void insertMessage(MessageTable mt) {
		msDao.insertMessage(mt);
	}
	
	public void deleteByPostId(int postId) {
		msDao.deleteByPostId(postId);
	}
}
