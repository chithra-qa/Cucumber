package utils;

import org.testng.annotations.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

public class ExcelDataProvider {
	
	WebDriver driver = null;
	By username = By.id("UserIdentifier");
    By password = By.id("UserPassword");
    By loginBtn = By.xpath("//button[contains(text(),'Login')]");
    By TDC = By.id("Request_staff_id_sv");
    By PIN = By.id("Request_staff_code_sv");
    By productLocation = By.xpath("//selecr[@name='ProductLocation']");
    By continueBtn = By.xpath("//button[contains(text(),'Continue')]");
    By hideAnnBtn = By.id("announcement_hide");
    		
	@DataProvider(name = "CaseCreation")
	public Object[][] getData() {
		String excelPath = "/home/chithra/eclipse-workspace/Solvup/TestData/SolvupCaseCreation.xlsx";
		Object data[][] = testData(excelPath, "JBHIFI");
		return data;
	}
	
	@Test
	public Object[][] testData(String excelPath, String sheetName) {
		ExcelUtils excel = new ExcelUtils(excelPath, sheetName);
		
		int rowCount = excel.getRowCount();
		int colCount = excel.getColCount();
		Object data[][] = new Object[rowCount-1][colCount];
		
		for (int i=1; i<rowCount; i++) {
			for (int j=0;j<colCount;j++) {
				data[i-1][j] = excel.getCellDataString(i, j);
			}
		}
		return data;
	}
	
	@Parameters("browser")
	@BeforeTest
	public void testSetup(String browsername) {
		String projectDir = System.getProperty("user.dir");
		if(browsername.equalsIgnoreCase("chrome")) {
		System.setProperty("webdriver.chrome.driver", "/home/chithra/Downloads/chromedriver");
        driver = new ChromeDriver();
		}
		else if(browsername.equalsIgnoreCase("firefox"))
		{
			System.setProperty("webdriver.gecko.driver", "/home/chithra/Downloads/firefox.exe");
	        driver = new FirefoxDriver();
		}
		
		
        driver.navigate().to("http://test-apps.solvup.com");
        driver.manage().window().maximize();
		WebElement elemnent1 = (new WebDriverWait(driver, 40))

                .until(ExpectedConditions.elementToBeClickable(username));
    	 driver.findElement(username).sendKeys("JB0002");
    	 driver.findElement(password).sendKeys("pass");
    	 driver.findElement(loginBtn).click();
    	 driver.findElement(continueBtn).click();
    	 WebElement element2 = (new WebDriverWait(driver, 40))
                 .until(ExpectedConditions.elementToBeClickable(hideAnnBtn));
    	 driver.findElement(hideAnnBtn).click();
	}
	
	@Test(dataProvider = "CaseCreation")
	public void testLogin(String JB_TDC, String JB_PIN)
	{
    	 WebElement element3 = (new WebDriverWait(driver, 40))
                 .until(ExpectedConditions.elementToBeClickable(PIN));
    	driver.findElement(TDC).clear();
     	driver.findElement(TDC).sendKeys(JB_TDC);	
     	driver.findElement(PIN).clear();
     	driver.findElement(PIN).sendKeys(JB_PIN);
	}
	
	@Test
	public void testNavigation()
	{
		WebElement element3 = (new WebDriverWait(driver, 40))
                .until(ExpectedConditions.elementToBeClickable(PIN));
   	    driver.findElement(TDC).clear();
    	driver.findElement(TDC).sendKeys("99999");	
    	driver.findElement(PIN).clear();
    	driver.findElement(PIN).sendKeys("55555");
	}
	
	
}
