package controller;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import model.PoiService;

@Controller
public class PoiController {
	private PoiService poiService;

	@Autowired
	public PoiController(PoiService poiService) {
		this.poiService = poiService;
	}

	@RequestMapping(path = "/poiRecordOrderByMerchantTradeNo.controller")
	public void poiRecordOrderByMerchantTradeNo(HttpServletResponse response) throws Exception, IOException {
		response.setContentType("application/x-excel");// 這裡設定的檔案格式是application/x-excel
		response.setHeader("Content-Disposition",
				"attachment;filename=" + new String("付款明細.xls".getBytes(), "ISO-8859-1"));
		ServletOutputStream outputStream = response.getOutputStream();
		poiService.poiAllGreenCallBackOrderByMerchantTradeNo(outputStream);
		if (outputStream != null) {
			outputStream.close();
		}

	}
	
	@RequestMapping(path = "/poiAllRecordOrderByRtnMsg.controller")
	public void poiAllRecordOrderByRtnMsg(HttpServletResponse response) throws Exception, IOException {
		response.setContentType("application/x-excel");// 這裡設定的檔案格式是application/x-excel
		response.setHeader("Content-Disposition",
				"attachment;filename=" + new String("付款明細.xls".getBytes(), "ISO-8859-1"));
		ServletOutputStream outputStream = response.getOutputStream();
		poiService.poiAllGreenCallBackOrderByRtnMsg(outputStream);
		if (outputStream != null) {
			outputStream.close();
		}

	}
	
	@RequestMapping(path = "/poiRecordOrderByTradeAmt.controller")
	public void poiRecordOrderByTradeAmt(HttpServletResponse response) throws Exception, IOException {
		response.setContentType("application/x-excel");// 這裡設定的檔案格式是application/x-excel
		response.setHeader("Content-Disposition",
				"attachment;filename=" + new String("付款明細.xls".getBytes(), "ISO-8859-1"));
		ServletOutputStream outputStream = response.getOutputStream();
		poiService.poiAllGreenCallBackOrderByTradeAmount(outputStream);
		if (outputStream != null) {
			outputStream.close();
		}

	}
	
	@RequestMapping(path = "/poiRecordOrderByPaymentType.controller")
	public void poiRecordOrderByPaymentType(HttpServletResponse response) throws Exception, IOException {
		response.setContentType("application/x-excel");// 這裡設定的檔案格式是application/x-excel
		response.setHeader("Content-Disposition",
				"attachment;filename=" + new String("付款明細.xls".getBytes(), "ISO-8859-1"));
		ServletOutputStream outputStream = response.getOutputStream();
		poiService.poiAllGreenCallBackOrderByPaymentType(outputStream);
		if (outputStream != null) {
			outputStream.close();
		}

	}
	
	@RequestMapping(path = "/poiRecordOrderByPaymentDate.controller")
	public void poiRecordOrderByPaymentDate(HttpServletResponse response) throws Exception, IOException {
		response.setContentType("application/x-excel");// 這裡設定的檔案格式是application/x-excel
		response.setHeader("Content-Disposition",
				"attachment;filename=" + new String("付款明細.xls".getBytes(), "ISO-8859-1"));
		ServletOutputStream outputStream = response.getOutputStream();
		poiService.poiAllGreenCallBackOrderByPaymentDate(outputStream);
		if (outputStream != null) {
			outputStream.close();
		}

	}
	
}
