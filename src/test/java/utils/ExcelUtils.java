package utils;


import java.io.IOException;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtils {
	
	 String projPath = System.getProperty("user.dir");
	 static XSSFWorkbook workbook;
	 static XSSFSheet sheet;
	 
	public static void main(String[] args) throws IOException {
		getRowCount();
		getColCount();
	}
			
	public ExcelUtils(String excelPath, String sheetName) {
		try {
			workbook = new XSSFWorkbook(excelPath);
			sheet = workbook.getSheet(sheetName);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public static int getRowCount() {
		 int rowCount = sheet.getPhysicalNumberOfRows();
  		 return rowCount;	 
	}

	public static int getColCount() {
		 int colCount = sheet.getRow(0).getPhysicalNumberOfCells();
  		 return colCount;	 
	}
	
	public static String getCellDataString(int row, int col)  {
		String cellData = sheet.getRow(row).getCell(col).getStringCellValue();
		 return cellData;
	}
	
	public static double getCellDataNum(int row, int col) {
		 double cellData = sheet.getRow(row).getCell(col).getNumericCellValue();
		 return cellData;
	}
}
