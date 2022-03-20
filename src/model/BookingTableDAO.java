package model;

import java.sql.ResultSet;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.sql.QuerySelect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class BookingTableDAO {

	private SessionFactory sessionFactory;

	@Autowired
	public BookingTableDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void delete(BookingTable bookingTable) {
		String hql = "Delete BookingTable Where d_name=:name and available_date=:date";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("name", bookingTable.getNutriName());
		query.setParameter("date", bookingTable.getDate());
		query.executeUpdate();
	}

	public void insertinto(BookingTable bookingTable) {
		BookingTable bt = new BookingTable();
		bt.setNutriId(bookingTable.getNutriId());
		bt.setNutriName(bookingTable.getNutriName());
		bt.setDate(bookingTable.getDate());
		bt.setEachTime(bookingTable.getEachTime());
		sessionFactory.getCurrentSession().save(bt);
	}

	public boolean searchName(String name) {
		String hql = "From BookingTable Where d_name=:name";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("name", name);
		List<BookingTable> results = query.list();
		if (results.size() == 0) {
			return false;
		} else {
			return true;
		}
	}

	public List<BookingTable> find(String name, String from, String to) {
		String hql = "FROM BookingTable Where available_date>=:start And available_date<=:end And d_name=:name And (booking_status=0 or booking_status=3)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("start", from);
		query.setParameter("end", to);
		query.setParameter("name", name);
		List<BookingTable> results = query.list();
		return results;
	}

	public boolean findForCancel(String name, String date) {
		String hql = "FROM BookingTable Where available_date=:date And d_name=:name And (booking_status=1 or booking_status=3)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("date", date);
		query.setParameter("name", name);
		List<BookingTable> results = query.list();
		if (results.size() == 0) {
			return true;
		} else {
			return false;
		}
	}

	public void update(BookingTable bookingTable) {
		String hql = "Update BookingTable Set m_id=:mid, m_name=:mname, booking_status=1, chatroomid=:cid, notification=:num, d_to_m_note=:note Where d_name=:dname and available_date=:date and available_eachtime=:time";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("mid", bookingTable.getMemId());
		query.setParameter("mname", bookingTable.getMemName());
		query.setParameter("dname", bookingTable.getNutriName());
		query.setParameter("date", bookingTable.getDate());
		query.setParameter("time", bookingTable.getEachTime());
		query.setParameter("cid", bookingTable.getChatroomid());
		query.setParameter("num", bookingTable.getNotification());
		query.setParameter("note", bookingTable.getNote());
		query.executeUpdate();
	}
	
	public boolean checkIfBookingDoubleCancel(String memberName, String date, String time) {
		String hql = "FROM BookingTable Where m_name=:mname And available_date=:date And available_eachtime=:time And booking_status=3";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("mname", memberName);
		query.setParameter("date", date);
		query.setParameter("time", time);
		List results = query.list();
		if (results.size() == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean checkIfBookingDouble(String memberName, String date, String time) {
		String hql = "FROM BookingTable Where m_name=:mname And available_date=:date And available_eachtime=:time And booking_status=1";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("mname", memberName);
		query.setParameter("date", date);
		query.setParameter("time", time);
		List results = query.list();
		if (results.size() == 0) {
			return false;
		} else {
			return true;
		}
	}

	public List<BookingTable> findNotificationForNutri(int d_id, String d_name, String notification) {
		String hql = "FROM BookingTable Where notification=:num and d_id=:id and d_name=:name and (booking_status=1 or booking_status=3)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("num", notification);
		query.setParameter("id", d_id);
		query.setParameter("name", d_name);
		List<BookingTable> results = query.list();
		if (results.size() == 0) {
			return null;
		} else {
			return results;
		}
	}
	
	public List<BookingTable> findNotificationForMem(int m_id, String m_name, String notification) {
		String hql = "FROM BookingTable Where notification=:num and m_id=:id and m_name=:name and booking_status=2";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("num", notification);
		query.setParameter("id", m_id);
		query.setParameter("name", m_name);
		List<BookingTable> results = query.list();
		if (results.size() == 0) {
			return null;
		} else {
			return results;
		}
	}

	public void updateNotification(int id) {
		String hql = "Update BookingTable Set notification=:num Where id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("num", "0");
		query.setParameter("id", id);
		query.executeUpdate();
	}

	public BookingTable findById(int id) {
		String hql = "FROM BookingTable Where id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		List<BookingTable> results = query.list();
		return results.get(0);
	}

	public List<BookingTable> findByMemIdAndAfterToday(int memId, String today) {
		String hql = "FROM BookingTable Where m_id=:id and available_date>=:today";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", memId);
		query.setParameter("today", today);
		List<BookingTable> results = query.list();
		return results;
	}

	public List<BookingTable> findByNutriIdAndAfterToday(int nutriId, String today) {
		String hql = "FROM BookingTable Where d_id=:id and available_date>=:today";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", nutriId);
		query.setParameter("today", today);
		List<BookingTable> results = query.list();
		return results;
	}

	public boolean checkBookingIfStatus(String nutriName, String date, String time) {
		String hql = "FROM BookingTable Where d_name=:name and available_date=:date and available_eachtime=:time and booking_status!=0";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("name", nutriName);
		query.setParameter("date", date);
		query.setParameter("time", time);
		List<BookingTable> results = query.list();
		if (results.size() != 0) {
			return true;
		} else {
			return false;
		}
	}

	public void cancelbookingAndnoteToMem(int bookingtableid, String notetomem) {
		String hql = "Update BookingTable Set booking_status=2,notification=:num, chatroomid=null,d_to_m_note=:note Where id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("num", "1");
		query.setParameter("note", notetomem);
		query.setParameter("id", bookingtableid);
		query.executeUpdate();
	}
	
	public void deletebyId(int bookingtableid) {
		String hql = "Delete BookingTable Where id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", bookingtableid);
		query.executeUpdate();
	}
	
	public void changeStatusToThree(int bookingtableid,String notetonutri) {
		String hql = "Update BookingTable Set booking_status=3,notification=:num, chatroomid=null,d_to_m_note=:note Where id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("num", "1");
		query.setParameter("note", notetonutri);
		query.setParameter("id", bookingtableid);
		query.executeUpdate();
	}
	
	public int findThisMemberThisDateBookingSize(int memId,String today) {
		String hql ="from BookingTable where m_id=:mid and available_date=:today";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("mid", memId);
		query.setParameter("today", today);
		List<BookingTable> results = query.list();
		return results.size();
	}
	
	public List<BookingTable> findNutriBookingTime(String nutriName,String date){
		String hql = "FROM BookingTable Where d_name=:name and available_date>:date ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("name", nutriName);
		query.setParameter("date", date);
		List<BookingTable> results = query.list();
		return results;
	}
	
	//andy新增方法
	public void insertRecipe(BookingTable bookingTable) {
		
		String hql = "Update BookingTable Set breakfast1=:breakfast1 ,breakfast2=:breakfast2 ,breakfast3=:breakfast3 ,"
				+ "lunch1=:lunch1 ,lunch2=:lunch2 ,lunch3=:lunch3 ,dinner1=:dinner1 ,dinner2=:dinner2 ,dinner3=:dinner3 ,"
				+"special1=:special1 ,special2=:special2,special3=:special3 where chatroomid=:chatroomid ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		
		query.setParameter("breakfast1", bookingTable.getBreakfast1());
		query.setParameter("breakfast2", bookingTable.getBreakfast2());
		query.setParameter("breakfast3", bookingTable.getBreakfast3());
		
		query.setParameter("lunch1", bookingTable.getLunch1());
		query.setParameter("lunch2", bookingTable.getLunch2());
		query.setParameter("lunch3", bookingTable.getLunch3());
		
		query.setParameter("dinner1", bookingTable.getDinner1());
		query.setParameter("dinner2", bookingTable.getDinner2());
		query.setParameter("dinner3", bookingTable.getDinner3());
		
		query.setParameter("special1", bookingTable.getSpecial1());
		query.setParameter("special2", bookingTable.getSpecial2());
		query.setParameter("special3", bookingTable.getSpecial3());
		query.setParameter("chatroomid", bookingTable.getChatroomid());
		
		
		query.executeUpdate();
		
	}
	
	public BookingTable selectRecipe(BookingTable bookingTable) {
		String hql ="from BookingTable where chatroomid=:chatroomid";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("chatroomid", bookingTable.getChatroomid());
		List<BookingTable> results = query.list();
		
		System.out.println(bookingTable.getChatroomid());
		return  results.get(0);
	}
	
	
	
//	public BookingTable findById(int id) {
//		String hql = "FROM BookingTable Where id=:id";
//		Query query = sessionFactory.getCurrentSession().createQuery(hql);
//		query.setParameter("id", id);
//		List<BookingTable> results = query.list();
//		return results.get(0);
//	
	
}
