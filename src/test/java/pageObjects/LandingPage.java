package pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class LandingPage {
	private static WebElement element = null;
	
	public static WebElement email(WebDriver driver) {
		element = driver.findElement(By.id("email1"));
		return element;
	}

	public static WebElement textarea(WebDriver driver) {
		element = driver.findElement(By.xpath("//textarea"));
		return element;
	}
	
	public static WebElement action(WebDriver driver,String action) {
		element = driver.findElement(By.xpath("//textarea"));
		return element;
	}
}

