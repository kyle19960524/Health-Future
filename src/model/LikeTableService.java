package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeTableService {
	private LikeTableDAO lDao;

	@Autowired
	public LikeTableService(LikeTableDAO lDao) {
		this.lDao = lDao;
	}

	public boolean findByPostIdAndMemberId(int postId, int memId) {
		return lDao.findByPostIdAndMemberId(postId, memId);
	}

	public void insertLike(LikeTable lt) {
		lDao.insertLike(lt);
	}

	public void deleteLike(LikeTable lt) {
		lDao.deleteLike(lt);
	}

	public void deleteByPostId(int postId) {
		lDao.deleteByPostId(postId);
	}

	public List<LikeTable> findByPostId(int postId) {
		return lDao.findByPostId(postId);
	}
}
