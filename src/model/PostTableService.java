package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostTableService {
	PostTableDAO pDao;

	@Autowired
	public PostTableService(PostTableDAO pDao) {
		this.pDao = pDao;
	}

	public void insertinto(PostTable postTable) {
		pDao.insertinto(postTable);
	}

	public List<PostTable> findAllPost() {
		return pDao.findAllPost();
	}

	public String getDateTime() {
		Date date = new Date();
		SimpleDateFormat simpleDateFormatArrivals = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.UK);
		System.out.println(simpleDateFormatArrivals.format(date));
		return simpleDateFormatArrivals.format(date);
	}

	public PostTable findById(int postId) {
		return pDao.findById(postId);
	}

	public void updateMessageAmount(int postId, int changeMessageAmount) {
		pDao.updateMessageAmount(postId, changeMessageAmount);
	}

	public List<PostTable> findByMemIdPost(int memId) {
		return pDao.findByMemIdPost(memId);
	}
	
	public void deleteByPostId(int postId) {
		pDao.deleteByPostId(postId);
	}
	
	public void updatePost(int postId,String descrip,String savaPath,String fileName) {
		pDao.updatePost(postId, descrip, savaPath, fileName);
	}

}
