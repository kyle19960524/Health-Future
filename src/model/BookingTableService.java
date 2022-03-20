package model;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.TreeMap;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingTableService implements Comparator {
	private BookingTableDAO bDao;

	@Autowired
	public BookingTableService(BookingTableDAO bDao) {
		this.bDao = bDao;
	}

	public void delete(BookingTable bookingTable) {
		bDao.delete(bookingTable);
	}

	public void insertinto(BookingTable bookingTable) {
		bDao.insertinto(bookingTable);
	}

	public boolean searchName(String name) {
		return bDao.searchName(name);
	}

	public List<BookingTable> find(String name, String from, String to) {
		return bDao.find(name, from, to);
	}

	public void update(BookingTable bookingTable) {
		bDao.update(bookingTable);
	}

	public Map<String, String> dateAndtime(String[] dateAndtime) {
		Map<String, String> dateTime = new TreeMap<String, String>();
		List<String> temp = new ArrayList<String>();
		for (String each : dateAndtime) {
			StringTokenizer stD = new StringTokenizer(each, "/");
			while (stD.hasMoreTokens())
				temp.add(stD.nextToken());
		}
		temp.remove("0");
		for (int i = 0, j = 1; i < temp.size(); i += 2, j++) {
			if (j < 10) {
				dateTime.put("0" + j + ". " + temp.get(i).substring(4), temp.get(i + 1));
			} else {
				dateTime.put(j + ". " + temp.get(i).substring(4), temp.get(i + 1));
			}
		}
		return dateTime;
	}

	@Override
	public int compare(Object o1, Object o2) {
		BookingTable bt1 = (BookingTable) o1;
		BookingTable bt2 = (BookingTable) o2;

		int flag = bt1.getDate().compareTo(bt2.getDate());

		return flag;
	}

	public boolean checkIfBookingDoubleCancel(String memberName, String date, String time) {
		return bDao.checkIfBookingDoubleCancel(memberName, date, time);
	}

	public boolean checkIfBookingDouble(String memberName, String date, String time) {
		return bDao.checkIfBookingDouble(memberName, date, time);
	}

	public boolean findForCancel(String name, String date) {
		return bDao.findForCancel(name, date);
	}

	public List<BookingTable> findNotificationForNutri(int d_id, String d_name, String notification) {
		return bDao.findNotificationForNutri(d_id, d_name, notification);
	}

	public List<BookingTable> findNotificationForMem(int m_id, String m_name, String notification) {
		return bDao.findNotificationForMem(m_id, m_name, notification);
	}

	public void updateNotification(int id) {
		bDao.updateNotification(id);
	}

	public BookingTable findById(int id) {
		return bDao.findById(id);
	}

	public List<BookingTable> findByMemIdAndAfterToday(int memId, String today) {
		return bDao.findByMemIdAndAfterToday(memId, today);
	}

	public List<BookingTable> findByNutriIdAndAfterToday(int nutriId, String today) {
		return bDao.findByNutriIdAndAfterToday(nutriId, today);
	}

	public boolean checkBookingIfStatus(String nutriName, String date, String time) {
		return bDao.checkBookingIfStatus(nutriName, date, time);
	}

	public void cancelbookingAndnoteToMem(int bookingtableid, String notetomem) {
		bDao.cancelbookingAndnoteToMem(bookingtableid, notetomem);
	}

	public void deletebyId(int bookingtableid) {
		bDao.deletebyId(bookingtableid);
	}

	public void changeStatusToThree(int bookingtableid, String notetonutri) {
		bDao.changeStatusToThree(bookingtableid, notetonutri);
	}

	public void SendMailToNutriBookingSuccess(BookingTable bt) {
		try {

			// 初始設定，username 和 password 非必要
			Properties props = new Properties();
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", "smtp.gmail.com");

			props.setProperty("mail.user", "eeit111team5@gmail.com");
			props.setProperty("mail.password", "Do!ng123");

			props.setProperty("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.starttls.enable", "true");

			Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("eeit111team5@gmail.com", "Do!ng123");
				}
			});
			Transport transport = mailSession.getTransport();

			// 產生整封 email 的主體 message
			MimeMessage message = new MimeMessage(mailSession);

			// 設定主旨
			message.setSubject("HealthFuture BookingStatus To " + bt.getNutriName());

			// 文字部份，注意 img src 部份要用 cid:接下面附檔的header
			MimeBodyPart textPart = new MimeBodyPart();
			StringBuffer html = new StringBuffer();
			html.append("<h2>Dear Sir or Madam,</h2><br>");
			html.append("<h3>This is your booking time notification which is successfully booked.</h3><br>");
			html.append("<h3 style=\"color:red;\">Booking date:." + bt.getDate() + "</h3><br>");
			html.append("<h3 style=\"color:red;\">Booking time:." + bt.getEachTime() + "</h3><br>");
			html.append(
					"<h3>Please click the icon below and then you can check the details about the booking.</h3><br>");
			html.append(
					"<a href='http://localhost:8080/HealthFuture/turntoLogin.controller' title='check the details.'><img width='42' height='42' src='cid:image'/><br>");
			textPart.setContent(html.toString(), "text/html; charset=UTF-8");

			// 圖檔部份，注意 html 用 cid:image，則header要設<image>
			MimeBodyPart picturePart = new MimeBodyPart();
//			FileDataSource fds = new FileDataSource(
//					"D://DataSource//workspace//SpringWebWorkspace//HealthFuture//WebContent//resources//images//successBooking.jpg");
			
			FileDataSource fds = new FileDataSource(
					"D:\\DataSource\\workspace\\SpringWebWorkspace\\HealthFuture\\WebContent\\resources\\images\\successBooking.jpg");
			picturePart.setDataHandler(new DataHandler(fds));
			picturePart.setFileName(fds.getName());
			picturePart.setHeader("Content-ID", "<image>");

			Multipart email = new MimeMultipart();
			email.addBodyPart(textPart);
			email.addBodyPart(picturePart);

			message.setContent(email);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("team5testandy@gmail.com"));
			transport.connect();
			transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
			transport.close();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public void SendMailToNutriBookingCancel(BookingTable bt) {
		try {

			// 初始設定，username 和 password 非必要
			Properties props = new Properties();
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", "smtp.gmail.com");

			props.setProperty("mail.user", "eeit111team5@gmail.com");
			props.setProperty("mail.password", "Do!ng123");

			props.setProperty("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.starttls.enable", "true");

			Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("eeit111team5@gmail.com", "Do!ng123");
				}
			});
			Transport transport = mailSession.getTransport();

			// 產生整封 email 的主體 message
			MimeMessage message = new MimeMessage(mailSession);

			// 設定主旨
			message.setSubject("HealthFuture BookingStatus To " + bt.getNutriName());

			// 文字部份，注意 img src 部份要用 cid:接下面附檔的header
			MimeBodyPart textPart = new MimeBodyPart();
			StringBuffer html = new StringBuffer();
			html.append("<h2>Dear Sir or Madam,</h2><br>");
			html.append("<h3>This is your booking time notification which is canceled.</h3><br>");
			html.append("<h3 style=\"color:red;\">Booking date:." + bt.getDate() + "</h3><br>");
			html.append("<h3 style=\"color:red;\">Booking time:." + bt.getEachTime() + "</h3><br>");
			html.append(
					"<h3>Please click the icon below and then you can check the details about the booking.</h3><br>");
			html.append(
					"<a href='http://localhost:8080/HealthFuture/turntoLogin.controller' title='check the details.'><img width='42' height='42' src='cid:image'/><br>");
			textPart.setContent(html.toString(), "text/html; charset=UTF-8");

			// 圖檔部份，注意 html 用 cid:image，則header要設<image>
			MimeBodyPart picturePart = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(
					"D:\\DataSource\\workspace\\SpringWebWorkspace\\HealthFuture\\WebContent\\resources\\images\\cancelBooking.jpg");
			picturePart.setDataHandler(new DataHandler(fds));
			picturePart.setFileName(fds.getName());
			picturePart.setHeader("Content-ID", "<image>");

			Multipart email = new MimeMultipart();
			email.addBodyPart(textPart);
			email.addBodyPart(picturePart);

			message.setContent(email);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("team5testandy@gmail.com"));
			transport.connect();
			transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
			transport.close();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public void SendMailToMemBookingCancel(BookingTable bt) {
		try {

			// 初始設定，username 和 password 非必要
			Properties props = new Properties();
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", "smtp.gmail.com");

			props.setProperty("mail.user", "eeit111team5@gmail.com");
			props.setProperty("mail.password", "Do!ng123");

			props.setProperty("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.starttls.enable", "true");

			Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("eeit111team5@gmail.com", "Do!ng123");
				}
			});
			Transport transport = mailSession.getTransport();

			// 產生整封 email 的主體 message
			MimeMessage message = new MimeMessage(mailSession);

			// 設定主旨
			message.setSubject("HealthFuture BookingStatus To " + bt.getMemName());

			// 文字部份，注意 img src 部份要用 cid:接下面附檔的header
			MimeBodyPart textPart = new MimeBodyPart();
			StringBuffer html = new StringBuffer();
			html.append("<h2>Dear Sir or Madam,</h2><br>");
			html.append("<h3>This is your booking time notification which is canceled.</h3><br>");
			html.append("<h3 style=\"color:red;\">Booking date:." + bt.getDate() + "</h3><br>");
			html.append("<h3 style=\"color:red;\">Booking time:." + bt.getEachTime() + "</h3><br>");
			html.append(
					"<h3>Please click the icon below and then you can check the details about the booking.</h3><br>");
			html.append(
					"<a href='http://localhost:8080/HealthFuture/turntoMember.controller' title='check the details.'><img width='45' height='45' src='cid:image'/><br>");
			textPart.setContent(html.toString(), "text/html; charset=UTF-8");

			// 圖檔部份，注意 html 用 cid:image，則header要設<image>
			MimeBodyPart picturePart = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(
					"D:\\DataSource\\workspace\\SpringWebWorkspace\\HealthFuture\\WebContent\\resources\\images\\cancelBooking.jpg");
			picturePart.setDataHandler(new DataHandler(fds));
			picturePart.setFileName(fds.getName());
			picturePart.setHeader("Content-ID", "<image>");

			Multipart email = new MimeMultipart();
			email.addBodyPart(textPart);
			email.addBodyPart(picturePart);

			message.setContent(email);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("team5testandy@gmail.com"));
			transport.connect();
			transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
			transport.close();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public int findThisMemberThisDateBookingSize(int memId, String today) {
		return bDao.findThisMemberThisDateBookingSize(memId, today);
	}
	
	public List<BookingTable> findNutriBookingTime(String nutriName,String date){
		return bDao.findNutriBookingTime(nutriName, date);
	}

	// andy新增方法

	public void insertRecipe(BookingTable bookingTable) {
		bDao.insertRecipe(bookingTable);
	}

	public BookingTable selectRecipe(BookingTable bookingTable) {
		BookingTable list = bDao.selectRecipe(bookingTable);
		return list;
	}

}
