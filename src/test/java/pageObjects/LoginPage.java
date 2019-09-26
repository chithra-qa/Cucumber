package pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class LoginPage {
	private static WebElement element = null;
	
	public static WebElement userLogin(WebDriver driver) {
		element = driver.findElement(By.id("UserIdentifier"));
		return element;
	}

	public static WebElement userPassword(WebDriver driver) {
		element = driver.findElement(By.id("UserPassword"));
		return element;
	}
	public static WebElement loginBtn(WebDriver driver) {
		element = driver.findElement(By.xpath("//button[@type='submit']"));
		return element;
	}
}

