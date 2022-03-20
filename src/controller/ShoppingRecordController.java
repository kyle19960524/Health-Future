package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.alibaba.fastjson.JSONArray;

import model.BookingTable;
import model.BookingTableService;
import model.Product;
import model.ProductServiceImpl;
import model.ShoppingRecord;
import model.ShoppingRecordServiceImpl;

/**
 * Created by 14437 on 2017/3/3.
 */
@Controller
public class ShoppingRecordController {
	@Resource
	private ProductServiceImpl productService;
	@Resource
	private ShoppingRecordServiceImpl shoppingRecordService;
	@Resource
	private BookingTableService bService;

	@RequestMapping(value = "/shopping_record")
	public String shopping_record() {
		return "shopping_record";
	}

	@RequestMapping(value = "/shopping_handle")
	public String shopping_handle() {
		return "shopping_handle";
	}

	@RequestMapping(value = "/addShoppingRecord", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addShoppingRecord(Integer pe_userid, int pe_productId, int pe_counts, String pe_restime,
			@SessionAttribute(name = "btid") int id, String pe_resdate) {
		System.out.println("我增加了" + pe_userid + " " + pe_productId);
		String result = null;

		/* =============== */
		BookingTable bt = bService.findById(id);
		pe_restime = bt.getEachTime();
		pe_resdate = bt.getDate();
		/* =============== */

		Product product = productService.getProduct(pe_productId);
		ShoppingRecord shoppingRecord = new ShoppingRecord();
		if (pe_counts <= product.getP_counts()) {
			if (product.getP_id() != 102) {
//        		ShoppingRecord shoppingRecord = new ShoppingRecord();
				shoppingRecord.setPe_userid(pe_userid);
				;
				shoppingRecord.setPe_productId(pe_productId);
				;
				shoppingRecord.setPe_productPrice(product.getP_price() * pe_counts);
				shoppingRecord.setPe_counts(pe_counts);
				shoppingRecord.setPe_orderStatus(0);
			}
//            ShoppingRecord shoppingRecord = new ShoppingRecord();
//            shoppingRecord.setPe_userid(pe_userid);;
//            shoppingRecord.setPe_productId(pe_productId);;
//            shoppingRecord.setPe_productPrice(product.getP_price() * pe_counts);
//            shoppingRecord.setPe_counts(pe_counts);
//            shoppingRecord.setPe_orderStatus(0);
			else if(product.getP_id() == 102) {
				shoppingRecord.setPe_userid(pe_userid);
				;
				shoppingRecord.setPe_productId(pe_productId);
				;
				shoppingRecord.setPe_productPrice(product.getP_price() * pe_counts);
				shoppingRecord.setPe_counts(pe_counts);
				shoppingRecord.setPe_orderStatus(0);
				shoppingRecord.setPe_restime(pe_restime);
				shoppingRecord.setPe_resdate(pe_resdate);
			}
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-ddHH-mm-ss");
			shoppingRecord.setPe_time(sf.format(date));
			product.setP_counts(product.getP_counts() - pe_counts);
			productService.updateProduct(product);
			shoppingRecordService.addShoppingRecord(shoppingRecord);
			result = "success";
		} else {
			result = "unEnough";
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}
	
	@RequestMapping(value = "/addShoppingRecordOld", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addShoppingRecordOld(Integer pe_userid, int pe_productId, int pe_counts, String pe_restime,
			String pe_resdate) {
		System.out.println("我增加了" + pe_userid + " " + pe_productId);
		String result = null;

		/* =============== */
//		BookingTable bt = bService.findById(id);
//		pe_restime = bt.getEachTime();
//		pe_resdate = bt.getDate();
		/* =============== */

		Product product = productService.getProduct(pe_productId);
		ShoppingRecord shoppingRecord = new ShoppingRecord();
		if (pe_counts <= product.getP_counts()) {
//			if (product.getP_id() != 101) {
//        		ShoppingRecord shoppingRecord = new ShoppingRecord();
				shoppingRecord.setPe_userid(pe_userid);
				;
				shoppingRecord.setPe_productId(pe_productId);
				;
				shoppingRecord.setPe_productPrice(product.getP_price() * pe_counts);
				shoppingRecord.setPe_counts(pe_counts);
				shoppingRecord.setPe_orderStatus(0);
//			}
//            ShoppingRecord shoppingRecord = new ShoppingRecord();
//            shoppingRecord.setPe_userid(pe_userid);;
//            shoppingRecord.setPe_productId(pe_productId);;
//            shoppingRecord.setPe_productPrice(product.getP_price() * pe_counts);
//            shoppingRecord.setPe_counts(pe_counts);
//            shoppingRecord.setPe_orderStatus(0);
//			else if(product.getP_id() == 101) {
//				shoppingRecord.setPe_userid(pe_userid);
//				;
//				shoppingRecord.setPe_productId(pe_productId);
//				;
//				shoppingRecord.setPe_productPrice(product.getP_price() * pe_counts);
//				shoppingRecord.setPe_counts(pe_counts);
//				shoppingRecord.setPe_orderStatus(0);
//				shoppingRecord.setPe_restime(pe_restime);
//				shoppingRecord.setPe_resdate(pe_resdate);
//			}
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-ddHH-mm-ss");
			shoppingRecord.setPe_time(sf.format(date));
			product.setP_counts(product.getP_counts() - pe_counts);
			productService.updateProduct(product);
			shoppingRecordService.addShoppingRecord(shoppingRecord);
			result = "success";
		} else {
			result = "unEnough";
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		return resultMap;
	}

	@RequestMapping(value = "/changeShoppingRecord", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeShoppingRecord(int pe_userid, int pe_productId, String pe_time,
			int pe_orderStatus) {
		System.out.println("取得使用者資訊" + pe_userid + " " + pe_productId + " " + pe_time + " " + pe_orderStatus);
		ShoppingRecord shoppingRecord = shoppingRecordService.getShoppingRecord(pe_userid, pe_productId, pe_time);
		System.out.println("取得時間" + shoppingRecord.getPe_time());
		shoppingRecord.setPe_orderStatus(pe_orderStatus);
		shoppingRecordService.updateShoppingRecord(shoppingRecord);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		System.out.println("成功改變訂單資訊");
		return resultMap;
	}

	@RequestMapping(value = "/getShoppingRecords", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getShoppingRecords(int pe_userid) {
		List<ShoppingRecord> shoppingRecordList = shoppingRecordService.getShoppingRecords(pe_userid);
		String shoppingRecords = JSONArray.toJSONString(shoppingRecordList);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", shoppingRecords);
		System.out.println("=======" + shoppingRecords + "========");
		return resultMap;
	}

//
//    @RequestMapping(value = "/getShoppingRecordsByOrderStatus",method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String,Object> getShoppingRecordsByOrderStatus(int orderStatus){
//        List<ShoppingRecord> shoppingRecordList = shoppingRecordService.getShoppingRecordsByOrderStatus(orderStatus);
//        String shoppingRecords = JSONArray.toJSONString(shoppingRecordList);
//        Map<String,Object> resultMap = new HashMap<String,Object>();
//        resultMap.put("result",shoppingRecords);
//        return resultMap;
//    }
//
	@RequestMapping(value = "/getAllShoppingRecords", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAllShoppingRecords() {

		List<ShoppingRecord> shoppingRecordList = shoppingRecordService.getAllShoppingRecords();
		String shoppingRecords = JSONArray.toJSONString(shoppingRecordList);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", shoppingRecords);
		System.out.println("我反悔了" + shoppingRecords);
		return resultMap;
	}
//
//    @RequestMapping(value = "/getUserProductRecord",method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String,Object> getUserProductRecord(int userId,int productId){
//        String result = "false";
//        if(shoppingRecordService.getUserProductRecord(userId,productId)){
//            result = "true";
//        }
//        Map<String,Object> resultMap = new HashMap<String,Object>();
//        resultMap.put("result",result);
//        return resultMap;
//    }
}
