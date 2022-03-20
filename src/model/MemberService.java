package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberService {

	private static MemberDAO mDao;

	@Autowired
	public MemberService(MemberDAO mDao) {
		this.mDao = mDao;
	}

	public boolean checkLogin(Member users) {
		return mDao.checkLogin(users);
	}

	public String membernickName(Member users) {
		return mDao.membernickName(users);
	}

	public boolean checkmemberName(Member users) {
		return mDao.checkmemberName(users);
	}

	public boolean checknickName(Member users) {
		return mDao.checknickName(users);
	}

	public void insertinto(Member users) {
		mDao.insertinto(users);
	}

	public Member findByName(String users) {
		return mDao.findByName(users);
	}

	public void updateMember(Member users) {
		mDao.updateMember(users);
	}

	public void updatepassword(Member users) {
		mDao.updatepassword(users);
	}

	public Member findById(int memId) {
		return mDao.findById(memId);
	}
	
	/*新增 */
	public Member getMemberById(int m_id) {
		return mDao.getMemberById(m_id);
	}

//public  List<Member> newMember(int m_id){
//		
//		return mDao.newMember(m_id);
//	}

//	public void newRegister(Member users) {
//		mDao.newRegister(users);
//		
//	}

//	public static Member findByPrimaryKey(int key) {
//		return mDao.findByPrimaryKey(key);
//	}

	// public static void updateMember(Member users) {
	// return mDao.updateMember(users);
	// }

//	public void updateMember(Member users){
//		mDao.updateMember(users);
//		//return null;
//	}

//	public Member queryMember(String users) {
//		return mDao.queryMember(users);
//	}
//	
//	public int saveMember(Member users){
//		return mDao.saveMember(users);
//	}

}
