package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import ecpay.payment.integration.domain.AioCheckOutALL;
import model.GreenCallBack;
import model.GreenCallBackService;
import model.MemberService;
import model.ProductServiceImpl;
import model.ShoppingRecordServiceImpl;

@Controller
public class GreenPayController {

	private ShoppingRecordServiceImpl shoppingRecordService;
	private GreenCallBackService gService;
	private MemberService mService;
	private ProductServiceImpl productService;

	@Autowired
	public GreenPayController(ShoppingRecordServiceImpl shoppingRecordService, GreenCallBackService gService,
			MemberService mService, ProductServiceImpl productService) {
		this.shoppingRecordService = shoppingRecordService;
		this.gService = gService;
		this.mService = mService;
		this.productService = productService;

	}

	@RequestMapping(path = { "/greenPayForMemKeyData.controller" }, method = { RequestMethod.POST })
	public String keyData(@SessionAttribute(name = "memberid") int memId,
			@RequestParam(name = "petime") String dateAndtime, @RequestParam(name = "peusedid") String useId,
			@RequestParam(name = "peproductid") String productId, @RequestParam(name = "pecounts") String pecounts,
			Model m) {
		Map<String, String> orderDetail = new HashMap<String, String>();
		orderDetail.put("productTime", dateAndtime);
		orderDetail.put("useId", useId);
		orderDetail.put("productId", productId);
		orderDetail.put("productCount", pecounts);
		orderDetail.put("productName", productService.getProduct(Integer.valueOf(productId)).getP_name());
		orderDetail.put("productPrice",
				Integer.toString(productService.getProduct(Integer.valueOf(productId)).getP_price()));
		m.addAttribute("memberData", mService.findById(memId));
		m.addAttribute("orderDetail", orderDetail);
		return "GreenPay/memData";
	}

	@RequestMapping(path = { "/greenPay.controller" }, method = { RequestMethod.POST })
	public String pay(@RequestParam(name = "productTime") String productTime,
			@RequestParam(name = "useId") String useId, @RequestParam(name = "productId") String productId,
			@RequestParam(name = "productPrice") String productPrice,
			@RequestParam(name = "productName") String productName,
			@RequestParam(name = "productCount") String productCount, @RequestParam(name = "name") String name,
			@RequestParam(name = "phone") String phone, @RequestParam(name = "address") String address,
			@RequestParam(name = "email") String email, Model m) {
		String tradeNo = "Health" + productTime.replace("-", "");
		GreenCallBack gcb = new GreenCallBack();
		gcb.setMerchantTradeNo(tradeNo);
		gcb.setMemFullName(name);
		gcb.setMemPhone(phone);
		gcb.setMemAddress(address);
		gcb.setMemEmail(email);
		gcb.setProductName(productName);
		gcb.setProductAmount(Integer.valueOf(productCount));
		gService.insertGreenCallBack(gcb);
		String totalAmount = Integer.toString(Integer.valueOf(productPrice) * Integer.valueOf(productCount));
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo(tradeNo);
		obj.setMerchantTradeDate(shoppingRecordService.getDateTime());
		obj.setTotalAmount(totalAmount);
		obj.setTradeDesc("謝謝你的購買");
		obj.setItemName(productName + 'x' + productCount);
		obj.setReturnURL(" https://e30bf5f5.ngrok.io/HealthFuture/callBack.controller");
		obj.setNeedExtraPaidInfo("N");
		obj.setIgnorePayment("WebATM#ATM");
		obj.setClientBackURL(" https://e30bf5f5.ngrok.io/HealthFuture/turntoSuccessPay.controller");
		System.out.println(ShoppingRecordServiceImpl.allCanChoose(obj));
		m.addAttribute("form", ShoppingRecordServiceImpl.allCanChoose(obj));
		System.out.println("結束");
		return "GreenPay/payForm";
	}

	@RequestMapping(path = { "/callBack.controller" }, method = { RequestMethod.POST })
	public void pay(@RequestParam(name = "MerchantID") String MerchantID,
			@RequestParam(name = "MerchantTradeNo") String MerchantTradeNo, @RequestParam(name = "RtnCode") int RtnCode,
			@RequestParam(name = "RtnMsg") String RtnMsg, @RequestParam(name = "TradeNo") String TradeNo,
			@RequestParam(name = "TradeAmt") int TradeAmt, @RequestParam(name = "PaymentDate") String PaymentDate,
			@RequestParam(name = "PaymentType") String PaymentType, @RequestParam(name = "TradeDate") String TradeDate,
			Model m) {
		GreenCallBack gcb = gService.findBymerchantTradeNo(MerchantTradeNo);
		gcb.setMerchantTradeNo(MerchantTradeNo);
		gcb.setMerchantID(MerchantID);
		gcb.setRtnCode(RtnCode);
		gcb.setRtnMsg(RtnMsg);
		gcb.setTradeNo(TradeNo);
		gcb.setTradeAmt(TradeAmt);
		gcb.setPaymentDate(PaymentDate);
		gcb.setPaymentType(PaymentType);
		gcb.setTradeDate(TradeDate);
//		gcb.setMemFullName(((Map<String,String>) memberData).get("name"));伺服器綠界的存不到session
//		gcb.setMemPhone(((Map<String,String>) memberData).get("phone"));
//		gcb.setMemAddress(((Map<String,String>) memberData).get("address"));
//		gcb.setMemEmail(((Map<String,String>) memberData).get("email"));
//		gService.insertGreenCallBack(gcb);
	}

	@RequestMapping(path = { "/turntoSuccessPay.controller" })
	public String successPay() {
//		String productName = orderDetail.get("productName");
//		int productAmount = Integer.valueOf(orderDetail.get("productCount"));
//		gService.updateTradeNoIntoMemData(tradeNo, memDataName, memDataPhone, memDataAddress, memDataEmail, productName,
//				productAmount);
		return "GreenPay/successPay";
	}

	@RequestMapping(path = { "/searchPayRecord.controller" })
	public String searchPayRecord(Model m) {
		m.addAttribute("allPayRecord", gService.findAllPayRecord());
		m.addAttribute("orderStatus",1);
		return "GreenPay/allPayRecord";
	}

	@ResponseBody
	@RequestMapping("/showDetailWhoPay.controller")
	public GreenCallBack payRecordDetail(@RequestParam(name = "merchantTradeNo") String merchantTradeNo, Model m) {
		return gService.findBymerchantTradeNo(merchantTradeNo);
	}

	@RequestMapping(path = { "/orderGreenPayRecord.controller" }, method = { RequestMethod.POST })
	public String searchPayRecordOrder(@RequestParam(name = "arrayRecord") String arrayRecord, Model m) {
		if (arrayRecord.equals("MerchantTradeNo")) {
			m.addAttribute("allPayRecord", gService.findAllPayRecord());
			m.addAttribute("orderStatus",1);
			return "GreenPay/allPayRecord";
		} else if (arrayRecord.equals("RtnMsg")) {
			m.addAttribute("allPayRecord", gService.OrderByRtnMsg());
			m.addAttribute("orderStatus",2);
			return "GreenPay/allPayRecord";
		} else if (arrayRecord.equals("TradeAmt")) {
			m.addAttribute("allPayRecord", gService.OrderByTradeAmt());
			m.addAttribute("orderStatus",3);
			return "GreenPay/allPayRecord";
		} else if (arrayRecord.equals("PayType")) {
			m.addAttribute("allPayRecord", gService.OrderByPaymentType());
			m.addAttribute("orderStatus",4);
			return "GreenPay/allPayRecord";
		} else {
			m.addAttribute("allPayRecord", gService.OrderByPaymentDate());
			m.addAttribute("orderStatus",5);
			return "GreenPay/allPayRecord";
		}
	}
}
