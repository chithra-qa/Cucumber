package pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class LoginPageObjects {
	
	    WebDriver driver = null;
	    
        By username = By.id("UserIdentifier");
        By password = By.id("UserPassword");
        By login = By.xpath("//button[@type='submit']");
        
        public LoginPageObjects(WebDriver driver) {
        	this.driver = driver;        	
        }
        
        public void enterUsername(String text) {
        	driver.findElement(username).sendKeys(text);
        }
        
        public void enterPassword(String text) {
        	driver.findElement(password).sendKeys(text);
        }
        
        public void clickSubmit() {
        	driver.findElement(login).click();
        }
        
}
