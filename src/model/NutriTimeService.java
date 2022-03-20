package model;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NutriTimeService {
	private NutriTimeDAO nDao;

	@Autowired
	public NutriTimeService(NutriTimeDAO nDao) {
		this.nDao = nDao;
	}

	public void insertinto(NutriTime nutriTime) {
		nDao.insertinto(nutriTime);
	}

	public List<NutriTime> search() {
		return nDao.search();
	}

	public boolean checkDate(NutriTime nutriTime) {
		return nDao.checkDate(nutriTime);
	}

	public void update(NutriTime nutriTime) {
		nDao.update(nutriTime);
	}

	public List<NutriTime> datePlus(String start, String end, String name) {
		return nDao.datePlus(start, end, name);
	}

	public void delete(String name, String date) {
		nDao.delete(name, date);
	}

	public String date(String nutridate) {
		List<String> datetemp = new ArrayList<>();
		StringTokenizer stD = new StringTokenizer(nutridate, "/");
		while (stD.hasMoreTokens())
			datetemp.add(stD.nextToken());
		String year = datetemp.get(2);
		String month = datetemp.get(0);
		String day = datetemp.get(1);
		String date = String.valueOf(year) + "-" + month + "-" + day;
		System.out.println(date);
		return date;
	}

	public List<String> timetemp(String nutritime) {
		List<String> timetemp = new ArrayList<>();
		StringTokenizer stT = new StringTokenizer(nutritime, ",");
		while (stT.hasMoreTokens())
			timetemp.add(stT.nextToken());
		timetemp.remove(0);
		return timetemp;
	}

	public String mapvalue(int timenum) {
		switch (timenum) {
		case 10:
			return "10:00-11:00";
		case 11:
			return "11:00-12:00";
		case 12:
			return "12:00-13:00";
		case 13:
			return "13:00-14:00";
		case 14:
			return "14:00-15:00";
		case 15:
			return "15:00-16:00";
		case 16:
			return "16:00-17:00";
		case 17:
			return "17:00-18:00";
		case 18:
			return "18:00-19:00";
		case 19:
			return "19:00-20:00";
		case 20:
			return "20:00-21:00";
		case 21:
			return "21:00-22:00";
		}
		return "";
	}

	public String searchbyIdAndDate(int d_id, String date) {
		return nDao.searchbyIdAndDate(d_id, date);
	}

	public void updateNewTime(int d_id, String date, String newTime) {
		nDao.updateNewTime(d_id, date, newTime);
	}
}
