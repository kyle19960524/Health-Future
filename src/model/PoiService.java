package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PoiService {
	private GreenCallBackDAO pogDao;

	@Autowired
	public PoiService(GreenCallBackDAO pogDao) {
		this.pogDao = pogDao;
	}

	public void poiAllGreenCallBackOrderByMerchantTradeNo(ServletOutputStream out) throws IOException {

		List<GreenCallBack> gcb = pogDao.findAllPayRecord();
		try {
			
			// 1.建立工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 1.1建立合併單元格物件
			CellRangeAddress callRangeAddress = new CellRangeAddress(0, 0, 0, 9);// 起始行,結束行,起始列,結束列
			// 1.2頭標題樣式
			HSSFCellStyle headStyle = createCellStyle(workbook, (short) 16);
			// 1.3列標題樣式
			HSSFCellStyle colStyle = createCellStyle(workbook, (short) 13);
			// 2.建立工作表名稱
			HSSFSheet sheet = workbook.createSheet("付款明細按編號");
			// 2.1載入合併單元格物件
			sheet.addMergedRegion(callRangeAddress);
			// 設定預設列寬
			sheet.setDefaultColumnWidth(25);
			// 3.建立行
			// 3.1建立頭標題行;並且設定頭標題
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell = row.createCell(0);
			// 載入單元格樣式
			cell.setCellStyle(headStyle);
			cell.setCellValue("商品報表");

			// 3.2建立列標題;並且設定列標題
			HSSFRow row2 = sheet.createRow(1);
			String[] titles = { "訂單編號", "訂單狀態", "付款時間","付款金額", "付款方式", "商品名稱", "商品數量","付款人姓名","電話","住址"};
			for (int i = 0; i < titles.length; i++) {
				HSSFCell cell2 = row2.createCell(i);
				// 載入單元格樣式
				cell2.setCellStyle(colStyle);
				cell2.setCellValue(titles[i]);
			}
			// 4.操作單元格;將付款列表寫入excel
			
			HSSFCellStyle style = workbook.createCellStyle();
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			if (gcb != null) {
				for (int j = 0; j < gcb.size(); j++) {
					// 建立資料行,前面有兩行,頭標題行和列標題行
					HSSFRow row3 = sheet.createRow(j + 2);
					HSSFCell cell1 = row3.createCell(0);
					cell1.setCellValue(gcb.get(j).getMerchantTradeNo());
					cell1.setCellStyle(style);
					HSSFCell cell2 = row3.createCell(1);
					cell2.setCellValue(gcb.get(j).getRtnMsg());
					cell2.setCellStyle(style);
					HSSFCell cell3 = row3.createCell(2);
					cell3.setCellValue(gcb.get(j).getPaymentDate());
					cell3.setCellStyle(style);
					HSSFCell cell4 = row3.createCell(3);
					cell4.setCellValue(gcb.get(j).getTradeAmt());
					cell4.setCellStyle(style);
					HSSFCell cell5 = row3.createCell(4);
					cell5.setCellValue(gcb.get(j).getPaymentType());
					cell5.setCellStyle(style);
					HSSFCell cell6 = row3.createCell(5);
					cell6.setCellValue(gcb.get(j).getProductName());
					cell6.setCellStyle(style);
					HSSFCell cell7 = row3.createCell(6);
					cell7.setCellValue(gcb.get(j).getProductAmount());
					cell7.setCellStyle(style);
					HSSFCell cell8 = row3.createCell(7);
					cell8.setCellValue(gcb.get(j).getMemFullName());
					cell8.setCellStyle(style);
					HSSFCell cell9 = row3.createCell(8);
					cell9.setCellValue(gcb.get(j).getMemPhone());
					cell9.setCellStyle(style);
					HSSFCell cell10 = row3.createCell(9);
					cell10.setCellValue(gcb.get(j).getMemAddress());
					cell10.setCellStyle(style);
				}
			}
			// 5.輸出
			workbook.write(out);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void poiAllGreenCallBackOrderByRtnMsg(ServletOutputStream out) throws IOException {

		List<GreenCallBack> gcb = pogDao.OrderByRtnMsg();
		try {
			
			// 1.建立工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 1.1建立合併單元格物件
			CellRangeAddress callRangeAddress = new CellRangeAddress(0, 0, 0, 9);// 起始行,結束行,起始列,結束列
			// 1.2頭標題樣式
			HSSFCellStyle headStyle = createCellStyle(workbook, (short) 16);
			// 1.3列標題樣式
			HSSFCellStyle colStyle = createCellStyle(workbook, (short) 13);
			// 2.建立工作表名稱
			HSSFSheet sheet = workbook.createSheet("付款明細按編號");
			// 2.1載入合併單元格物件
			sheet.addMergedRegion(callRangeAddress);
			// 設定預設列寬
			sheet.setDefaultColumnWidth(25);
			// 3.建立行
			// 3.1建立頭標題行;並且設定頭標題
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell = row.createCell(0);
			// 載入單元格樣式
			cell.setCellStyle(headStyle);
			cell.setCellValue("商品報表");

			// 3.2建立列標題;並且設定列標題
			HSSFRow row2 = sheet.createRow(1);
			String[] titles = { "訂單編號", "訂單狀態", "付款時間","付款金額", "付款方式", "商品名稱", "商品數量","付款人姓名","電話","住址"};
			for (int i = 0; i < titles.length; i++) {
				HSSFCell cell2 = row2.createCell(i);
				// 載入單元格樣式
				cell2.setCellStyle(colStyle);
				cell2.setCellValue(titles[i]);
			}
			// 4.操作單元格;將付款列表寫入excel
			
			HSSFCellStyle style = workbook.createCellStyle();
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			if (gcb != null) {
				for (int j = 0; j < gcb.size(); j++) {
					// 建立資料行,前面有兩行,頭標題行和列標題行
					HSSFRow row3 = sheet.createRow(j + 2);
					HSSFCell cell1 = row3.createCell(0);
					cell1.setCellValue(gcb.get(j).getMerchantTradeNo());
					cell1.setCellStyle(style);
					HSSFCell cell2 = row3.createCell(1);
					cell2.setCellValue(gcb.get(j).getRtnMsg());
					cell2.setCellStyle(style);
					HSSFCell cell3 = row3.createCell(2);
					cell3.setCellValue(gcb.get(j).getPaymentDate());
					cell3.setCellStyle(style);
					HSSFCell cell4 = row3.createCell(3);
					cell4.setCellValue(gcb.get(j).getTradeAmt());
					cell4.setCellStyle(style);
					HSSFCell cell5 = row3.createCell(4);
					cell5.setCellValue(gcb.get(j).getPaymentType());
					cell5.setCellStyle(style);
					HSSFCell cell6 = row3.createCell(5);
					cell6.setCellValue(gcb.get(j).getProductName());
					cell6.setCellStyle(style);
					HSSFCell cell7 = row3.createCell(6);
					cell7.setCellValue(gcb.get(j).getProductAmount());
					cell7.setCellStyle(style);
					HSSFCell cell8 = row3.createCell(7);
					cell8.setCellValue(gcb.get(j).getMemFullName());
					cell8.setCellStyle(style);
					HSSFCell cell9 = row3.createCell(8);
					cell9.setCellValue(gcb.get(j).getMemPhone());
					cell9.setCellStyle(style);
					HSSFCell cell10 = row3.createCell(9);
					cell10.setCellValue(gcb.get(j).getMemAddress());
					cell10.setCellStyle(style);
				}
			}
			// 5.輸出
			workbook.write(out);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void poiAllGreenCallBackOrderByTradeAmount(ServletOutputStream out) throws IOException {

		List<GreenCallBack> gcb = pogDao.OrderByTradeAmt();
		try {
			
			// 1.建立工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 1.1建立合併單元格物件
			CellRangeAddress callRangeAddress = new CellRangeAddress(0, 0, 0, 9);// 起始行,結束行,起始列,結束列
			// 1.2頭標題樣式
			HSSFCellStyle headStyle = createCellStyle(workbook, (short) 16);
			// 1.3列標題樣式
			HSSFCellStyle colStyle = createCellStyle(workbook, (short) 13);
			// 2.建立工作表名稱
			HSSFSheet sheet = workbook.createSheet("付款明細按編號");
			// 2.1載入合併單元格物件
			sheet.addMergedRegion(callRangeAddress);
			// 設定預設列寬
			sheet.setDefaultColumnWidth(25);
			// 3.建立行
			// 3.1建立頭標題行;並且設定頭標題
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell = row.createCell(0);
			// 載入單元格樣式
			cell.setCellStyle(headStyle);
			cell.setCellValue("商品報表");

			// 3.2建立列標題;並且設定列標題
			HSSFRow row2 = sheet.createRow(1);
			String[] titles = { "訂單編號", "訂單狀態", "付款時間","付款金額", "付款方式", "商品名稱", "商品數量","付款人姓名","電話","住址"};
			for (int i = 0; i < titles.length; i++) {
				HSSFCell cell2 = row2.createCell(i);
				// 載入單元格樣式
				cell2.setCellStyle(colStyle);
				cell2.setCellValue(titles[i]);
			}
			// 4.操作單元格;將付款列表寫入excel
			
			HSSFCellStyle style = workbook.createCellStyle();
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			if (gcb != null) {
				for (int j = 0; j < gcb.size(); j++) {
					// 建立資料行,前面有兩行,頭標題行和列標題行
					HSSFRow row3 = sheet.createRow(j + 2);
					HSSFCell cell1 = row3.createCell(0);
					cell1.setCellValue(gcb.get(j).getMerchantTradeNo());
					cell1.setCellStyle(style);
					HSSFCell cell2 = row3.createCell(1);
					cell2.setCellValue(gcb.get(j).getRtnMsg());
					cell2.setCellStyle(style);
					HSSFCell cell3 = row3.createCell(2);
					cell3.setCellValue(gcb.get(j).getPaymentDate());
					cell3.setCellStyle(style);
					HSSFCell cell4 = row3.createCell(3);
					cell4.setCellValue(gcb.get(j).getTradeAmt());
					cell4.setCellStyle(style);
					HSSFCell cell5 = row3.createCell(4);
					cell5.setCellValue(gcb.get(j).getPaymentType());
					cell5.setCellStyle(style);
					HSSFCell cell6 = row3.createCell(5);
					cell6.setCellValue(gcb.get(j).getProductName());
					cell6.setCellStyle(style);
					HSSFCell cell7 = row3.createCell(6);
					cell7.setCellValue(gcb.get(j).getProductAmount());
					cell7.setCellStyle(style);
					HSSFCell cell8 = row3.createCell(7);
					cell8.setCellValue(gcb.get(j).getMemFullName());
					cell8.setCellStyle(style);
					HSSFCell cell9 = row3.createCell(8);
					cell9.setCellValue(gcb.get(j).getMemPhone());
					cell9.setCellStyle(style);
					HSSFCell cell10 = row3.createCell(9);
					cell10.setCellValue(gcb.get(j).getMemAddress());
					cell10.setCellStyle(style);
				}
			}
			// 5.輸出
			workbook.write(out);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void poiAllGreenCallBackOrderByPaymentType(ServletOutputStream out) throws IOException {

		List<GreenCallBack> gcb = pogDao.OrderByPaymentType();
		try {
			
			// 1.建立工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 1.1建立合併單元格物件
			CellRangeAddress callRangeAddress = new CellRangeAddress(0, 0, 0, 9);// 起始行,結束行,起始列,結束列
			// 1.2頭標題樣式
			HSSFCellStyle headStyle = createCellStyle(workbook, (short) 16);
			// 1.3列標題樣式
			HSSFCellStyle colStyle = createCellStyle(workbook, (short) 13);
			// 2.建立工作表名稱
			HSSFSheet sheet = workbook.createSheet("付款明細按編號");
			// 2.1載入合併單元格物件
			sheet.addMergedRegion(callRangeAddress);
			// 設定預設列寬
			sheet.setDefaultColumnWidth(25);
			// 3.建立行
			// 3.1建立頭標題行;並且設定頭標題
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell = row.createCell(0);
			// 載入單元格樣式
			cell.setCellStyle(headStyle);
			cell.setCellValue("商品報表");

			// 3.2建立列標題;並且設定列標題
			HSSFRow row2 = sheet.createRow(1);
			String[] titles = { "訂單編號", "訂單狀態", "付款時間","付款金額", "付款方式", "商品名稱", "商品數量","付款人姓名","電話","住址"};
			for (int i = 0; i < titles.length; i++) {
				HSSFCell cell2 = row2.createCell(i);
				// 載入單元格樣式
				cell2.setCellStyle(colStyle);
				cell2.setCellValue(titles[i]);
			}
			// 4.操作單元格;將付款列表寫入excel
			
			HSSFCellStyle style = workbook.createCellStyle();
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			if (gcb != null) {
				for (int j = 0; j < gcb.size(); j++) {
					// 建立資料行,前面有兩行,頭標題行和列標題行
					HSSFRow row3 = sheet.createRow(j + 2);
					HSSFCell cell1 = row3.createCell(0);
					cell1.setCellValue(gcb.get(j).getMerchantTradeNo());
					cell1.setCellStyle(style);
					HSSFCell cell2 = row3.createCell(1);
					cell2.setCellValue(gcb.get(j).getRtnMsg());
					cell2.setCellStyle(style);
					HSSFCell cell3 = row3.createCell(2);
					cell3.setCellValue(gcb.get(j).getPaymentDate());
					cell3.setCellStyle(style);
					HSSFCell cell4 = row3.createCell(3);
					cell4.setCellValue(gcb.get(j).getTradeAmt());
					cell4.setCellStyle(style);
					HSSFCell cell5 = row3.createCell(4);
					cell5.setCellValue(gcb.get(j).getPaymentType());
					cell5.setCellStyle(style);
					HSSFCell cell6 = row3.createCell(5);
					cell6.setCellValue(gcb.get(j).getProductName());
					cell6.setCellStyle(style);
					HSSFCell cell7 = row3.createCell(6);
					cell7.setCellValue(gcb.get(j).getProductAmount());
					cell7.setCellStyle(style);
					HSSFCell cell8 = row3.createCell(7);
					cell8.setCellValue(gcb.get(j).getMemFullName());
					cell8.setCellStyle(style);
					HSSFCell cell9 = row3.createCell(8);
					cell9.setCellValue(gcb.get(j).getMemPhone());
					cell9.setCellStyle(style);
					HSSFCell cell10 = row3.createCell(9);
					cell10.setCellValue(gcb.get(j).getMemAddress());
					cell10.setCellStyle(style);
				}
			}
			// 5.輸出
			workbook.write(out);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void poiAllGreenCallBackOrderByPaymentDate(ServletOutputStream out) throws IOException {

		List<GreenCallBack> gcb = pogDao.OrderByPaymentDate();
		try {
			
			// 1.建立工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 1.1建立合併單元格物件
			CellRangeAddress callRangeAddress = new CellRangeAddress(0, 0, 0, 9);// 起始行,結束行,起始列,結束列
			// 1.2頭標題樣式
			HSSFCellStyle headStyle = createCellStyle(workbook, (short) 16);
			// 1.3列標題樣式
			HSSFCellStyle colStyle = createCellStyle(workbook, (short) 13);
			// 2.建立工作表名稱
			HSSFSheet sheet = workbook.createSheet("付款明細按編號");
			// 2.1載入合併單元格物件
			sheet.addMergedRegion(callRangeAddress);
			// 設定預設列寬
			sheet.setDefaultColumnWidth(25);
			// 3.建立行
			// 3.1建立頭標題行;並且設定頭標題
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell = row.createCell(0);
			// 載入單元格樣式
			cell.setCellStyle(headStyle);
			cell.setCellValue("商品報表");

			// 3.2建立列標題;並且設定列標題
			HSSFRow row2 = sheet.createRow(1);
			String[] titles = { "訂單編號", "訂單狀態", "付款時間","付款金額", "付款方式", "商品名稱", "商品數量","付款人姓名","電話","住址"};
			for (int i = 0; i < titles.length; i++) {
				HSSFCell cell2 = row2.createCell(i);
				// 載入單元格樣式
				cell2.setCellStyle(colStyle);
				cell2.setCellValue(titles[i]);
			}
			// 4.操作單元格;將付款列表寫入excel
			
			HSSFCellStyle style = workbook.createCellStyle();
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			if (gcb != null) {
				for (int j = 0; j < gcb.size(); j++) {
					// 建立資料行,前面有兩行,頭標題行和列標題行
					HSSFRow row3 = sheet.createRow(j + 2);
					HSSFCell cell1 = row3.createCell(0);
					cell1.setCellValue(gcb.get(j).getMerchantTradeNo());
					cell1.setCellStyle(style);
					HSSFCell cell2 = row3.createCell(1);
					cell2.setCellValue(gcb.get(j).getRtnMsg());
					cell2.setCellStyle(style);
					HSSFCell cell3 = row3.createCell(2);
					cell3.setCellValue(gcb.get(j).getPaymentDate());
					cell3.setCellStyle(style);
					HSSFCell cell4 = row3.createCell(3);
					cell4.setCellValue(gcb.get(j).getTradeAmt());
					cell4.setCellStyle(style);
					HSSFCell cell5 = row3.createCell(4);
					cell5.setCellValue(gcb.get(j).getPaymentType());
					cell5.setCellStyle(style);
					HSSFCell cell6 = row3.createCell(5);
					cell6.setCellValue(gcb.get(j).getProductName());
					cell6.setCellStyle(style);
					HSSFCell cell7 = row3.createCell(6);
					cell7.setCellValue(gcb.get(j).getProductAmount());
					cell7.setCellStyle(style);
					HSSFCell cell8 = row3.createCell(7);
					cell8.setCellValue(gcb.get(j).getMemFullName());
					cell8.setCellStyle(style);
					HSSFCell cell9 = row3.createCell(8);
					cell9.setCellValue(gcb.get(j).getMemPhone());
					cell9.setCellStyle(style);
					HSSFCell cell10 = row3.createCell(9);
					cell10.setCellValue(gcb.get(j).getMemAddress());
					cell10.setCellStyle(style);
				}
			}
			// 5.輸出
			workbook.write(out);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 新增店家商品明細poi
	 * 
	 * @return
	 * @throws IOException
	 */
//	public void addFundProductDetailPoi(Store getStore,ServletOutputStream out,Date startDate,Date endDate) throws IOException {
//		
//		List<FundOrder> getListFundOrderDetail = poiDaoImpl.findFundOrderToPOI(getStore.getStoreId(),startDate,endDate);
//		try{
//			//1.建立工作簿
//			HSSFWorkbook workbook = new HSSFWorkbook();
//			//1.1建立合併單元格物件
//			CellRangeAddress callRangeAddress = new CellRangeAddress(0,0,0,7);//起始行,結束行,起始列,結束列
//			//1.2頭標題樣式
//			HSSFCellStyle headStyle = createCellStyle(workbook,(short)16);
//			//1.3列標題樣式
//			HSSFCellStyle colStyle = createCellStyle(workbook,(short)13);
//			//2.建立工作表名稱
//			HSSFSheet sheet = workbook.createSheet("使用者列表");
//			//2.1載入合併單元格物件
//			sheet.addMergedRegion(callRangeAddress);
//			//設定預設列寬
//			sheet.setDefaultColumnWidth(25);
//			//3.建立行
//			//3.1建立頭標題行;並且設定頭標題
//			HSSFRow row = sheet.createRow(0);
//			HSSFCell cell = row.createCell(0);
//			//載入單元格樣式
//			cell.setCellStyle(headStyle);
//			cell.setCellValue("募資商品報表");
//
//			//3.2建立列標題;並且設定列標題
//			HSSFRow row2 = sheet.createRow(1);
//			String[] titles = {"商家名稱","募資訂單明細識別碼","募資商品名稱","募資商品單價","額外贊助","總金額","訂單狀態","訂單日期"};
//			for(int i=0;i<titles.length;i++)
//			{
//			HSSFCell cell2 = row2.createCell(i);
//			//載入單元格樣式
//			cell2.setCellStyle(colStyle);
//			cell2.setCellValue(titles[i]);
//			}
//			//4.操作單元格;將使用者列表寫入excel
//			if(getListFundOrderDetail != null)
//			{
//			for(int j=0;j<getListFundOrderDetail.size();j++)
//			{
//			//建立資料行,前面有兩行,頭標題行和列標題行
//			HSSFRow row3 = sheet.createRow(j+2);
//			HSSFCell cell1 = row3.createCell(0);
//			cell1.setCellValue(getListFundOrderDetail.get(j).getStore().getStoreName());
//			HSSFCell cell2 = row3.createCell(1);
//			cell2.setCellValue(getListFundOrderDetail.get(j).getFundOrderId());
//			HSSFCell cell3 = row3.createCell(2);
//			cell3.setCellValue(getListFundOrderDetail.get(j).getFundOrderName());
//			HSSFCell cell4 = row3.createCell(3);
//			cell4.setCellValue(getListFundOrderDetail.get(j).getFundOrderPrice());
//			HSSFCell cell5 = row3.createCell(4);
//			cell5.setCellValue(getListFundOrderDetail.get(j).getFundOrderExtraPrice());
//			HSSFCell cell6 = row3.createCell(5);
//			cell6.setCellValue(getListFundOrderDetail.get(j).getFundOrderTotal());
//			HSSFCell cell7 = row3.createCell(6);
//			cell7.setCellValue(getListFundOrderDetail.get(j).getFundOrderStatus());
//			HSSFCell cell8 = row3.createCell(7);
//			cell8.setCellValue(getListFundOrderDetail.get(j).getFundOrderDate().toString());
//			}
//			}
//			//5.輸出
//			workbook.write(out);
//			workbook.close();
//			//out.close();
//			}catch(Exception e)
//			{
//			e.printStackTrace();
//			}
//	}

	/**
	 * 
	 * @param workbook
	 * @param fontsize
	 * @return 單元格樣式
	 */
	private static HSSFCellStyle createCellStyle(HSSFWorkbook workbook, short fontsize) {
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
//建立字型
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontHeightInPoints(fontsize);
//載入字型
		style.setFont(font);
//載入邊框上下左右
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//置中
//背景色//https://blog.csdn.net/DrifterJ/article/details/46662277色碼表網址
		style.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		return style;
	}

}
