package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import model.LikeTable;
import model.LikeTableService;
import model.MemberService;
import model.MessageTable;
import model.MessageTableService;
import model.PostTable;
import model.PostTableService;
import util.TimeCount;

@Controller
public class PostFoodController {
	private PostTableService pService;
	private MemberService mService;
	private MessageTableService mtService;
	private LikeTableService lService;

	@Autowired
	public PostFoodController(PostTableService pService, MemberService mService, MessageTableService mtService,
			LikeTableService lService) {
		this.pService = pService;
		this.mService = mService;
		this.mtService = mtService;
		this.lService = lService;
	}

	@RequestMapping(path = "/posting.controller", method = RequestMethod.POST)
	public String post(@RequestParam(name = "descrip") String descrip, @RequestParam(name = "file0") MultipartFile file,
			Model m, @SessionAttribute(name = "memberfullname") String memName,
			@SessionAttribute(name = "memberid") int memId) throws Exception, IOException {
		System.out.println(descrip);
		String fileName = file.getOriginalFilename();
		System.out.println("fileName=" + fileName);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		String savePath = "D:\\DataSource\\workspace\\SpringWebWorkspace\\HealthFuture\\WebContent\\resources\\images\\posting\\" + fileName;
		//String savePath = "D://DataSource//workspace//SpringWebWorkspace//HealthFuture//WebContent//resources//images//posting//"+ fileName;
		System.out.println("savePath=" + savePath);
		file.transferTo(new File(savePath));
		System.out.println(pService.getDateTime());
		pService.insertinto(new PostTable(savePath, descrip, pService.getDateTime(), memId, fileName, memName,
				mService.findById(memId).getLocation()));
		List<PostTable> forLike = pService.findAllPost();
		for (PostTable ptEach : forLike) {
			if (lService.findByPostIdAndMemberId(ptEach.getPostId(), memId)) {
				ptEach.setLikeStatus(1);
			} else {
				ptEach.setLikeStatus(0);
				System.out.println("此會員在這則貼文無按讚紀錄");
			}

		}
		List<String> allPostMemFileName = new ArrayList<String>();
		List<String> tempTime = new ArrayList<String>();
		for (PostTable pt : pService.findAllPost()) {
			tempTime.add(TimeCount.format(pt.getPostTime()));
			allPostMemFileName.add(mService.findById(pt.getMemId()).getFileName());
		}
		m.addAttribute("memHeadPicture", allPostMemFileName);
		m.addAttribute("timeCount", tempTime);
		m.addAttribute("allPost", pService.findAllPost());

		Thread.sleep(5000);
		return "/Post/NewsFeed";
	}

	@RequestMapping(path = "/socialAll.controller")
	public String showAllPost(@SessionAttribute(name = "memberid") int memId, Model m) throws Exception {
		List<String> allPostMemFileName = new ArrayList<String>();
		List<String> tempTime = new ArrayList<String>();
		for (PostTable pt : pService.findAllPost()) {
			tempTime.add(TimeCount.format(pt.getPostTime()));
			allPostMemFileName.add(mService.findById(pt.getMemId()).getFileName());
		}
		List<PostTable> forLike = pService.findAllPost();
		for (PostTable ptEach : forLike) {
			if (lService.findByPostIdAndMemberId(ptEach.getPostId(), memId)) {
				ptEach.setLikeStatus(1);
			} else {
				ptEach.setLikeStatus(0);
				System.out.println("此會員在這則貼文無按讚紀錄");
			}

		}

		m.addAttribute("memHeadPicture", allPostMemFileName);
		m.addAttribute("timeCount", tempTime);
		m.addAttribute("allPost", pService.findAllPost());
		return "/Post/NewsFeed";
	}

	@ResponseBody
	@RequestMapping("/messageAll.controller")
	public List<MessageTable> returnAllMessage(@RequestParam(name = "id") int postTableId) throws Exception {
		List<MessageTable> msT = mtService.findByPostId(postTableId);
		for (int i = 0; i < msT.size(); i++) {
			msT.get(i).setTempTime(TimeCount.format(msT.get(i).getMessageTime()));
		}
		return msT;
	}

	@ResponseBody
	@RequestMapping("/comment.controller")
	public Map<String, String> comment(@RequestParam(name = "id") int postTableId,
			@RequestParam(name = "content") String comment, @SessionAttribute(name = "memberfullname") String memName,
			@SessionAttribute(name = "memberid") int memId) throws Exception {
		String now = pService.getDateTime();
		MessageTable mt = new MessageTable(postTableId, memId, comment, now, memName);
		mtService.insertMessage(mt);
		int changeMessageAmount = pService.findById(postTableId).getMessageAmount() + 1;
		pService.updateMessageAmount(postTableId, changeMessageAmount);
		Map<String, String> returnMap = new HashMap<String, String>();
		returnMap.put("postId", Integer.toString(postTableId));
		returnMap.put("messageAmount", Integer.toString(changeMessageAmount));
		returnMap.put("comment", comment);
		returnMap.put("memName", memName);
		returnMap.put("tempTime", "1秒前");
		return returnMap;
	}

	@ResponseBody
	@RequestMapping("/like.controller")
	public Map<String, String> like(@RequestParam(name = "postId") int postId,
			@RequestParam(name = "status") int status, @SessionAttribute(name = "memberid") int memId,
			@SessionAttribute(name = "memberfullname") String memName,
			@SessionAttribute(name = "memFileName") String memFileName) throws Exception {
		System.out.println(postId);
		System.out.println(status);
		Map<String, String> returnMap = new HashMap<String, String>();
		PostTable pt = pService.findById(postId);
		int changeLikeAmount;
		if (status == 0) {
			changeLikeAmount = pt.getLikeAmount() + 1;
			lService.insertLike(new LikeTable(postId, memId, memName,memFileName));
			pt.setLikeAmount(changeLikeAmount);
			status = 1;
			returnMap.put("postId", Integer.toString(postId));
			returnMap.put("status", Integer.toString(status));
			returnMap.put("changeLikeAmount", Integer.toString(changeLikeAmount));
			return returnMap;
		} else {
			changeLikeAmount = pt.getLikeAmount() - 1;
			lService.deleteLike(new LikeTable(postId, memId, memName,memFileName));
			pt.setLikeAmount(changeLikeAmount);
			status = 0;
			returnMap.put("postId", Integer.toString(postId));
			returnMap.put("status", Integer.toString(status));
			returnMap.put("changeLikeAmount", Integer.toString(changeLikeAmount));
			return returnMap;
		}

	}

	@ResponseBody
	@RequestMapping("/likeAll.controller")
	public List<LikeTable> likeAll(@RequestParam(name = "postId") int postId) throws Exception {
		return lService.findByPostId(postId);
	}

	@RequestMapping(path = "/memAllPost.controller", method = RequestMethod.POST)
	public String showMemAllPost(@RequestParam(name = "memId") int memId,
			@RequestParam(name = "memName") String memName, Model m) throws Exception {
		Map<String, String> dataMap = new HashMap<String, String>();
		String photoAmount = String.valueOf(pService.findByMemIdPost(memId).size());
		List<String> tempTime = new ArrayList<String>();
		for (PostTable pt : pService.findByMemIdPost(memId)) {
			tempTime.add(TimeCount.format(pt.getPostTime()));
		}
		m.addAttribute("timeCount", tempTime);
		dataMap.put("memId",String.valueOf(memId));
		dataMap.put("memFileName", mService.findById(memId).getFileName());
		dataMap.put("photoNum", photoAmount);
		dataMap.put("memName", memName);
		m.addAttribute("dataMap", dataMap);
		m.addAttribute("memPost", pService.findByMemIdPost(memId));
		return "/Post/ProfilePost";
	}

	@RequestMapping(path = "/turnToMyPost.controller")
	public String turnToMyPost(@SessionAttribute(name = "memberid") int memId,
			@SessionAttribute(name = "memberfullname") String memName, Model m) throws Exception {
		Map<String, String> dataMap = new HashMap<String, String>();
		String photoAmount = String.valueOf(pService.findByMemIdPost(memId).size());
		if (pService.findByMemIdPost(memId).size() != 0) {
			List<String> tempTime = new ArrayList<String>();
			for (PostTable pt : pService.findByMemIdPost(memId)) {
				tempTime.add(TimeCount.format(pt.getPostTime()));
			}
			m.addAttribute("timeCount", tempTime);
			dataMap.put("memId",String.valueOf(memId));
			dataMap.put("memFileName", mService.findById(memId).getFileName());
			dataMap.put("photoNum", photoAmount);
			dataMap.put("memName", memName);
			m.addAttribute("dataMap", dataMap);
			m.addAttribute("memPost", pService.findByMemIdPost(memId));
			return "/Post/ProfilePost";
		} else {
			dataMap.put("memId",String.valueOf(memId));
			dataMap.put("photoNum", photoAmount);
			dataMap.put("memName", memName);
			dataMap.put("memFileName", mService.findById(memId).getFileName());
			m.addAttribute("dataMap", dataMap);
			return "/Post/ProfilePost";
		}
	}

	@RequestMapping(path = "/deletePost.controller", method = RequestMethod.POST)
	public String deleteMyPost(@RequestParam(name = "postId") int postId,
			@SessionAttribute(name = "memberid") int memId, @SessionAttribute(name = "memberfullname") String memName,
			Model m) throws Exception {
		pService.deleteByPostId(postId);
		lService.deleteByPostId(postId);
		mtService.deleteByPostId(postId);
		Map<String, String> dataMap = new HashMap<String, String>();
		String photoAmount = String.valueOf(pService.findByMemIdPost(memId).size());
		if (pService.findByMemIdPost(memId).size() != 0) {
			List<String> tempTime = new ArrayList<String>();
			for (PostTable pt : pService.findByMemIdPost(memId)) {
				tempTime.add(TimeCount.format(pt.getPostTime()));
			}
			m.addAttribute("timeCount", tempTime);
			dataMap.put("memId",String.valueOf(memId));
			dataMap.put("memFileName", mService.findById(memId).getFileName());
			dataMap.put("photoNum", photoAmount);
			dataMap.put("memName", memName);
			m.addAttribute("dataMap", dataMap);
			m.addAttribute("memPost", pService.findByMemIdPost(memId));
			return "/Post/ProfilePost";
		} else {
			dataMap.put("memId",String.valueOf(memId));
			dataMap.put("memFileName", mService.findById(memId).getFileName());
			dataMap.put("photoNum", photoAmount);
			dataMap.put("memName", memName);
			m.addAttribute("dataMap", dataMap);
			return "/Post/ProfilePost";
		}
	}
	
	@RequestMapping(path = "/updateMyPost.controller", method = RequestMethod.POST)
	public String updateMyPost(@RequestParam(name = "descrip1") String descrip, @RequestParam(name = "file1") MultipartFile file,
			Model m, @RequestParam(name = "updatePostId") int postId,@SessionAttribute(name = "memberfullname") String memName,
			@SessionAttribute(name = "memberid") int memId) throws Exception {
		System.out.println(descrip);
		String fileName = file.getOriginalFilename();
		System.out.println("fileName=" + fileName);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		String savePath = "D:\\DataSource\\workspace\\SpringWebWorkspace\\HealthFuture\\WebContent\\resources\\images\\posting\\" + fileName;
		//String savePath = "D://DataSource//workspace//SpringWebWorkspace//HealthFuture//WebContent//resources//images//posting//"+ fileName;
		System.out.println("savePath=" + savePath);
		file.transferTo(new File(savePath));
		pService.updatePost(postId,descrip,savePath,fileName);
		Map<String, String> dataMap = new HashMap<String, String>();
		String photoAmount = String.valueOf(pService.findByMemIdPost(memId).size());
		List<String> tempTime = new ArrayList<String>();
		for (PostTable pt : pService.findByMemIdPost(memId)) {
			tempTime.add(TimeCount.format(pt.getPostTime()));
		}
		m.addAttribute("timeCount", tempTime);
		dataMap.put("memId",String.valueOf(memId));
		dataMap.put("memFileName", mService.findById(memId).getFileName());
		dataMap.put("photoNum", photoAmount);
		dataMap.put("memName", memName);
		m.addAttribute("dataMap", dataMap);
		m.addAttribute("memPost", pService.findByMemIdPost(memId));
		return "/Post/ProfilePost";
	}
}
